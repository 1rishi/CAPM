const cds = require('@sap/cds');
const { Books } = cds.entities;

module.exports = srv => {

    const db = cds.db;

    srv.on('READ', 'Books', async (req) => {

        const result = await db.run(SELECT.from(Books).where({ ID: req.data.ID }));
        return result;
    });
    srv.on('CREATE', 'Books', async (req) => {
        const result = await db.run(INSERT.into(Books).entries(req.data));
        return result;
    });

    srv.before('CREATE', 'Books', async (req) => {
        if (req.data.author === 'Rishi Keshari') {
            req.error(400, 'Author Rishi Keshari is not allowed to create books.');
        }
    });

    srv.on('UPDATE', 'Books', async (req) => {
        const result = await db.run(UPDATE(Books).set(req.data).where({ ID: req.data.ID }));
        return result;
    });

    srv.on('DELETE', 'Books', async (req) => {
        const result = await db.run(DELETE.from(Books).where({ ID: req.data.ID }));
        return result;
    });


}
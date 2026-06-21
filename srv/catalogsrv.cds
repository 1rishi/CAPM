using { books.db as mybooks } from '../db/booksdatamodel.cds';

service MyService @(path:'/MyService') {
    entity Books as projection on mybooks.Books;
}

service TestService @(path:'/TestService') {
    entity Header as projection on mybooks.Header;
    entity Items as projection on mybooks.Items;
}

Service SalesOrderService @(path:'/SalesOrderService') {
    entity SalesOrderHeader as projection on mybooks.SalesOrderHeader;
    entity SalesOrderItem as projection on mybooks.SalesOrderItem;
}

annotate MyService.Books with @(

    UI: {
        SelectionFields: [
           Title, author, price, publishedDate, digitalCopyAvailable
        ],
        LineItem  : [
            {$Type: 'UI.DataField', Value: Title},
            {$Type: 'UI.DataField', Value: author},
            {$Type: 'UI.DataField', Value: price},
            {$Type: 'UI.DataField', Value: publishedDate},
            {$Type: 'UI.DataField', Value: digitalCopyAvailable}
            
        ],
    }
   
)
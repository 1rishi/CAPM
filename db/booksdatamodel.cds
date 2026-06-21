namespace books.db;

entity Books {
    key ID                   : UUID;
        Title                : String;
        author               : String;
        price                : Decimal(10, 2);
        publishedDate        : DateTime;
        digitalCopyAvailable : Boolean;

}

entity Header {
    key ID           : UUID;
        description  : String;
        item_details : Association to many Items
                           on item_details.headerID = $self.ID;
}

entity Items {
    key ID        : UUID;
        headerID  : UUID;
        itemName  : String;
        itemPrice : Decimal(10, 2);
}


entity SalesOrderHeader {
    key ID              : UUID;
        orderNumber     : String;
        orderDate       : DateTime;
        customerName    : String;
        totalAmount     : Decimal(10, 2);
        itemdetailscomp : Composition of many SalesOrderItem
                              on itemdetailscomp.header = $self;
}

entity SalesOrderItem {
    key ID          : UUID;
        header      : Association to SalesOrderHeader;
        productName : String;
        quantity    : Integer;
        unitPrice   : Decimal(10, 2);
        totalPrice  : Decimal(10, 2);
}

using { PurchaseOrder } from './external/PurchaseOrder.cds';

@path : '/service/PurchaseOrderSvcs'
service PurchaseOrderService
{
    entity A_PurchaseOrder as
        projection on PurchaseOrder.A_PurchaseOrder
        {
            PurchaseOrder,
            CompanyCode,
            Supplier,
            PurchaseOrderDate,
            AddressName,
            to_PurchaseOrderItem : redirected to PurchaseOrderService.A_PurchaseOrderItem
        };

    entity A_PurchaseOrderItem as
        projection on PurchaseOrder.A_PurchaseOrderItem
        {
            PurchaseOrderItem,
            Plant,
            OrderQuantity,
            NetPriceAmount,
            Material,
            DeliveryAddressName,
            to_PurchaseOrder
        };
}

annotate PurchaseOrderService with @requires :
[
    'authenticated-user'
];

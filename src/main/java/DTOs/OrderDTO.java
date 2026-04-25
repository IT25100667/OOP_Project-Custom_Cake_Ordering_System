package DTOs;

import com.example.jooq.tables.TblCakeOrders;
import com.example.jooq.tables.records.TblCakeOrdersRecord;
import com.example.jooq.tables.records.TblCustomOrderInfoRecord;
import org.jooq.Record2;

import java.time.LocalDate;

public class OrderDTO {
    public int order_id;
    public int customer_id;
    public int product_id;
    public int quantity;
    public LocalDate date_of_order;
    public int order_status;
    public CustomOrderInfoDTO custom_order_info;

    public OrderDTO(int order_id, int customer_id, int product_id, int quantity, LocalDate date_of_order, int order_status) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.date_of_order = date_of_order;
        this.order_status = order_status;
    }

    public OrderDTO(TblCakeOrdersRecord record){
        this.order_id = record.getOrderId();
        this.customer_id = record.getCustomerId();
        this.product_id = record.getProductId();
        this.quantity = record.getQuantity();
        this.date_of_order = record.getDateOfOrder();
        this.order_status = record.getOrderStatus();
    }

    public OrderDTO(Record2<TblCakeOrdersRecord, TblCustomOrderInfoRecord> tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2) {
        this.order_id = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getOrderId();
        this.customer_id = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getCustomerId();
        this.product_id = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getProductId();
        this.quantity = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getQuantity();
        this.date_of_order = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getDateOfOrder();
        this.order_status = tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component1().getOrderStatus();
        this.custom_order_info = new CustomOrderInfoDTO(tblCakeOrdersRecordTblCustomOrderInfoRecordRecord2.component2());
    }

    public TblCakeOrdersRecord getRecord(){
        return new TblCakeOrdersRecord(order_id, customer_id, product_id, quantity, date_of_order, order_status);
    }


}

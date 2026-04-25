package DTOs;

import com.example.jooq.tables.TblCustomShoppingCartInfo;
import com.example.jooq.tables.TblShoppingCartItems;
import com.example.jooq.tables.records.TblCustomShoppingCartInfoRecord;
import com.example.jooq.tables.records.TblShoppingCartItemsRecord;
import org.jooq.Record2;
import org.jooq.UpdatableRecord;

public class ShoppingCartItemDTO {
    public int id;
    public int user_id;
    public int product_id;
    public int quantity_ordered;
    public ShoppingCartCustomInfoDTO shoppingCartCustomOrderInfoDTO;

    public ShoppingCartItemDTO(int id, int user_id, int product_id, int quantity_ordered, ShoppingCartCustomInfoDTO shoppingCartCustomOrderInfoDTO) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.quantity_ordered = quantity_ordered;
        this.shoppingCartCustomOrderInfoDTO = shoppingCartCustomOrderInfoDTO;
    }

    public ShoppingCartItemDTO(Record2<TblShoppingCartItemsRecord, TblCustomShoppingCartInfoRecord> shoppingCartItemsRecord){
        this.id = shoppingCartItemsRecord.component1().getId();
        this.user_id = shoppingCartItemsRecord.component1().getUserId();
        this.product_id = shoppingCartItemsRecord.component1().getProductId();
        this.quantity_ordered = shoppingCartItemsRecord.component1().getQuantityOrdered();
        this.shoppingCartCustomOrderInfoDTO = new ShoppingCartCustomInfoDTO(shoppingCartItemsRecord.component2());
    }

    public TblShoppingCartItemsRecord getRecord(){
        TblShoppingCartItemsRecord record = new TblShoppingCartItemsRecord();
        record.setId(id);
        record.setUserId(user_id);
        record.setProductId(product_id);
        record.setQuantityOrdered(quantity_ordered);
        return record;
    }
}

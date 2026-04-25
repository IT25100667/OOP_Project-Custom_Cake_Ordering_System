package DTOs;

import com.example.jooq.tables.records.TblCustomOrderInfoRecord;
import com.example.jooq.tables.records.TblCustomShoppingCartInfoRecord;

public class ShoppingCartCustomInfoDTO {
    public int id;
    public int shopping_cart_item_id;
    public int modifier_id;
    public int modifierValueId;

    public ShoppingCartCustomInfoDTO(int shopping_cart_item_id, int modifier_id, int modifierValueId) {
        this.shopping_cart_item_id = shopping_cart_item_id;
        this.modifier_id = modifier_id;
        this.modifierValueId = modifierValueId;
    }

    public ShoppingCartCustomInfoDTO(int id, int shopping_cart_item_id, int modifier_id, int modifierValueId) {
        this.id = id;
        this.shopping_cart_item_id = shopping_cart_item_id;
        this.modifier_id = modifier_id;
        this.modifierValueId = modifierValueId;
    }

    public ShoppingCartCustomInfoDTO(TblCustomShoppingCartInfoRecord tblCustomShoppingCartInfoRecord) {
        this.id = tblCustomShoppingCartInfoRecord.getCustomOrderId();
        this.shopping_cart_item_id = tblCustomShoppingCartInfoRecord.getShoppingCartItemId();
        this.modifier_id = tblCustomShoppingCartInfoRecord.getModifierId();
        this.modifierValueId = tblCustomShoppingCartInfoRecord.getModifierValueId();
    }

    public TblCustomShoppingCartInfoRecord getRecord(){
        TblCustomShoppingCartInfoRecord customOrderInfo = new TblCustomShoppingCartInfoRecord();
        customOrderInfo.setCustomOrderId(id);
        customOrderInfo.setShoppingCartItemId(shopping_cart_item_id);
        customOrderInfo.setModifierId(modifierValueId);
        customOrderInfo.setModifierValueId(modifierValueId);
        return customOrderInfo;
    }
}

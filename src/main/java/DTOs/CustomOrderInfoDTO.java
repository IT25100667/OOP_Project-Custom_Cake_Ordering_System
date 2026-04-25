package DTOs;

import com.example.jooq.tables.TblCustomOrderInfo;
import com.example.jooq.tables.records.TblCustomOrderInfoRecord;
import com.example.jooq.tables.records.TblShoppingCartItemsRecord;

public class CustomOrderInfoDTO {
    public int id;
    public int order_id;
    public int modifier_id;
    public int modifierValueId;

    public CustomOrderInfoDTO(int order_id, int modifier_id, int modifierValueId) {
        this.order_id = order_id;
        this.modifier_id = modifier_id;
        this.modifierValueId = modifierValueId;
    }

    public CustomOrderInfoDTO(int id,int order_id, int modifier_id, int modifierValueId) {
        this.id = id;
        this.order_id = order_id;
        this.modifier_id = modifier_id;
        this.modifierValueId = modifierValueId;
    }

    public CustomOrderInfoDTO(TblCustomOrderInfoRecord tblCustomOrderInfoRecord) {
        this.id = tblCustomOrderInfoRecord.getCustomOrderId();
        this.order_id = tblCustomOrderInfoRecord.getOrderId();
        this.modifier_id = tblCustomOrderInfoRecord.getModifierId();
        this.modifierValueId = tblCustomOrderInfoRecord.getModifierValueId();
    }

    public TblCustomOrderInfoRecord getRecord(){
        return getRecord(false);
    }

    public TblCustomOrderInfoRecord getRecord(boolean includeId){
        TblCustomOrderInfoRecord customOrderInfo = new TblCustomOrderInfoRecord();
        if(includeId) customOrderInfo.setCustomOrderId(id);
        customOrderInfo.setOrderId(order_id);
        customOrderInfo.setModifierId(modifierValueId);
        customOrderInfo.setModifierValueId(modifierValueId);
        return customOrderInfo;
    }
}

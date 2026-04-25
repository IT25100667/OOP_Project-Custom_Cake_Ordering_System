package com.example.custom_cake_system.data_access;
import DTOs.ShoppingCartItemDTO;
import models.Response;
import static com.example.jooq.tables.TblShoppingCartItems.TBL_SHOPPING_CART_ITEMS;
import static com.example.jooq.tables.TblCustomShoppingCartInfo.TBL_CUSTOM_SHOPPING_CART_INFO;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

@Repository
public class ShoppingCartRepository {

    DSLContext _context;
    public ShoppingCartRepository(DSLContext _context) {
        this._context = _context;
    }

    public Response insertIntoShoppingCart(ShoppingCartItemDTO item){
        try{
            item.getRecord().store();
            item.shoppingCartCustomOrderInfoDTO.getRecord().store();
            return new Response();
        }
        catch (Exception ex){
            return new Response(false, ex.getMessage());
        }
    }

    public Response removeFromShoppingCart(int id){
        try{
            _context.delete(TBL_SHOPPING_CART_ITEMS).where(TBL_SHOPPING_CART_ITEMS.ID.eq(id));
            return new Response();
        }
        catch (Exception ex){
            return new Response(false);
        }
    }

    public Response updateShoppingCart(ShoppingCartItemDTO item){
        try{
            _context.update(TBL_SHOPPING_CART_ITEMS).set(item.getRecord()).where(TBL_SHOPPING_CART_ITEMS.ID.eq(item.id));
            _context.update(TBL_CUSTOM_SHOPPING_CART_INFO).set(item.shoppingCartCustomOrderInfoDTO.getRecord())
                    .where(TBL_CUSTOM_SHOPPING_CART_INFO.CUSTOM_ORDER_ID
                    .eq(item.shoppingCartCustomOrderInfoDTO.shopping_cart_item_id));
            return new Response();
        }
        catch (Exception e) {
            return new Response(false,e.getMessage());
        }
    }
}

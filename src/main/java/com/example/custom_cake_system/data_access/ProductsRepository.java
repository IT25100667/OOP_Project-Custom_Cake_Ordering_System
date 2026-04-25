package com.example.custom_cake_system.data_access;

import models.Response;
import DTOs.ProductDTO;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.jooq.tables.TblProducts.TBL_PRODUCTS;


@Repository
public class ProductsRepository {
    DSLContext _context;

    public ProductsRepository(DSLContext _context) {
        this._context = _context;
    }

    public Response createProduct(ProductDTO productDTO) {
        try {
            productDTO.getRecord().store(); //basically maps DTO to product object row
            return new Response(true);
        } catch (Exception ex) {
            return new Response(false, ex.getMessage());
        }
    }

    public Response updateProduct(ProductDTO productDTO) {
        try {
            _context.update(TBL_PRODUCTS).set(productDTO.getRecord()).where(TBL_PRODUCTS.PRODUCT_ID.eq(productDTO.id));
            return new Response(true);
        } catch (Exception ex) {
            return new Response(false, ex.getMessage());
        }
    }

    public Response deleteProduct(ProductDTO productDTO){
        try {
            _context.delete(TBL_PRODUCTS).where(TBL_PRODUCTS.PRODUCT_ID.eq(productDTO.id));
            return new Response(true);
        } catch (Exception ex) {
            return new Response(false, ex.getMessage());
        }
    }

    public List<ProductDTO> getProducts() {
        return _context.selectFrom(TBL_PRODUCTS).stream().toList().stream()
                .map(x -> new ProductDTO(x)).collect(Collectors.toList());
        //converts the entire list into a DTO list
    }

    public List<ProductDTO> getProducts(String searchTerm) {
        return _context.selectFrom(TBL_PRODUCTS).
                where(TBL_PRODUCTS.PRODUCT_DESCRIPTION.contains(searchTerm))
                .or(TBL_PRODUCTS.PRODUCT_NAME.contains(searchTerm))
                .stream().toList().stream()
                .map(x -> new ProductDTO(x)).collect(Collectors.toList());
    }

}

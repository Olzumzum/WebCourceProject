package org.example.tt.repos;

import org.example.tt.domain.ItemSale;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemSaleRepo extends CrudRepository<ItemSale, Long> {
    List<ItemSale> findItemSaleByItemProduct_NameItemProduct(String nameProduct);
    List<ItemSale> findDistinctByAmountBetween(int min, int max);
    List<ItemSale> findDistinctByItemProduct_PriceIsBetween(int max, int min);
}

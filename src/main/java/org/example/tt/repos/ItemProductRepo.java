package org.example.tt.repos;

import org.example.tt.domain.AgeCategory;
import org.example.tt.domain.ItemProduct;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemProductRepo extends CrudRepository<ItemProduct, Long> {
    ItemProduct findItemProductByIdItemProduct(int id);
    List<ItemProduct> findItemProductByNameItemProduct(String name);
    List<ItemProduct> findDistinctByPriceBetween(int min, int max);
    List<ItemProduct> findItemProductByAgeCategory(String ageCategory);
    List<ItemProduct> findAllByOrderByNameItemProduct();
}

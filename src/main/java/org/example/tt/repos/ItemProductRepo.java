package org.example.tt.repos;

import org.example.tt.domain.ItemProduct;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemProductRepo extends CrudRepository<ItemProduct, Long> {
    ItemProduct findItemProductByIdItemProduct(int id);
    List<ItemProduct> findItemProductByNameItemProduct(String name);
}

package org.example.tt.repos;

import org.example.tt.domain.ItemProduct;
import org.springframework.data.repository.CrudRepository;

public interface ItemProductRepo extends CrudRepository<ItemProduct, Long> {
}

package org.example.tt.repos;


import org.example.tt.domain.ItemProduct;
import org.example.tt.domain.StockAvailability;
import org.example.tt.domain.Stores;
import org.springframework.data.repository.CrudRepository;

public interface StockAvailabilityRepo extends CrudRepository<StockAvailability, Long> {
    StockAvailability findStockAvailabilityByItemProductAndStores(ItemProduct itemProduct, Stores stores);
}

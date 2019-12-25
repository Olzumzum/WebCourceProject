package org.example.tt.repos;

import org.example.tt.domain.StockAvailability;
import org.springframework.data.repository.CrudRepository;

public interface StockAvailabilityRepo extends CrudRepository<StockAvailability, Long> {
}

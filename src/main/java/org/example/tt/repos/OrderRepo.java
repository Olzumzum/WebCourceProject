package org.example.tt.repos;

import org.example.tt.domain.Order;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepo extends CrudRepository<Order, Long> {
}

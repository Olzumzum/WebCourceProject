package org.example.tt.repos;

import org.apache.catalina.Store;
import org.example.tt.domain.Stores;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StoresRepo extends CrudRepository<Stores, Long> {

    List<Stores> findByNameStore(String nameFilter);
}

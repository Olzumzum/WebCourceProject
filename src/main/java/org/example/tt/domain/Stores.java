package org.example.tt.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Collection;

/**
 * объект хранит информацию о существующих складах
 */
@Entity
public class Stores {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idStore;

    private String nameStore;

    private String addressStore;

    private String filename;

    public Stores() {
    }

    public Stores(String nameStore, String addressStore){
        this.nameStore = nameStore;
        this.addressStore = addressStore;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getIdStore() {
        return idStore;
    }

    public void setIdStore(int idStore) {
        this.idStore = idStore;
    }

    public String getNameStore() {
        return nameStore;
    }

    public void setNameStore(String nameStore) {
        this.nameStore = nameStore;
    }

    public String getAddressStore() {
        return addressStore;
    }

    public void setAddressStore(String addressStore) {
        this.addressStore = addressStore;
    }

//    @ManyToMany(mappedBy = "stores")
//    private Collection<StockAvailability> stockAvailabilities;
//
//    public Collection<StockAvailability> getStockAvailabilities() {
//        return stockAvailabilities;
//    }
//
//    public void setStockAvailabilities(Collection<StockAvailability> stockAvailabilities) {
//        this.stockAvailabilities = stockAvailabilities;
//    }
}

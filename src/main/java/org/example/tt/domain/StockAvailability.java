package org.example.tt.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * бин, который хранит в себе информацию
 * на каком складе сколько одного itemProduct содержится
 */
@Entity
public class StockAvailability {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idStockAvailability;

    private int idStore;

    private int amount;

    public StockAvailability() {
    }

    public int getIdStockAvailability() {
        return idStockAvailability;
    }

    public void setIdStockAvailability(int idStockAvailability) {
        this.idStockAvailability = idStockAvailability;
    }

    public int getIdStore() {
        return idStore;
    }

    public void setIdStore(int idStore) {
        this.idStore = idStore;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

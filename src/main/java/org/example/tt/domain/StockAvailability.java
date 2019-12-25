package org.example.tt.domain;

import javax.persistence.*;

/**
 * бин, который хранит в себе информацию
 * на каком складе сколько одного itemProduct содержится
 */
@Entity
public class StockAvailability {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idStockAvailability;

//    @OneToMany(fetch = FetchType.EAGER, targetEntity = Stores.class)
//    @JoinColumn(name = "id_store")
//    private Stores stores;

    private int amount;

    public StockAvailability() {

    }

    public StockAvailability(int amount) {
        this.amount = amount;
    }

    public int getId() {
        return idStockAvailability;
    }

    public void setId(int id) {
        this.idStockAvailability = id;
    }

//    public Stores getStores() {
//        return stores;
//    }
//
//    public void setStores(Stores stores) {
//        this.stores = stores;
//    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

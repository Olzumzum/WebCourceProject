package org.example.tt.domain;

import org.apache.catalina.Store;

import javax.persistence.*;

@Entity
public class StockAvailability {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idStockAvail;

    private int amountItemProduct;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stores")
    private Stores stores;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_item_product")
    private ItemProduct itemProduct;

    public StockAvailability() {
    }

    public int getIdStockAvail() {
        return idStockAvail;
    }

    public void setIdStockAvail(int idStockAvail) {
        this.idStockAvail = idStockAvail;
    }

    public int getAmountItemProduct() {
        return amountItemProduct;
    }

    public void setAmountItemProduct(int amountItemProduct) {
        this.amountItemProduct = amountItemProduct;
    }

    public Stores getStore() {
        return stores;
    }

    public void setStore(Stores stores) {
        this.stores = stores;
    }

    public ItemProduct getItemProduct() {
        return itemProduct;
    }

    public void setItemProduct(ItemProduct itemProduct) {
        this.itemProduct = itemProduct;
    }
}

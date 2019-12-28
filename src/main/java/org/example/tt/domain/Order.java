package org.example.tt.domain;

import org.apache.catalina.Store;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "my_orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idOrder;

    @ManyToOne
    @JoinColumn(name = "id_item_product")
    private ItemProduct itemProduct;

    @ManyToOne
    @JoinColumn(name = "id_store")
    private Stores stores;

    private int amount;


    public Order() {
    }

    public Order(int amounOrder) {
        this.amount = amounOrder;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public ItemProduct getItemProduct() {
        return itemProduct;
    }

    public void setItemProduct(ItemProduct itemProduct) {
        this.itemProduct = itemProduct;
    }

    public Stores getStores() {
        return stores;
    }

    public void setStores(Stores stores) {
        this.stores = stores;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

package org.example.tt.domain;

import javax.persistence.*;

@Entity
public class ItemSale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int idItemSale;

    /** количество единиц товара, которое приобрели*/
    private int amount;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "i_item_prouct")
    private ItemProduct itemProduct;

    private int finalScore;

    public ItemSale() {
    }

    public ItemSale(int amount){
        this.amount = amount;
    }

    public ItemSale (ItemProduct itemProduct, int amount, int finalScore){
        this.itemProduct = itemProduct;
        this.amount = amount;
        this.finalScore = finalScore;
    }

    public int getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(int finalScore) {
        this.finalScore = finalScore;
    }

    public int getIdItemSale() {
        return idItemSale;
    }

    public void setIdItemSale(int idItemSale) {
        this.idItemSale = idItemSale;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public ItemProduct getItemProduct() {
        return itemProduct;
    }

    public void setItemProduct(ItemProduct itemProduct) {
        this.itemProduct = itemProduct;
    }
}

package org.example.tt.domain;


import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "item_product")
public class ItemProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idItemProduct;

    private String nameItemProduct;
    private int price;
    private String fileName;

    @Enumerated(EnumType.STRING)
    private AgeCategory ageCategorySet;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_id")
    private SupplierCompany supplierCompany;

    public ItemProduct() {
    }

    public ItemProduct(String nameItemProduct, int price) {
        this.nameItemProduct = nameItemProduct;
        this.price = price;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getIdItemProduct() {
        return idItemProduct;
    }

    public void setIdItemProduct(int idItemProduct) {
        this.idItemProduct = idItemProduct;
    }

    public String getNameItemProduct() {
        return nameItemProduct;
    }

    public void setNameItemProduct(String nameItemProduct) {
        this.nameItemProduct = nameItemProduct;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public AgeCategory getAgeCategorySet() {
        return ageCategorySet;
    }

    public void setAgeCategorySet(AgeCategory ageCategorySet) {
        this.ageCategorySet = ageCategorySet;
    }

    public SupplierCompany getSupplierCompany() {
        return supplierCompany;
    }

    public void setSupplierCompany(SupplierCompany supplierCompany) {
        this.supplierCompany = supplierCompany;
    }
}

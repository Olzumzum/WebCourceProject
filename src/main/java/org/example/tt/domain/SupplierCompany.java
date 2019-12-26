package org.example.tt.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SupplierCompany {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSupplier;

    private String nameSupplier;

    public SupplierCompany() {
    }

    public SupplierCompany(String nameSupplier){
        this.nameSupplier = nameSupplier;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public String getNameSupplier() {
        return nameSupplier;
    }

    public void setNameSupplier(String nameSupplier) {
        this.nameSupplier = nameSupplier;
    }
}

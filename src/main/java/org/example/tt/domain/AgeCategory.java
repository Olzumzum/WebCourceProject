package org.example.tt.domain;

public enum AgeCategory {
    SMALL, MEDIUM, ELDER;

    public String getAgeCategory(){
        return name();
    }
}

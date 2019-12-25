package org.example.tt.controller;

import org.example.tt.domain.StockAvailability;
import org.example.tt.repos.StockAvailabilityRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

/**
 * работает с репозиторием наличия товара (itemProduct)
 * на складе (Stores)
 */
@Controller
public class StockvailabilityController {
    @Autowired
    private StockAvailabilityRepo stockAvailabilityRepo;

    /**
     * возвращает список складов и наличие товаров
     * @param model
     */
    @GetMapping
    private void getListStockAvailability(Map<String, Object> model){
        Iterable<StockAvailability> tabelStockAvailability = stockAvailabilityRepo.findAll();

        //возможно, должен возвращать таблицу наличия
    }
}

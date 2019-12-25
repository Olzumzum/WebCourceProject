package org.example.tt.controller;

import org.example.tt.domain.StockAvailability;
import org.example.tt.domain.Stores;
import org.example.tt.repos.StockAvailabilityRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
     *
     * @param model
     */
    @GetMapping("/stockavailability")
    private String getListStockAvailability(Map<String, Object> model) {
        Iterable<StockAvailability> stockAvailability = stockAvailabilityRepo.findAll();

        model.put("stockAvailability", stockAvailability);

        return "stockavailability";
    }

    @PostMapping("/stockavailability")
    private String addStockAvailAbility(
            @RequestParam int stores,
            @RequestParam int amount,
            Map<String, Object> model
    ) {
        StockAvailability stock = new StockAvailability(amount);
        stockAvailabilityRepo.save(stock);

        Iterable<StockAvailability> stockAvailability = stockAvailabilityRepo.findAll();
        model.put("stockAvailability", stockAvailability);

        return "stockavailability";
    }
}

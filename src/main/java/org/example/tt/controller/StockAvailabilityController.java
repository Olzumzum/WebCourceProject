package org.example.tt.controller;

import org.example.tt.domain.ItemProduct;
import org.example.tt.domain.Order;
import org.example.tt.domain.StockAvailability;
import org.example.tt.domain.Stores;
import org.example.tt.repos.ItemProductRepo;
import org.example.tt.repos.OrderRepo;
import org.example.tt.repos.StockAvailabilityRepo;
import org.example.tt.repos.StoresRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StockAvailabilityController {
    @Autowired
    private StockAvailabilityRepo stockRepo;
    @Autowired
    private ItemProductRepo itemProductRepo;
    @Autowired
    private StoresRepo storesRepo;
    @Autowired
    private OrderRepo orderRepo;

    @GetMapping("/stockavailability")
    public String getStockAbilList(Model model) {
        Iterable<StockAvailability> stockAvailabilities = stockRepo.findAll();

        model.addAttribute("stockList", stockAvailabilities);
        return "stockavailability";
    }

    @GetMapping("/order")
    public String showFormAddOrder(Model model) {
        model.addAttribute("itemProductList", itemProductRepo.findAll());
        model.addAttribute("storesList", storesRepo.findAll());
        model.addAttribute("message","");
        return "order";
    }

    @PostMapping("/order")
    public String addOrder(Model model,
                           @RequestParam String nameProduct,
                           @RequestParam String nameStore,
                           @RequestParam int amountOrder) {
        Order order = new Order(amountOrder);
        Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();

        for (ItemProduct itemProduct : itemProducts) {
            if (itemProduct.getNameItemProduct().equals(nameProduct)) {
                order.setItemProduct(itemProduct);
            }
        }

        Iterable<Stores> stores = storesRepo.findAll();
        for (Stores store : stores) {
            if (store.getNameStore().equals(nameStore)) {
                order.setStores(store);
            }
        }

        model.addAttribute("itemProductList", itemProductRepo.findAll());
        model.addAttribute("storesList", storesRepo.findAll());
        model.addAttribute("message", "");

        if (countingProduct(order))
            orderRepo.save(order);
        else {
            model.addAttribute("message", "На складе недостаточно продукции дя вашего заказа");
            return "order";
        }

        model.addAttribute("orders", orderRepo.findAll());
        return "ordersList";
    }

    @GetMapping("/ordersList")
    public String showOrdersList(Model model){
        model.addAttribute("message", "");
        model.addAttribute("orders", orderRepo.findAll());
        return "ordersList";
    }

    private boolean countingProduct(Order order) {
        StockAvailability stockAbl = stockRepo.
                findStockAvailabilityByItemProductAndStores(
                        order.getItemProduct(),
                        order.getStores());

        int orderAmount = order.getAmount();
        int stockAmount = stockAbl.getAmountItemProduct();

        if (orderAmount <= stockAmount) {
            int totalAmount = stockAmount - orderAmount;
            if (totalAmount > 0) {
                stockAbl.setAmountItemProduct(totalAmount);
                stockRepo.save(stockAbl);
            } else
                stockRepo.delete(stockAbl);
            return true;
        } else return false;
    }
}

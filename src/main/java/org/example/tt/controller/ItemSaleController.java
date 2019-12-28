package org.example.tt.controller;

import org.example.tt.domain.ItemProduct;
import org.example.tt.domain.ItemSale;
import org.example.tt.repos.ItemProductRepo;
import org.example.tt.repos.ItemSaleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ItemSaleController {
    @Autowired
    private ItemSaleRepo itemSaleRepo;

    @Autowired
    private ItemProductRepo itemProductRepo;

    @GetMapping("/allChecks")
    public String getAllChecks(Model model) {
        model.addAttribute("itemsales", itemSaleRepo.findAll());
        model.addAttribute("itemproducts", itemProductRepo.findAll());
        return "allChecks";
    }

    @PostMapping("/allChecks")
    public String setAllChecks(Model model,
                               @RequestParam int amountProd,
                               @RequestParam String nameProduct) {
        ItemSale itemSale = new ItemSale(amountProd);

        Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();
        for (ItemProduct itemProduct : itemProducts) {
            if (itemProduct.getNameItemProduct().equals(nameProduct)) {
                int finalScore = amountProd * itemProduct.getPrice();
                itemSale.setItemProduct(itemProduct);
                itemSale.setFinalScore(finalScore);
            }
        }

        itemSaleRepo.save(itemSale);

        model.addAttribute("itemsales", itemSaleRepo.findAll());

        return "redirect:/allChecks";
    }

    @GetMapping("/itemsale")
    public String getItemSaleList(Model model) {
        Iterable<ItemSale> totalList = totaleSale();

        model.addAttribute("itemproducts", itemProductRepo.findAll());
        if (totalList != null)
            model.addAttribute("totalList", totalList);
        else
            model.addAttribute("totalList", itemSaleRepo.findAll());
        return "itemsale";
    }

    @PostMapping("/itemsale")
    public String setItemSaleList(Model model,
                                  @RequestParam int amountProd,
                                  @RequestParam String nameProduct) {

        ItemSale itemSale = new ItemSale(amountProd);

        Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();
        for (ItemProduct itemProduct : itemProducts) {
            if (itemProduct.getNameItemProduct().equals(nameProduct)) {
                int finalScore = amountProd * itemProduct.getPrice();
                itemSale.setItemProduct(itemProduct);
                itemSale.setFinalScore(finalScore);
            }
        }

        itemSaleRepo.save(itemSale);

        model.addAttribute("itemsales", itemSaleRepo.findAll());
        model.addAttribute("totalList", totaleSale());

        return "redirect:/itemsale";
    }

    /**
     * вычисление общих продаж по каждому элементу продукции
     *
     * @return
     */
    private Iterable<ItemSale> totaleSale() {
        List<ItemSale> totaleSale = new ArrayList<>();


        Iterable<ItemSale> itemSales = itemSaleRepo.findAll();

        if (itemSaleRepo.count() != 0) {
            Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();


            for (ItemProduct itemProduct : itemProducts) {
                int i = totaleSale.size();
                boolean flag = false;
                for (ItemSale itemSale : itemSales) {
                    if (itemSale.getItemProduct().getIdItemProduct() == itemProduct.getIdItemProduct()) {
                        /** подсчет общей стоимости и количества*/
                        int totalePrice = itemSale.getFinalScore();
                        int totalAmount = itemSale.getAmount();

                        if (!flag) {
                            ItemSale newItemTotalSale = new ItemSale(itemProduct, totalAmount, totalePrice);
                            totaleSale.add(newItemTotalSale);
                            flag = true;
                        } else {
                            totalePrice += totaleSale.get(i).getFinalScore();
                            totalAmount += totaleSale.get(i).getAmount();

                            totaleSale.get(i).setAmount(totalAmount);
                            totaleSale.get(i).setFinalScore(totalePrice);
                        }

                    }
                }

            }
        }

        return totaleSale;
    }
}

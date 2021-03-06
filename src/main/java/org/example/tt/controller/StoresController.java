package org.example.tt.controller;

import org.example.tt.domain.Stores;
import org.example.tt.repos.StoresRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/stores")
public class StoresController {
    @Autowired
    private StoresRepo storesRepo;

    @GetMapping
    public String main(@RequestParam(required = false, defaultValue = "") String nameFilter,
                       Model model) {
        Iterable<Stores> stores;

        if (nameFilter != null && !nameFilter.isEmpty()) {
            stores = storesRepo.findByNameStore(nameFilter);
        } else {
            stores = storesRepo.findAll();
        }

        model.addAttribute("stores", stores);
        model.addAttribute("nameFilter", nameFilter);
        return "stores";
    }

    @PostMapping
    public String addStore(
            @RequestParam String nameStore,
            @RequestParam String addressStore,
            Map<String, Object> model) {

        Stores store = new Stores(nameStore, addressStore);
        storesRepo.save(store);

        Iterable<Stores> stores = storesRepo.findAll();
        model.put("stores", stores);
        return "stores";
    }
}

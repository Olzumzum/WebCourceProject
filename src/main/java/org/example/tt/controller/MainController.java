package org.example.tt.controller;

import org.example.tt.domain.Stores;
import org.example.tt.domain.User;
import org.example.tt.repos.StoresRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private StoresRepo storesRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        Iterable<Stores> stores = storesRepo.findAll();

        model.put("stores", stores);
        return "main";
    }

    @PostMapping("/main")
    public String addStore(
            @RequestParam String nameStore, @
            RequestParam String addressStore,
            Map<String, Object> model) {
        Stores store = new Stores(nameStore, addressStore);
        storesRepo.save(store);

        Iterable<Stores> stores = storesRepo.findAll();
        model.put("stores", stores);
        return "main";
    }

    @PostMapping("/filter")
    public String filter(@RequestParam String nameFilter, Map<String, Object> model) {
        Iterable<Stores> stores;

        if (nameFilter != null && !nameFilter.isEmpty()) {
            stores = storesRepo.findByNameStore(nameFilter);
        } else {
            stores = storesRepo.findAll();
        }

        model.put("stores", stores);
        return "main";
    }
}

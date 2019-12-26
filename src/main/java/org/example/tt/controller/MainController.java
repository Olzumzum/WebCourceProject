package org.example.tt.controller;

import org.example.tt.domain.Stores;
import org.example.tt.repos.StoresRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private StoresRepo storesRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
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
        return "main";
    }

    @PostMapping("/main")
    public String addStore(
            @RequestParam("file") MultipartFile file,
            @RequestParam String nameStore,
            @RequestParam String addressStore,
            Map<String, Object> model) throws IOException {

        Stores store = new Stores(nameStore, addressStore);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));


            store.setFilename(resultFilename);
        }
        storesRepo.save(store);

        Iterable<Stores> stores = storesRepo.findAll();
        model.put("stores", stores);
        return "main";
    }


}

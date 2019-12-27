package org.example.tt.controller;

import org.example.tt.domain.AgeCategory;
import org.example.tt.domain.ItemProduct;
import org.example.tt.domain.SupplierCompany;
import org.example.tt.repos.ItemProductRepo;
import org.example.tt.repos.SupplierCompanyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/itemproducts")
public class ItemProductController {
    @Autowired
    private ItemProductRepo itemProductRepo;

    @Autowired
    private SupplierCompanyRepo supplierCompanyRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @PostMapping
    public String addSupplier(
            @RequestParam String nameitemProduct,
            @RequestParam int price,
            @RequestParam("file") MultipartFile file,
            @RequestParam(required = false) String ageCategory,
            @RequestParam(required = false) String supplier,
            Model model
    ) throws IOException {
        int idSuppier = Integer.parseInt(supplier);

        ItemProduct itemProduct = new ItemProduct(nameitemProduct, price);

        /** получаем путь и записываем имя изображения */
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));


            itemProduct.setFileName(resultFilename);
        }

        /**получаем список всех поставщиков */
        Iterable<SupplierCompany> supplierCompanies = supplierCompanyRepo.findAll();
        /** записываем поставщика */
        for (SupplierCompany s : supplierCompanies) {
            if (s.getIdSupplier() == idSuppier)
                itemProduct.setSupplierCompany(s);
        }

        /**получаем список всех возрастных категорий */
        Set<String> ageCategories = Arrays.stream(AgeCategory.values())
                .map(AgeCategory::name)
                .collect(Collectors.toSet());

        /** заполняем поле возраста */
        for (String age : ageCategories) {
            if (age.contains(ageCategory))
                itemProduct.setAgeCategory(age);
        }


        itemProductRepo.save(itemProduct);

        model.addAttribute("itemproducts", itemProductRepo.findAll());
        return "redirect:/itemproducts";
    }

    @GetMapping
    public String getSupplierList(Model model) {
        /**получаем список всех поставщиков */
        Iterable<SupplierCompany> supplierCompanies = supplierCompanyRepo.findAll();

        model.addAttribute("itemproducts", itemProductRepo.findAll());
        model.addAttribute("suppliers", supplierCompanies);
        model.addAttribute("agecategories", AgeCategory.values());

        return "itemproducts";
    }

    @GetMapping("{itemId}")
    public String deleteProduct(@PathVariable int itemId, Model model){
        ItemProduct itemProduct = null;
        Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();

        for (ItemProduct item : itemProducts){
            if(itemId == item.getIdItemProduct())
                itemProduct = item;
        }

        itemProductRepo.delete(itemProduct);
        model.addAttribute("itemproducts", itemProductRepo.findAll());
      return "redirect:/itemproducts";
    }
}

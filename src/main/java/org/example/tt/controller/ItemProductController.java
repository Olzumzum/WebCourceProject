package org.example.tt.controller;

import org.example.tt.domain.AgeCategory;
import org.example.tt.domain.ItemProduct;
import org.example.tt.domain.Role;
import org.example.tt.domain.SupplierCompany;
import org.example.tt.repos.ItemProductRepo;
import org.example.tt.repos.SupplierCompanyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/itemproducts")
public class ItemProductController {
    @Autowired
    private ItemProductRepo itemProductRepo;
    private SupplierCompanyRepo supplierCompanyRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @PostMapping
    public String addSupplier(
            @RequestParam String nameitemProduct,
            @RequestParam int price,
            @RequestParam("file") MultipartFile file,
            @RequestParam AgeCategory ageCategory,
            @RequestParam Map<String, String> form,
            @RequestParam("id_supplier") SupplierCompany supplierCompany,
            Model model
    ) throws IOException {
        ItemProduct itemProduct = new ItemProduct();

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

        Iterable<ItemProduct> itemProducts = itemProductRepo.findAll();

        /**получаем список всех поставщиков */
        Iterable<SupplierCompany> supplierCompanies = supplierCompanyRepo.findAll();

        /**получаем список всех возрастных категорий */
        Set<String> ageCategories = Arrays.stream(AgeCategory.values())
                .map(AgeCategory::name)
                .collect(Collectors.toSet());

        /** записываем поставщика */



        model.addAttribute("itemproducts", itemProducts);
        model.addAttribute("suppliers", supplierCompanies);
        model.addAttribute("agecategories", ageCategories);

        return "itemproducts";
    }

    @GetMapping
    public String getSupplierList(Model model){
        model.addAttribute("itemproducts", itemProductRepo.findAll());
        return "itemproducts";
    }
}

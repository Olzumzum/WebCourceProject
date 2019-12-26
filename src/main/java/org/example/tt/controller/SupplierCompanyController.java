package org.example.tt.controller;

import org.example.tt.domain.Role;
import org.example.tt.domain.SupplierCompany;
import org.example.tt.repos.SupplierCompanyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/suppliercompany")
public class SupplierCompanyController {

    @Autowired
    private SupplierCompanyRepo supplierCompanyRepo;

    @PostMapping
    public String addSupplier(
            @RequestParam String nameSupplier,
            Model model
    ) {
        SupplierCompany supplierCompany = new SupplierCompany(nameSupplier);
        supplierCompanyRepo.save(supplierCompany);

        /** получаем список всех поставщиков */
        Iterable<SupplierCompany> supplierCompanies = supplierCompanyRepo.findAll();


        model.addAttribute("suppliers", supplierCompanies);
        return "suppliercompany";
    }

    @GetMapping
    public String getSupplierList(Model model){
        model.addAttribute("suppliers", supplierCompanyRepo.findAll());
        return "suppliercompany";
    }


}

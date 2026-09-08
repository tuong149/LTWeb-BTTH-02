package vn.iotstar.springbootltweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.springbootltweb.entity.Category;
import vn.iotstar.springbootltweb.service.CategoryService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Value("${app.upload.dir}")
    private String uploadDir;

    @GetMapping("/list")
    public String showListCategoryPage(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "admin/category/list"; 
    }

    @GetMapping("/add")
    public String showAddCategoryPage(Model model) {
        model.addAttribute("category", new Category());
        return "admin/category/add"; 
    }

    @PostMapping("/add")
    public String saveCategory(@ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            category.setImages(fileName);
            saveFile(file, fileName);
        }
        categoryService.save(category);
        return "redirect:/admin/category/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditCategoryPage(@PathVariable("id") Long id, Model model) {
        Optional<Category> category = categoryService.findById(id);
        if (category.isPresent()) {
            model.addAttribute("category", category.get());
            return "admin/category/edit";
        }
        return "redirect:/admin/category/list";
    }

    @PostMapping("/edit")
    public String updateCategory(@ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file) {
        Optional<Category> existingCategory = categoryService.findById(category.getId());
        if (existingCategory.isPresent()) {
            if (!file.isEmpty()) {
                String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                category.setImages(fileName);
                saveFile(file, fileName);
            } else {
                category.setImages(existingCategory.get().getImages());
            }
            categoryService.save(category);
        }
        return "redirect:/admin/category/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id) {
        categoryService.deleteById(id);
        return "redirect:/admin/category/list";
    }

    private void saveFile(MultipartFile file, String fileName) {
        try {
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            try (InputStream inputStream = file.getInputStream()) {
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
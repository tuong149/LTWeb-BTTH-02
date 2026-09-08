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
        categoryService.save(category);
        return "redirect:/admin/category/list";
    }
}
package vn.iotstar.springbootltweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.springbootltweb.entity.User;
import vn.iotstar.springbootltweb.repository.UserRepository;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Value("${app.upload.dir}")
    private String uploadDir;

    @GetMapping("/list")
    public String showListUserPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (StringUtils.hasText(keyword)) {
            model.addAttribute("users", userRepository.findByFullnameContainingIgnoreCaseOrEmailContainingIgnoreCase(keyword, keyword));
            model.addAttribute("keyword", keyword);
        } else {
            model.addAttribute("users", userRepository.findAll());
        }
        return "admin/user/list"; 
    }

    @GetMapping("/add")
    public String showAddUserPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/add"; 
    }

    @PostMapping("/add")
    public String saveUser(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            user.setImages(fileName);
            saveFile(file, fileName);
        }
        userRepository.save(user);
        return "redirect:/admin/user/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditUserPage(@PathVariable("id") Long id, Model model) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
            return "admin/user/edit";
        }
        return "redirect:/admin/user/list";
    }

    @PostMapping("/edit")
    public String updateUser(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {
        Optional<User> existingUserOpt = userRepository.findById(user.getId());
        if (existingUserOpt.isPresent()) {
            User existingUser = existingUserOpt.get();
            if (!StringUtils.hasText(user.getPassword())) {
                user.setPassword(existingUser.getPassword());
            }
            if (!file.isEmpty()) {
                String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                user.setImages(fileName);
                saveFile(file, fileName);
            } else {
                user.setImages(existingUser.getImages());
            }
            userRepository.save(user);
        }
        return "redirect:/admin/user/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/user/list";
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
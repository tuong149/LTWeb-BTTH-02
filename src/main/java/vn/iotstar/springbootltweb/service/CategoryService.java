package vn.iotstar.springbootltweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.iotstar.springbootltweb.entity.Category;
import vn.iotstar.springbootltweb.repository.CategoryRepository;
import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    
    public List<Category> findAll() { return categoryRepository.findAll(); }
    public Optional<Category> findById(Long id) { return categoryRepository.findById(id); }
    public Category save(Category category) { return categoryRepository.save(category); }
    public void deleteById(Long id) { categoryRepository.deleteById(id); }
    public List<Category> searchByName(String keyword) { return categoryRepository.findByNameContainingIgnoreCase(keyword); }
}
package vn.iotstar.springbootltweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.iotstar.springbootltweb.entity.Category;
import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findByNameContainingIgnoreCase(String name);
}
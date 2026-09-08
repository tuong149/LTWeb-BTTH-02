package vn.iotstar.springbootltweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.iotstar.springbootltweb.entity.Category;
public interface CategoryRepository extends JpaRepository<Category, Long> {}

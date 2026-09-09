package vn.iotstar.springbootltweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.iotstar.springbootltweb.entity.User;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByFullnameContainingIgnoreCaseOrEmailContainingIgnoreCase(String fullname, String email);
}
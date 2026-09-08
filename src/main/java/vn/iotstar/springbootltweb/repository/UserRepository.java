package vn.iotstar.springbootltweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.iotstar.springbootltweb.entity.User;
public interface UserRepository extends JpaRepository<User, Long> {}

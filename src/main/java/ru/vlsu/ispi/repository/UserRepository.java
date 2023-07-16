package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByLogin(String login);
}

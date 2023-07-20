package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}

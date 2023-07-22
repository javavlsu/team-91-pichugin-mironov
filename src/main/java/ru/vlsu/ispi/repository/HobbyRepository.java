package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Hobby;

public interface HobbyRepository extends JpaRepository<Hobby, Long> {
}

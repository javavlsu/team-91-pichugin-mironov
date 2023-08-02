package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Warning;

public interface WarningRepository extends JpaRepository<Warning, Long> {
}

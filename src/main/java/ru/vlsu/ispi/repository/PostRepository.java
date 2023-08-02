package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
}

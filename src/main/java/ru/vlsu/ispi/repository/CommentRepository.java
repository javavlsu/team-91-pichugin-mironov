package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}

package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;

public interface PostRepository extends JpaRepository<Post, Long> {
    Post findByUser(User user);
}

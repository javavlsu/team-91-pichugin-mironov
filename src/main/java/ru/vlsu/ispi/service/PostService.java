package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.repository.HobbyRepository;
import ru.vlsu.ispi.repository.PostRepository;
import ru.vlsu.ispi.repository.RoleRepository;
import ru.vlsu.ispi.repository.UserRepository;

import java.util.List;

@Service
public class PostService {
    @Autowired
    PostRepository postRepository;

    public List<Post> allPosts() {
        return postRepository.findAll();
    }
}

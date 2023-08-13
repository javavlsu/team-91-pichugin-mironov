package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.repository.PostRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Service
public class PostService {
    @Autowired
    PostRepository postRepository;

    public List<Post> allPosts() {
        return postRepository.findAll();
    }

    public boolean savePost(Post post, User user) {
        post.setHide(false);
        post.setStartTime(LocalDateTime.now());
        post.setUser(user);
        postRepository.save(post);

        return true;
    }

    public boolean updatePost(Post post, User user) {
        /*User userFromDB = postRepository.findByUsername(user.getUsername());

        user.setRoles(userFromDB.getRoles());
        if (!Objects.equals(user.getPassword(), userFromDB.getPassword())) {
            post.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        }*/
        postRepository.save(post);

        return true;
    }
}

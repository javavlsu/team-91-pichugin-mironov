package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Comment;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.repository.CommentRepository;
import ru.vlsu.ispi.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    UserRepository userRepository;

    public List<Comment> allComments() {
        return commentRepository.findAll();
    }

    public boolean saveComment(Comment comment, String username, Post post){
        comment.setStartCommentTime(LocalDateTime.now());
        User user1 = userRepository.findByUsername(username);
        comment.setUser(user1);
        comment.setPost(post);
        commentRepository.save(comment);
        return true;

    }
}

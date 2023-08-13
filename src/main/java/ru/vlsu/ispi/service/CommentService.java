package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Comment;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.repository.CommentRepository;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;

    public List<Comment> allComments() {
        return commentRepository.findAll();
    }
}

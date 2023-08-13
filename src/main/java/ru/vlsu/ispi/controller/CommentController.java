package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.vlsu.ispi.entity.Comment;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.service.CommentService;

@Controller
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/posts")
    public String createComment(@ModelAttribute("commentForm") Comment comment,
                                @ModelAttribute("username") String username,
                                @ModelAttribute("post") Post post,
                                BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "posts";
        }
        commentService.saveComment(comment, username, post);
        return "redirect:/posts";
    }
}

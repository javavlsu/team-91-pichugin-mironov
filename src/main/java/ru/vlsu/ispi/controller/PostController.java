package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.vlsu.ispi.service.PostService;

@Controller
public class PostController {
    @Autowired
    private PostService postService;

    @GetMapping("/posts")
    public String postsList(Model model) {
        model.addAttribute("allPosts", postService.allPosts());
        return "posts";
    }
}

package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.service.CommentService;
import ru.vlsu.ispi.service.PostService;
import ru.vlsu.ispi.service.UserService;

import javax.validation.Valid;

@Controller
public class PostController {
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/posts")
    public String postsList(Model model) {
        model.addAttribute("allPosts", postService.allPosts());
        model.addAttribute("allComments", commentService.allComments());
        return "posts";
    }

    @GetMapping("/createPost")
    public String createPost(@RequestParam(required = true, defaultValue = "" ) String username,
                             Model model) {
        model.addAttribute("postForm", new Post());
        model.addAttribute("user", userService.loadUserByUsername(username));
        return "createPost";
    }

    @PostMapping("/createPost")
    public String addPost(@ModelAttribute("postForm") @Valid Post postForm,
                          @ModelAttribute("user") User user,
                          BindingResult bindingResult,
                          Model model) {

        if (bindingResult.hasErrors()) {
            return "createPost";
        }

        postService.savePost(postForm, user);

        return "redirect:/posts";
    }


}

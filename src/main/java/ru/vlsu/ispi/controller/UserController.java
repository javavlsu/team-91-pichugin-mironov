package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.service.UserService;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/posts")
    public String postsList(Model model) {
        return "posts";
    }

    @GetMapping("/profile")
    public String profile(@RequestParam(required = true, defaultValue = "" ) String username, Model model) {
        model.addAttribute("user", userService.loadUserByUsername(username));
        return "profile";
    }
}

package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.service.UserService;

import javax.validation.Valid;

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

    @GetMapping("/editProfile")
    public String viewInfProfile(@RequestParam(required = true, defaultValue = "" ) Long id_user, Model model) {
        model.addAttribute("user", userService.findUserById(id_user));
        model.addAttribute("userForm", new User());
        return "editProfile";
    }

    @PostMapping("/editProfile")
    public String editProfile(@ModelAttribute("userForm") @Valid User userForm,
                             BindingResult bindingResult,
                             Model model) {

        if (bindingResult.hasErrors()) {
            return "editProfile";
        }

        if (!userService.updateUser(userForm)){
            return "editProfile";
        }

        return "redirect:/posts";
    }
}

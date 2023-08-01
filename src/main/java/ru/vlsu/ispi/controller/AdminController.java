package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.service.UserService;

import javax.validation.Valid;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @PostMapping("/admin")
    public String deleteUser(@RequestParam(required = true, defaultValue = "" ) Long id_user,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(id_user);
        }

        if (action.equals("update")){
            model.addAttribute("user",userService.findUserById(id_user));
            model.addAttribute("userForm", new User());
            return "updateUser";
        }
        return "redirect:/admin";
    }

    @GetMapping("/updateUser")
    public String userInfo(Model model){
        return "updateUser";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("userForm") @Valid User userForm,
                             BindingResult bindingResult,
                             Model model) {

        if (bindingResult.hasErrors()) {
            return "updateUser";
        }

        if (!userService.updateUser(userForm)){
            return "updateUser";
        }

        return "redirect:/admin";
    }

}

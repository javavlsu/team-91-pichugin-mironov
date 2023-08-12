package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.service.UserService;

@Controller
public class FindFriendsController {
    @Autowired
    UserService userService;

    @GetMapping("/findFriends")
    public String findFriendsView(Model model) {
        model.addAttribute("users", userService.allUsers());
        return "findFriends";
    }

    @PostMapping("/findFriends")
    public String findFriendsSubstring(@RequestParam(required = true, defaultValue = "" ) String substring,
                                       Model model) {
        substring = substring.trim();
        model.addAttribute("users", userService.allUsers(substring));
        return "findFriends";
    }
}

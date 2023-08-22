package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.service.FriendService;
import ru.vlsu.ispi.service.UserService;

@Controller
public class FriendController {
    @Autowired
    FriendService friendService;
    @Autowired
    UserService userService;

    @PostMapping("/addFriend")
    public String addFriend(@RequestParam(required = true, defaultValue = "" ) String friendname,
                            @RequestParam(required = true, defaultValue = "" ) String username,
                            Model model){
        friendService.addFriend(friendname, username);
        return "redirect:/posts";
    }
}

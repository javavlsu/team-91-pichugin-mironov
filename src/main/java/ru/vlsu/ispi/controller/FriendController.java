package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @PostMapping("/addFriendship")
    public String addFriend(@RequestParam(required = true, defaultValue = "" ) String friendname,
                            @RequestParam(required = true, defaultValue = "" ) String username,
                            Model model){
        friendService.addFriendship(friendname, username);
        return "redirect:/posts";
    }

    @PostMapping("/addFriend")
    public String addFriend(@RequestParam(required = true, defaultValue = "" ) Long idF,
                            @RequestParam(required = true, defaultValue = "" ) Long idU,
                            Model model) {
        friendService.addFriend(idF, idU);
        return "redirect:/posts";
    }

    @PostMapping("/deleteFriend")
    public String deleteFriend(@RequestParam(required = true, defaultValue = "" ) Long idF,
                               @RequestParam(required = true, defaultValue = "" ) Long idU,
                               Model model) {
        friendService.deleteFriend(idF, idU);
        return "redirect:/posts";
    }

    @GetMapping("/friends")
    public String friendsView(@RequestParam(required = true, defaultValue = "" ) String username,
                              Model model) {
        model.addAttribute("users", friendService.listFriends(username));
        return "findFriends";
    }
}

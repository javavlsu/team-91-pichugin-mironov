package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.service.CommentService;
import ru.vlsu.ispi.service.FriendService;
import ru.vlsu.ispi.service.PostService;
import ru.vlsu.ispi.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FriendService friendService;
    @Autowired
    private PostService postService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/profile")
    public String profile(@RequestParam(required = true, defaultValue = "" ) String username,
                          @RequestParam(required = false, defaultValue = "" ) String user,
                          Model model) {
        model.addAttribute("user", userService.loadUserByUsername(username));
        model.addAttribute("listFriends", friendService.userFriends(username));
        if (!user.equals(null)){
            if (friendService.isExist(username, user)){
                model.addAttribute("almostFriends", true);
            }
            if (friendService.isConfirm(username, user)) {
                model.addAttribute("alreadyFriends", true);
            }
        }
        model.addAttribute("listPosts", postService.allUserPosts(username));
        model.addAttribute("allComments", commentService.allComments());
        return "profile";
    }

//    public RuntimeException method(){
//        RuntimeException exception = new RuntimeException();
//        return exception;
//    }

    @GetMapping("/editProfile")
    public String viewInfProfile(@RequestParam(required = true, defaultValue = "" ) Long id_user,
                                 Model model) {
        model.addAttribute("user", userService.findUserById(id_user));
        model.addAttribute("userForm", new User());
        return "editProfile";
    }

    @PostMapping("/editProfile")
    public String editProfile(@ModelAttribute("userForm") @Valid User userForm,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "editProfile";
        }
        if (!userService.updateUser(userForm)){
            return "editProfile";
        }
        return "redirect:/posts";
    }
}

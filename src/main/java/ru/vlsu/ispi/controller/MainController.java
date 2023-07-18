package ru.vlsu.ispi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ru.vlsu.ispi.service.UserService;

@Controller
public class MainController {
    @Autowired
    private UserService userService;


}

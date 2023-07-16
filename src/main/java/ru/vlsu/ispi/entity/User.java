package ru.vlsu.ispi.entity;

import lombok.Data;

import java.time.LocalDate;

@Data
public class User {
    private Long id;
    private String name;
    private String lastName;
    private String userDescription;
    private String linkMes;
    private LocalDate birthday;     // 2023-07-15 в таком формате
    private Boolean pol;
    private String login;
    private String password;
    private String role;



    public User(){

    }

}

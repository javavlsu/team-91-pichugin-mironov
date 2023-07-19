package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.Collection;

@Data
@Entity
@Table(name = "t_user")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_user;
    private String name;
    private String lastName;
    private String userDescription;
    private String linkMes;
    private LocalDate birthday;     // 2023-07-15 в таком формате
    private Boolean pol;
    @Size(min=3, message = "Не меньше 3 знаков")
    private String username;
    @Size(min=3, message = "Не меньше 3 знаков")
    private String password;
    private String role;

    public User(){

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}

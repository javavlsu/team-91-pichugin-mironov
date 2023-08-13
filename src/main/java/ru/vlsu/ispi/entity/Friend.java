package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name = "t_friend")
public class Friend implements GrantedAuthority {

    @Id
    private Long id;
    private String name; // Название (Содержание) комментария

    @ManyToOne
    @JoinColumn(name="id_user", nullable = false)
    private User user;

    @OneToMany(mappedBy="user")
    private Set<User> users;

    public Friend() {

    }

    public Friend(Long id) {
        this.id = id;
    }
    @Override
    public String getAuthority() {
        return getName();
    }
}

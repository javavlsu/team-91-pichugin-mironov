package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name = "t_comment")
public class Comment implements GrantedAuthority {

    @Id
    private Long id;
    private String name; // Название (Содержание) комментария
    private String startCommentTime;

    @ManyToOne
    @JoinColumn(name="id_post", nullable = false)
    private Post post;

    @ManyToOne
    @JoinColumn(name="id_user", nullable = false)
    private User user;

    public Comment() {

    }

    public Comment(Long id) {
        this.id = id;
    }
    @Override
    public String getAuthority() {
        return getName();
    }
}

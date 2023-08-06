package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Data
@Entity
@Table(name = "t_post")
public class Post implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private LocalDateTime startTime;
    private Boolean hide;

    @ManyToOne
    @JoinColumn(name="id_user", nullable = false)
    private User user;

    @Transient
    @ManyToMany(mappedBy = "post")
    private Set<Hobby> hobby;

    @OneToMany(mappedBy="post")
    private Set<Comment> comment;

    public Post() {

    }
    @Override
    public String getAuthority() {
        return getTitle();
    }
}

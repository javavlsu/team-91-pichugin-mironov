package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    private String startTime;
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
    public void setStartTime(LocalDateTime time){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
        this.startTime = time.format(formatter);
    }
    @Override
    public String getAuthority() {
        return getTitle();
    }
}

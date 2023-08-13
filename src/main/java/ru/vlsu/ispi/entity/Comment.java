package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@Entity
@Table(name = "t_comment")
public class Comment implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_comment;
    private String CommentName; // Название (Содержание) комментария
    private String startCommentTime;

    @ManyToOne
    @JoinColumn(name="id_post", nullable = false)
    private Post post;

    @ManyToOne
    @JoinColumn(name="id_user", nullable = false)
    private User user;

    public Comment() {

    }

    public Comment(Long id_comment) {
        this.id_comment = id_comment;
    }

    public void setStartCommentTime(LocalDateTime time){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
        this.startCommentTime = time.format(formatter);
    }
    @Override
    public String getAuthority() {
        return getCommentName();
    }
}

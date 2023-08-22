package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_friend")
public class Friend implements GrantedAuthority {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idU;
    private String username;
    private Long idF;
    private boolean confirm;

    @ManyToOne
    private User user;


    public Friend() {

    }

    public Friend(Long idU, Long idF, String username) {
        this.idU = idU;
        this.idF = idF;
        this.username = username;
    }

    @Override
    public String getAuthority() {
        return null;
    }
}

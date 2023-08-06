package ru.vlsu.ispi.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_warning")
public class Warning implements GrantedAuthority {

    @Id
    private Long id;
    private String name; // Название (Содержание) жалобы
    private String startTime; // Время жалобы

    @ManyToOne
    @JoinColumn(name="id_user", nullable = false)
    private User user;

    public Warning() {

    }

    public Warning(Long id) {
        this.id = id;
    }
    @Override
    public String getAuthority() {
        return getName();
    }
}

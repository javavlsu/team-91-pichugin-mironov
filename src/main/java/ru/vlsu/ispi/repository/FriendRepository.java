package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Friend;

public interface FriendRepository extends JpaRepository<Friend, Long> {
}

package ru.vlsu.ispi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.vlsu.ispi.entity.Friend;
import java.util.List;

public interface FriendRepository extends JpaRepository<Friend, Long> {
    List<Friend> findFriendByIdF(Long idF);
    Friend findFriendByIdFAndIdU(Long idF, Long idU);
    List<Friend> findFriendByIdU(Long idU);
    Friend findFriendByUsernameAndFriendUsername(String username, String friendUsername);
}

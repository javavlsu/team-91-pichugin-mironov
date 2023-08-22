package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Friend;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.repository.FriendRepository;
import ru.vlsu.ispi.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class FriendService {
    @Autowired
    FriendRepository friendRepository;
    @Autowired
    UserRepository userRepository;

    public List<User> userFriends(String username) {
        User user = userRepository.findByUsername(username);
        List<Friend> userFriendships = friendRepository.findFriendByIdF(user.getId_user());
        List<User> userFriends = new ArrayList<>();
        for (Friend friend : userFriendships) {
            if (!friend.isConfirm()){
                userFriends.add(userRepository.findByUsername(friend.getUsername()));
            }
        }
        return userFriends;
    }

    public boolean addFriendship(String friendname, String username) {
        User newFriend = userRepository.findByUsername(friendname); // подгрузка того, кого мы хотим добавить в друзья
        User user = userRepository.findByUsername(username);
        Friend friendship = new Friend(user.getId_user(), newFriend.getId_user(), username);
        friendRepository.save(friendship);
        return true;
    }

    public boolean isExist(String usernameF, String username ) {
        User userF = userRepository.findByUsername(usernameF);
        User user = userRepository.findByUsername(username);
        try{
            Friend friendship = friendRepository.findFriendByIdFAndIdU(userF.getId_user(), user.getId_user());
            if (friendship.getIdU() == user.getId_user() && friendship.getIdF() == userF.getId_user() && !friendship.isConfirm()){
                return true;
            }
            return true;
        } catch (NullPointerException e){
            System.err.println("Нет дружбы с пользователем");
        }
        return false;
    }

    public void addFriend(Long idF, Long idU) {
        Friend friendship = friendRepository.findFriendByIdFAndIdU(idF, idU);
        friendship.setConfirm(true);
        friendRepository.save(friendship);
    }
}

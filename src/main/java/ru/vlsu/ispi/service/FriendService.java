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

    public List<User> listFriends(String username) {
        User user = userRepository.findByUsername(username);
        List<Friend> userFriendships = friendRepository.findFriendByIdF(user.getId_user());
        List<User> userFriends = new ArrayList<>();
        for (Friend friend : userFriendships) {
            if (friend.isConfirm()){
                userFriends.add(userRepository.findByUsername(friend.getUsername()));
            }
        }
        if (userFriends.isEmpty()) {
            userFriends.clear();
            userFriendships = friendRepository.findFriendByIdU(user.getId_user());
            for (Friend friend : userFriendships) {
                if (friend.isConfirm()){
                    userFriends.add(userRepository.findByUsername(friend.getFriendUsername()));
                }
            }
        }
        return userFriends;
    }

    public boolean addFriendship(String friendUsername, String username) {
        User newFriend = userRepository.findByUsername(friendUsername); // подгрузка того, кого мы хотим добавить в друзья
        User user = userRepository.findByUsername(username);
        Friend friendship = friendRepository.findFriendByUsernameAndFriendUsername(username, friendUsername);
        if (friendship == null) {
            friendship = friendRepository.findFriendByUsernameAndFriendUsername(friendUsername, username);
        }
        if (friendship != null) {
            friendship.setConfirm(true);
            friendRepository.save(friendship);
        } else {
            friendship = new Friend(user.getId_user(), newFriend.getId_user(), username, friendUsername);
            friendRepository.save(friendship);
        }

        return true;
    }

    public boolean isExist(String username, String friendUsername ) {
        try{
            Friend friendship = friendRepository.findFriendByUsernameAndFriendUsername(username, friendUsername);
            if (friendship == null) {
                friendship = friendRepository.findFriendByUsernameAndFriendUsername(friendUsername, username);
            }
            if (friendship.isConfirm()){
                return true;
            }
            if (friendship.getUsername().equals(friendUsername)) {
                return true;
            }
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

    public void deleteFriend(Long idF, Long idU) {
        Friend friendship = friendRepository.findFriendByIdFAndIdU(idF, idU);
        friendRepository.delete(friendship);
    }
}

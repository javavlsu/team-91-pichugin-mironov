package ru.vlsu.ispi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.vlsu.ispi.entity.Friend;
import ru.vlsu.ispi.entity.Post;
import ru.vlsu.ispi.entity.User;
import ru.vlsu.ispi.repository.FriendRepository;
import ru.vlsu.ispi.repository.PostRepository;
import ru.vlsu.ispi.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class PostService {
    @Autowired
    PostRepository postRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    FriendRepository friendRepository;

    public List<Post> allPosts() {
        return postRepository.findAll();
    }
    public List<Post> allPosts(String username) {
        User user = userRepository.findByUsername(username);
        List<Friend> userFriends = friendRepository.findFriendByIdF(user.getId_user());
        userFriends.addAll(friendRepository.findFriendByIdU(user.getId_user()));
        List<Post> friendsPosts = new ArrayList<>();
        for (Friend friend : userFriends) {
            if (friend.isConfirm()){
                User user1 = userRepository.findByUsername(friend.getUsername());
                if (!user1.getUsername().equals(username)) {
                    friendsPosts.add(postRepository.findByUser(user1));
                }
            }
        }
        for (Friend friend : userFriends) {
            if (friend.isConfirm()){
                User user1 = userRepository.findByUsername(friend.getFriendUsername());
                if (!user1.getUsername().equals(username)){
                    friendsPosts.add(postRepository.findByUser(user1));
                }
            }
        }
        return friendsPosts;
    }

    public boolean savePost(Post post, User user) {
        post.setHide(false);
        post.setStartTime(LocalDateTime.now());
        post.setUser(user);
        postRepository.save(post);

        return true;
    }

    public boolean updatePost(Post post, User user) {
        /*User userFromDB = postRepository.findByUsername(user.getUsername());

        user.setRoles(userFromDB.getRoles());
        if (!Objects.equals(user.getPassword(), userFromDB.getPassword())) {
            post.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        }*/
        postRepository.save(post);

        return true;
    }
}

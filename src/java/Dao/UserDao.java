/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.GameRequest;
import Model.User;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author User
 */
@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(User user) {

        em.persist(user);
    }

    public void updatepic(String us, MultipartFile file) throws IOException {
        em.find(User.class, us);
        em.createQuery("Update user SET profileimage='" + file.getInputStream() + "'WHERE username='" + us + "';").executeUpdate();
    }

    public void updateinfos(String us, String n, String ln) throws IOException {
        em.find(User.class, us);
        em.createQuery("Update user SET firstname='" + n + "',lastname='" + ln + "' WHERE username='" + us + "';").executeUpdate();
    }

    public List<User> check(String s) {

        Query q = em.createNativeQuery("SELECT username FROM user WHERE username LIKE '" + s + "%';");
        List<User> usr = q.getResultList();

        return usr;
    }

    public int change(String s) {
        int y = Integer.parseInt(s);

        return y;
    }

    @Transactional
    public List<GameRequest> fetchincomingrequests(User request_receiver) {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request\n"
                + " join court_reservation on `match`=CourtReservationID\n"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "join user on game_request.request_receiver = user.user_id\n"
                + "  where request_receiver=(select user_id from user where username='" + request_receiver.getUsername() + "')\n"
                + "and status = 'pending' order by date;", GameRequest.class);
        Conversation = q.getResultList();

        return Conversation;
    }

    @Transactional
    public List<GameRequest> fetchoutgoingrequests(User requester) {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request\n"
                + " join court_reservation on `match`=CourtReservationID\n"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "join user on game_request.request_receiver = user.user_id\n"
                + "  where booker=(select user_id from user where username='" + requester.getUsername() + "') order by date;", GameRequest.class);
        Conversation = q.getResultList();

        return Conversation;
    }

    @Transactional
    public List<GameRequest> fetchansweredrequests(User request_receiver) {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request\n"
                + " join court_reservation on `match`=CourtReservationID\n"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "join user on game_request.request_receiver = user.user_id\n"
                + "  where request_receiver=(select user_id from user where username='" + request_receiver.getUsername() + "')\n"
                + "and not status = 'pending' order by date;", GameRequest.class);
        Conversation = q.getResultList();

        return Conversation;
    }

    @Transactional
    public void submitaccept(String id) {

        String sql = "UPDATE `seek_play`.`game_request` t SET t.`status` = 'yes' WHERE t.`id` =" + id + ";";
        int q1 = em.createNativeQuery(sql).executeUpdate();
    }

    @Transactional
    public void submitdeny(String id) {

        String sql = "UPDATE `seek_play`.`game_request` t SET t.`status` = 'no' WHERE t.`id` =" + id + ";";
        int q1 = em.createNativeQuery(sql).executeUpdate();
    }

    @Transactional
    public User checkUserByUsername(String username) {
        List<User> userList = em.createQuery(
                "SELECT u from User u WHERE u.username = :username", User.class).
                setParameter("username", username).getResultList();
        if (userList.size() == 1) {
            User user = userList.get(0);
            return user;
        } else {
            return null;
        }

    }

    public List<User> listAllUsers() {
        Query query = em.createNamedQuery("User.findAll", User.class);
        List<User> resultList = query.getResultList();
        return resultList;
    }

}

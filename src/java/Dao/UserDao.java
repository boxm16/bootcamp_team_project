/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

<<<<<<< HEAD
import Model.GameRequest;
import Model.Message;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
=======
import Model.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
>>>>>>> register
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public List<GameRequest> fetchincomingrequests() {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request"
                + " join court_reservation on `match`=CourtReservationID"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "where request_receiver='alex' and status is null order by date", GameRequest.class);
        Conversation = q.getResultList();

        return Conversation;
    }
    
    @Transactional
    public List<GameRequest> fetchoutgoingrequests() {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request"
                + " join court_reservation on `match`=CourtReservationID"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "where request_receiver='alex' and status is null order by date", GameRequest.class);//check query
        Conversation = q.getResultList();

        return Conversation;
    }
    
    @Transactional
    public List<GameRequest> fetchansweredrequests() {
        List<GameRequest> Conversation;
        Query q = em.createNativeQuery("sELECT * FROM seek_play.game_request"
                + " join court_reservation on `match`=CourtReservationID"
                + " join hours h on court_reservation.hours = h.hours_id\n"
                + "where request_receiver='alex' and status is null order by date", GameRequest.class);//check query
        Conversation = q.getResultList();

        return Conversation;
    }   
    
    

<<<<<<< HEAD
    @Transactional
    public void submitrequest(String name, String date, String time) {
        Query q1 = em.createNativeQuery("sELECT id FROM seek_play.game_request"
                + " join court_reservation on `match`=CourtReservationID join hours h on court_reservation.hours = h.hours_id\n"
                + "where booker='" + name + "' and hour='" + time + "' and date='" + date + "';");//check wuery!!!
        int a = (int) q1.getResultList().get(0);
        String sql="UPDATE `seek_play`.`game_request` t SET t.`status` = 'yes' WHERE t.`id` =" + Integer.toString(a)+";";
        int q2 = em.createNativeQuery(sql).executeUpdate();
=======
 
    @Transactional
    public User checkUserByUsername(String username) {
        User user = em.find(User.class, username);
        
        return user;
>>>>>>> register
    }

    public List<User> listAllUsers() {
        Query query = em.createNamedQuery("User.findAll", User.class);
        List<User> resultList = query.getResultList();
        return resultList;
    }

}

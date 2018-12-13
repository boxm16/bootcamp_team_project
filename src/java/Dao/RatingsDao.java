/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Stats;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class RatingsDao {

    @PersistenceContext
    private EntityManager em;

    public List<Stats> getAvalialbePlayersForGame(String id) {

//       List<Ratings> availablePlayersForGame=em.createQuery("SELECT r FROM Ratings r", Ratings.class).getResultList();
//   
//       return availablePlayersForGame;
        Query q1 = em.createNativeQuery("select hours,date from court_reservation where CourtReservationID='" + id + "';");
        String hour = (String) q1.getResultList().get(0);
        String date = (String) q1.getResultList().get(1);

        Query q2 = em.createNativeQuery("SELECT * from Stats where Player in\n"
                + "(select game_request.request_receiver from game_request inner join court_reservation on CourtReservationID=game_request.match \n"
                + "where court_reservation.date!='" + date + "' and !court_reservation.hours!='" + hour + "');", Stats.class);
        List<Stats> players = q2.getResultList();
        return players;
    }

}



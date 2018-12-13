/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.CourtReservation;
import Model.Ratings;
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

    public List<Stats> getAvalialbePlayersForGame(int id) {

//       List<Ratings> availablePlayersForGame=em.createQuery("SELECT r FROM Ratings r", Ratings.class).getResultList();
//   
//       return availablePlayersForGame;
        List<CourtReservation> reservation = em.createQuery("SELECT c FROM CourtReservation c WHERE c.courtReservationID = :courtReservationID", CourtReservation.class).setParameter("courtReservationID", id).getResultList();
       
        String sql = "SELECT * from Stats where Player in\n"
                + "(select game_request.request_receiver from game_request inner join court_reservation on CourtReservationID=game_request.match \n"
                + "where court_reservation.date!='" + reservation.get(0).getDate() + "' and court_reservation.hours!='" + reservation.get(0).getHours() + "');";

        Query q2 = em.createNativeQuery(sql, Stats.class);
        List<Stats> players = q2.getResultList();
        return players;
    }

}

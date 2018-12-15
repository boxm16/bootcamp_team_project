/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.CourtReservation;
import Model.Hours;
import Model.Ratings;
import Model.Stats;
import java.util.Date;
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

        List<CourtReservation> reservation = em.createQuery("SELECT c FROM CourtReservation c WHERE c.courtReservationID = :courtReservationID", CourtReservation.class).setParameter("courtReservationID", id).getResultList();

        String sql = "SELECT * from Stats where Player in\n"
                + "(select game_request.request_receiver from game_request inner join court_reservation on CourtReservationID=game_request.match \n"
                + "where (court_reservation.date!='" + reservation.get(0).getDate() + "' and court_reservation.hours!='" + reservation.get(0).getHours()
                + "') AND (status='yes' OR court_reservation.booker!='" + reservation.get(0).getBooker() + "'));";

        Query q2 = em.createNativeQuery(sql, Stats.class);
        List<Stats> players = q2.getResultList();
        return players;
    }

    public List<Stats> getInvitedPlayersforGame(int id) {

        List<CourtReservation> reservation = em.createQuery("SELECT c FROM CourtReservation c WHERE c.courtReservationID = :courtReservationID", CourtReservation.class).setParameter("courtReservationID", id).getResultList();

        Date date=reservation.get(0).getDate();
        Hours hours=reservation.get(0).getHours();
        
        String sql = "SELECT * from Stats where Player in\n"
                + "(select game_request.request_receiver from game_request inner join court_reservation on CourtReservationID=game_request.match \n"
                + "where court_reservation.date='" + date + "' and court_reservation.hours='" + hours
                + "' AND court_reservation.booker='" + reservation.get(0).getBooker() + "');";

        Query q1 = em.createNativeQuery(sql, Stats.class);
        List<Stats> players = q1.getResultList();
        return players;

    }

}

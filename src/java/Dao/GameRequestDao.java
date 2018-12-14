/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controller.gameRequestController;
import Model.GameRequest;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class GameRequestDao {

    @PersistenceContext
    private EntityManager em;

    public GameRequest getGameRequestById(String gameRequestId) {

        GameRequest gameRequest = em.find(GameRequest.class, Integer.parseInt(gameRequestId));
        return gameRequest;
    }
    
    @Transactional
    public void sendRequest(int senderid, String receiver, String game) {

//        String sql = "";
//        Query query = em.createNativeQuery(sql);
//
//  Query q=em.createNativeQuery("Select CourtReservationID from court_reservation where court_id='"+Court+"' and hours='"+hour+"' and  date='"+date+"'");
//  int id=(int) q.getSingleResult();
        String sql = ("INSERT INTO `seek_play`.`game_request` (`match`, `request_id`, `request_receiver`, `status`, `text`) VALUES ("+game+", NULL, "+receiver+", DEFAULT, 'NULL');");
        em.createNativeQuery(sql, GameRequest.class).executeUpdate();

    }

}

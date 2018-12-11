/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Ratings;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class RatingsDao {
   @PersistenceContext
    private EntityManager em;
   
   public List<Ratings> getAvalialbePlayersForGame() {
   
       List<Ratings> availablePlayersForGame=em.createQuery("SELECT r FROM Ratings r", Ratings.class).getResultList();
   
       return availablePlayersForGame;
   }
}

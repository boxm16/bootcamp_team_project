/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.GameRequest;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

}

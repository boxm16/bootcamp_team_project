/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Ratings;
import Model.Stats;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author aroum
 */
@Repository
public class RatingDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public List<Stats> Status(int id) {
        //em.find(Ratings.class, id);
        Ratings r = new Ratings();
        List<Stats> stats = em.createQuery("SELECT s FROM Stats s WHERE Player = :id", Stats.class).setParameter("id", id)
                .getResultList();
             return stats;
    }
}

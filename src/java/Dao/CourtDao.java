/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Court;
import Model.User;
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
public class CourtDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Court court) {

        em.persist(court);

    }

    public List<Court> listAllCourts() {
        Query query = em.createNamedQuery("Court.findAll", Court.class);
        List<Court> resultList = query.getResultList();
        return resultList;
    }
    
    
    
@Transactional
    public List<User> getFilledSlotsOfDate(String date) {

       //Query q = em.createNativeQuery("SELECT * FROM user;", User.class);
        //Query query = em.createNamedQuery("Court.findAll", Court.class);
       //List<User> resultList = q.getResultList();
        //return resultList;

      
      List<User> result=em.createQuery
       ("SELECT u FROM User u WHERE u.username LIKE :name", User.class)
            .setParameter("name", "%")
            .getResultList();
      return result;

    }

}

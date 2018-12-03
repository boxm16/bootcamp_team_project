/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Court;
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
    
    
  

}

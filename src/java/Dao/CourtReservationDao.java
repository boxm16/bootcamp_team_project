/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.CourtReservation;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class CourtReservationDao {

    @PersistenceContext
    private EntityManager em;
    
     @Transactional
    public CourtReservation checkCourtReservationByID(int id) {
        CourtReservation courtReservation = em.find(CourtReservation.class, id);
        return courtReservation;
    }

}

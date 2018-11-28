/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.CourtReservation;
import Model.Hours;
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
public class CourtReservationDao {

    @PersistenceContext
    private EntityManager em;
    
     @Transactional
    public CourtReservation checkCourtReservationByID(int id) {
        CourtReservation courtReservation = em.find(CourtReservation.class, id);
        return courtReservation;
    }
    
    
      
@Transactional
    public List<CourtReservation> getFreeTimeSlots(String date) {

    
       //Query query = em.createNamedQuery("CourtReservation.findAll", CourtReservation.class);
       Query query2=em.createNativeQuery("SELECT * FROM court_reservation WHERE date='"+date+"'", CourtReservation.class);
      Query query3=em.createNativeQuery("SELECT * from hours where hours_id not in (SELECT hours FROM court_reservation WHERE date='"+date+"') ", Hours.class);
      
       //Query query1=em.createQuery("SELECT cr FROM CourtReservation cr WHERE cr.date="+date+"", CourtReservation.class);
     List<CourtReservation> resultList = query3.getResultList();
        return resultList;
 
      /*
      List<User> result=em.createQuery
       ("SELECT u FROM User u WHERE u.username LIKE :name", User.class)
            .setParameter("name", "%")
            .getResultList();
      return result;
*/
    }

}

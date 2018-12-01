/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CourtDao;
import Dao.CourtReservationDao;
import Model.Court;
import Model.CourtReservation;
import Model.Hours;
import Model.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Michail Sitmalidis
 */
@Controller
public class EventController {

    @Autowired
    private CourtDao courtDao;

    @Autowired
    private CourtReservationDao courtReservationDao;

    @RequestMapping(value = "/booking_creation.htm", method = RequestMethod.GET)
    public String emptyForm(ModelMap model) {

        CourtReservation courtReservation = new CourtReservation();
        model.addAttribute("courtReservation", courtReservation);

        List<Court> courtList = courtDao.listAllCourts();
        model.addAttribute("courtList", courtList);

        return "booking_creation";
    }

    @RequestMapping(value = "/findFreeTimeSlotsByRest.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")

    public @ResponseBody
    String finduserByRest(@RequestParam(value = "userinput") String date, @RequestParam(value = "userinput2") String courtID) throws JsonProcessingException {

      

        List<CourtReservation> list = courtReservationDao.getFreeTimeSlots(date, courtID);
        
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(list);

    }
    
     @InitBinder
public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
    final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
}
    

    @RequestMapping(value = "/handleEventCreationForm.htm", method = RequestMethod.GET)
    public String filledForm(ModelMap model, HttpSession session, CourtReservation courtReservation) {
courtReservation.setBooker((User) session.getAttribute("user"));
        // CourtReservation courtReservation = new CourtReservation();
        //model.addAttribute("courtReservation", courtReservation);
        // List<Court> courtList = courtDao.listAllCourts();
        // model.addAttribute("courtList", courtList);
        System.out.println("Booker:"+courtReservation.getBooker().getUsername());
      
        System.out.println("CourtId.id"+courtReservation.getCourtId().getId());
     System.out.println("Reservation Date"+courtReservation.getDate());
        System.out.println("Reservation time slot(hours)"+courtReservation.getHours().getHoursId());
        
        courtReservationDao.insert(courtReservation);
        return "booking_manage";
    }

}

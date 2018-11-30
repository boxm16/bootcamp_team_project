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
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

        System.out.println(courtID);
        
        List<CourtReservation> list = courtReservationDao.getFreeTimeSlots(date, courtID);
   System.out.println(courtID);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(list);

    }

}

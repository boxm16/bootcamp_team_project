/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CourtDao;
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

    @RequestMapping(value = "/booking_creation.htm", method = RequestMethod.GET)
    public String emptyForm(ModelMap model) {

        List<Court> courtList = courtDao.listAllCourts();
        model.addAttribute("courtList", courtList);

        return "booking_creation";
    }
    
    
    
    @RequestMapping(value = "/findFilledSlotsByRest.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")

    public @ResponseBody
    String finduserByRest(@RequestParam(value = "userinput") String date) throws JsonProcessingException {
        
        List<CourtReservation> list = courtDao.getFilledSlotsOfDate(date);
       
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(list);

    

    }
    
    
   

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CourtReservationDao;
import Dao.GameRequestDao;
import Model.CourtReservation;
import Model.GameRequest;
import Model.User;
import javax.servlet.http.HttpSession;
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
public class gameRequestController {

    @Autowired
    private CourtReservationDao courtReservationDao;

    @Autowired
    private GameRequestDao gameRequestDao;

//     @RequestMapping(value = "/handleGameRequestForm.htm", method = RequestMethod.POST)
//    public String filledForm(ModelMap model, GameRequest gameRequest) {
//         System.out.println("POPO");
//        return "error_page";
//    }
    @RequestMapping(value = "/handleGameRequests.htm", method = RequestMethod.GET)
    public String sendGameRequests(@RequestParam("user_to_be_invited") String receiver, @RequestParam("game") String game, 
            ModelMap model, HttpSession session) {

        User sender = (User) session.getAttribute("user");

        gameRequestDao.sendRequest(sender.getUserId(),receiver, game);
             
        return "booking_manage";
    }

}

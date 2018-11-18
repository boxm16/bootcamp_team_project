/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Michail Sitmalidis
 */
@Controller
public class ReviewController {

    @Autowired
    private UserDao userDao;

    
    //delete 
    @RequestMapping(value = "/AAA.htm", method = RequestMethod.POST)
    public String AAA(ModelMap model, @RequestParam("player") String username) {
        //System.out.println(username);
        User user=userDao.checkUserByUsername(username);
        return "reviews";
    }

    @RequestMapping(value = "/listPlayersForReview.htm", method = RequestMethod.GET)
    public String listPlayers(ModelMap model) {
        
        List<User> playersList=userDao.listAllUsers();
 model.addAttribute("playersList", playersList);
        return "reviews";
    }

}

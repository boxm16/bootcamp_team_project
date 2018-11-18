/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.FootballReviewDao;
import Dao.UserDao;
import Model.FootballReview;
import Model.FootballReviewPK;
import Model.Grade;
import Model.User;
import java.util.List;
import javax.servlet.http.HttpSession;
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
    
     @Autowired
    private FootballReviewDao footballReviewDao;

    //delete 
    @RequestMapping(value = "/AAA.htm", method = RequestMethod.GET)
    public String AAA(ModelMap model, HttpSession session) {

        User reviewer = (User) session.getAttribute("user");

        User user1 = userDao.checkUserByUsername("alex");
        
        FootballReview fr = new FootballReview();
        FootballReviewPK footballReviewPK=new FootballReviewPK();
        footballReviewPK.setReviewed("alex");
        footballReviewPK.setReviewer(reviewer.getUsername());
        fr.setFootballReviewPK(footballReviewPK);
        fr.setUser(reviewer);
        fr.setUser1(user1);
        fr.setAthletism(new Grade(1,1));
        fr.setTeamwork(new Grade(4,4));
        fr.setTechnique(new Grade(5,5));
        fr.setComments("Bravo");
        
        footballReviewDao.insert(fr);
        

        

       

        return "reviews";
    }

    @RequestMapping(value = "/listPlayersForReview.htm", method = RequestMethod.GET)
    public String listPlayers(ModelMap model) {

        List<User> playersList = userDao.listAllUsers();
        model.addAttribute("playersList", playersList);
        return "reviews";
    }

}

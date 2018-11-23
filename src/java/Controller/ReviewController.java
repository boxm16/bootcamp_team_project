/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.FootballReviewDao;
import Dao.UserDao;
import Model.FootballReview;
import Model.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    ServletContext servletContext;

    @Autowired
    private UserDao userDao;

    @Autowired
    private FootballReviewDao footballReviewDao;

    @RequestMapping(value = "/bbb.htm", method = RequestMethod.GET)
    public String bbb(ModelMap model) {

        List<User> playersList = userDao.listAllUsers();
        model.addAttribute("playersList", playersList);

        FootballReview fr = new FootballReview();
        List<String> Grades = new ArrayList<>();
        Grades.add("1");
        Grades.add("2");
        Grades.add("3");
        Grades.add("4");
        Grades.add("5");
        Grades.add("6");
        Grades.add("7");
        Grades.add("8");
        Grades.add("9");
        Grades.add("10");

        servletContext.setAttribute("Grades", Grades);
        model.addAttribute("fr", fr);

        return "reviews";
    }

    @RequestMapping(value = "/reviewFormHandling.htm", method = RequestMethod.POST)
    public String reviewFormHandler(@ModelAttribute FootballReview fr, HttpSession session, ModelMap model) {

        User reviewer = (User) session.getAttribute("user");

        fr.setReviewer(reviewer);

        footballReviewDao.insert(fr);
        model.addAttribute("fr", fr);

        List<User> playersList = userDao.listAllUsers();
        model.addAttribute("playersList", playersList);

        return "reviews";
    }
//dublicate with bbb, for deletion

    @RequestMapping(value = "/listPlayersForReview.htm", method = RequestMethod.GET)
    public String listPlayers(ModelMap model) {

        List<User> playersList = userDao.listAllUsers();
        model.addAttribute("playersList", playersList);
        return "reviews";
    }

}

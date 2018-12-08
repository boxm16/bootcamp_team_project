/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ReviewDao;
import Dao.CourtReservationDao;
import Dao.GameRequestDao;

import Dao.UserDao;
import Model.CourtReservation;
import Model.GameRequest;
import Model.Review;
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
    private GameRequestDao gameRequestDao;

    @Autowired
    private CourtReservationDao courtReservationDao;

    @Autowired
    private ReviewDao reviewDao;

    @RequestMapping(value = "/goToReviewForm.htm", method = RequestMethod.GET)

    public String createReviewForm(ModelMap model, HttpSession session) {
        User me = (User) session.getAttribute("user");
        List<GameRequest> pendingReviewList = reviewDao.listUsersForReview(me.getUserId());
        model.addAttribute("pendingReviewList", pendingReviewList);
        Review review = new Review();
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
        model.addAttribute("review", review);

        return "reviews";
    }

    @RequestMapping(value = "/reviewFormHandling.htm", method = RequestMethod.POST)
    public String reviewFormHandler(@ModelAttribute Review review, HttpSession session, ModelMap model, @RequestParam String gameRequestId) {

        GameRequest gameRequest = gameRequestDao.getGameRequestById(gameRequestId);

        review.setMatch(gameRequest.getMatch());

        User reviewer = (User) session.getAttribute("user");
        review.setReviewer(reviewer);
        User reviewed = gameRequest.getRequestReceiver();
        review.setReviewed(reviewed);

        reviewDao.insert(review);
        review = new Review();
        model.addAttribute("review", review);

        List<GameRequest> pendingReviewList = reviewDao.listUsersForReview(reviewer.getUserId());
        model.addAttribute("pendingReviewList", pendingReviewList);

        return "reviews";
    }

    
  
    
}

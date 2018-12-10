/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.RatingDao;
import Dao.UserDao;
import Model.GameRequest;
import Model.Ratings;
import java.util.List;
import Validation.UserValidator;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import Model.Review;
import Model.Stats;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Herc
 */
@Controller

public class UserController {

    @Autowired
    private UserDao userDao;
    @Autowired
    private RatingDao rd;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String user(ModelMap model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("users", user);
        return "menupage";

    }

    @RequestMapping(value = "/messenger3.htm", method = RequestMethod.GET)
    public String showmessages(ModelMap model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        List<GameRequest> incoming = userDao.fetchincomingrequests(user);
        model.addAttribute("incoming_requests", incoming);

        List<GameRequest> outgoing = userDao.fetchoutgoingrequests(user);
        model.addAttribute("outgoing_requests", outgoing);

        List< GameRequest> answered = userDao.fetchansweredrequests(user);
        model.addAttribute("answered_requests", answered);
        return "messenger3";
    }

    @RequestMapping(value = "/accept.htm", method = RequestMethod.POST)
    public String positive_request(@RequestParam("id") String id, ModelMap model) {

        userDao.submitaccept(id);
        return "redirect: messenger3.htm";

    }

    @RequestMapping(value = "/deny.htm", method = RequestMethod.POST)
    public String negative_request(@RequestParam("id") String id, ModelMap model) {

        userDao.submitdeny(id);
        return "redirect: messenger3.htm";

    }

    @RequestMapping(value = "/goToRegisterForm.htm", method = RequestMethod.GET)
    public String emptyForm(ModelMap model) {
        User user = new User();
        model.addAttribute(user);
        return "register";
    }

    @RequestMapping(value = "/registerFormHandling.htm", method = RequestMethod.POST)
    public String register(ModelMap model, User user, BindingResult bindingResult, HttpSession session) {

        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userDao.insert(user);
        model.addAttribute("user", user);

        session.setAttribute("user", user);
        return "success_registration";
        //return "myProfile_page";
    }

    @RequestMapping(value = "/loginFormHandling.htm", method = RequestMethod.POST)
    public String login(HttpSession session, ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password) {
        User user = userDao.checkUserByUsername(username);
        if (user != null) {
            if (BCrypt.checkpw(password, user.getPassword())) {
                user.setPassword(null);

                session.setAttribute("user", user);

                String message = "HI " + user.getUsername();
                model.addAttribute("message", message);
                model.addAttribute("users", user);
                return "menupage";
            } else {
                String message = "password is wrong";
                model.addAttribute("message", message);
                return "index";
            }
        } else {

            String message = "Username doesn't exist";
            model.addAttribute("message", message);
            return "index";
        }

    }

    @RequestMapping(value = "/trialLink.htm", method = RequestMethod.GET)
    public String Try(ModelMap model
    ) {
        User user = userDao.checkUserByUsername("adfdf1");
        if (user != null) {
            model.addAttribute("userFromDB", user);
            return "success_registration";
        } else {
            return "error_page";
        }

    }

    // how to upload pic
//    @RequestMapping(value ="insertbook", method=RequestMethod.POST, consumes = {"multipart/form-data"})
//    public String insertBook(ModelMap mm, @ModelAttribute Book book,
//            BindingResult result, @RequestParam(value = "cover") MultipartFile fileupload)
//    
//            return "index";
    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String showuser(ModelMap model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        model.addAttribute("users", user);
        return "personpage";
    }

    @RequestMapping(value = "/editpersinf", method = RequestMethod.GET)
    public String edituser(ModelMap model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("users", user);

        return "editpage";
    }

//    @RequestMapping(value = "/uploadpic", method = RequestMethod.GET)
//    public String picuser(ModelMap model, @ModelAttribute User u, BindingResult result, @RequestParam(value = "img") MultipartFile fileUpload,HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        model.addAttribute("users", user);
//    
//        return "editpage";
//    }
    @RequestMapping(value = "/edit.htm", method = RequestMethod.POST)
    public String homenew(ModelMap model, @ModelAttribute User u, HttpSession session)
            throws IOException {
        User user = (User) session.getAttribute("user");
        // model.addAttribute("users", u);
        userDao.updateinfos(user.getUsername(), u.getFirstname(), u.getLastname());
        // session.setAttribute("user", user);

        model.addAttribute("users", user);// updated info not shown

        return "menupage";

    }

    @RequestMapping(value = "/request.htm", method = RequestMethod.GET)
    public String requestnew(ModelMap model, @ModelAttribute User u, HttpSession session)
            throws IOException {
        User user = (User) session.getAttribute("user");
        model.addAttribute("users", user);
        return "gamerequestpage";

    }

    @RequestMapping(value = "/star.htm", method = RequestMethod.GET)
    public String starnew(ModelMap model, User u, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        Ratings r = new Ratings();
        r.setPlayer(user.getUserId());
        int id = r.getPlayer();
        List<Stats> stats = rd.Status(id);
        BigDecimal teamwork = stats.get(0).getTeamwork().multiply(new BigDecimal(10));
        BigDecimal technique = stats.get(0).getTechnique().multiply(new BigDecimal(10));
        BigDecimal athletism = stats.get(0).getAthletism().multiply(new BigDecimal(10));
        BigDecimal overall = ((athletism.add(technique).add(teamwork)).divide(new BigDecimal(3)));
        BigDecimal grade = (overall.divide(new BigDecimal(20))).setScale(2, RoundingMode.CEILING);
        model.addAttribute("users", user);
        model.addAttribute("team", teamwork);
        model.addAttribute("athlet", athletism);
        model.addAttribute("tech", technique);
        model.addAttribute("star", grade);
        model.addAttribute("overall", overall);

        return "starpage";
    }

    @RequestMapping(value = "/myreviews.htm", method = RequestMethod.GET)
    public String myreviewnew(ModelMap model, User u) {
        User user = new User();
        Review fr = new Review();
        user.setUsername("bbb");
        fr.setTeamwork(10);
        fr.setTechnique(5);
        fr.setAthletism(6);
        int teamwork = fr.getTeamwork() * 10;
        int technique = fr.getTechnique() * 10;
        int athletism = fr.getAthletism() * 10;
        double grade = ((fr.getAthletism() + fr.getTechnique() + fr.getTeamwork()) / 3);
        double g = (grade / 2);
        model.addAttribute("users", user);
        model.addAttribute("team", teamwork);
        model.addAttribute("athlet", athletism);
        model.addAttribute("tech", technique);
        model.addAttribute("star", g);
        model.addAttribute("stars", (grade * 10));
        return "myreviewspage";
    }

    @RequestMapping(value = "/others.htm", method = RequestMethod.GET)
    public String othersnew(ModelMap model, User u) {
        User user = new User();
        Review fr = new Review();
        user.setUsername("bbb");
        fr.setTeamwork(10);
        fr.setTechnique(5);
        fr.setAthletism(6);
        int teamwork = fr.getTeamwork() * 10;
        int technique = fr.getTechnique() * 10;
        int athletism = fr.getAthletism() * 10;
        double grade = ((fr.getAthletism() + fr.getTechnique() + fr.getTeamwork()) / 3);
        double g = (grade / 2);
        model.addAttribute("users", user);
        model.addAttribute("team", teamwork);
        model.addAttribute("athlet", athletism);
        model.addAttribute("tech", technique);
        model.addAttribute("star", g);
        model.addAttribute("stars", (grade * 10));
        return "othersreviewpage";
    }

    @RequestMapping(value = "/unfinished.htm", method = RequestMethod.GET)
    public String unfinishednew(ModelMap model, User u) {
        User user = new User();
        Review fr = new Review();
        user.setUsername("bbb");
        fr.setTeamwork(10);
        fr.setTechnique(5);
        fr.setAthletism(6);
        int teamwork = fr.getTeamwork() * 10;
        int technique = fr.getTechnique() * 10;
        int athletism = fr.getAthletism() * 10;
        double grade = ((fr.getAthletism() + fr.getTechnique() + fr.getTeamwork()) / 3);
        double g = (grade / 2);
        model.addAttribute("users", user);
        model.addAttribute("team", teamwork);
        model.addAttribute("athlet", athletism);
        model.addAttribute("tech", technique);
        model.addAttribute("star", g);
        model.addAttribute("stars", (grade * 10));
        return "unfinishedreviewpage";
    }

    @RequestMapping(value = "/event.htm", method = RequestMethod.GET)
    public String event(ModelMap model) {
        User user = new User();
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventpage";
    }

    @RequestMapping(value = "/eventcreate.htm", method = RequestMethod.GET)
    public String eventcreate(ModelMap model) {
        User user = new User();
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventcreatepage";
    }

    @RequestMapping(value = "/eventedit.htm", method = RequestMethod.GET)
    public String eventedit(ModelMap model) {
        User user = new User();
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventeditpage";
    }

    @RequestMapping(value = "/eventdelete.htm", method = RequestMethod.GET)
    public String eventdelete(ModelMap model) {
        User user = new User();
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventdeletepage";
    }

    @RequestMapping(value = "/search.htm", method = RequestMethod.GET)
    public String search(ModelMap model) {
        User user = new User();
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "searchpage";
    }

    @RequestMapping(value = "/profile.htm", method = RequestMethod.GET)

    public String profile(ModelMap model, @RequestParam(value = "username") String username) {
        User user = new User();
        user = userDao.profile(username);
        model.addAttribute("users", user);
        return "profilepage";
    }

    @RequestMapping(value = "/uploadpic.htm", method = RequestMethod.POST)
    public @ResponseBody
    String submit(@RequestParam("img") MultipartFile file, ModelMap modelMap, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        modelMap.addAttribute("file", file);
        final Part filepart = (Part) file;
        final String filename = filepart.getSubmittedFileName();
        filepart.write("C:\\javacode\\" + filename);
        File f = new File("C:\\javacode\\" + filename);
        userDao.updatepic(user.getUsername(), filename);
        return "menupage";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap modelMap, HttpSession session) throws IOException {

        session.invalidate();
        return "index";
    }

}

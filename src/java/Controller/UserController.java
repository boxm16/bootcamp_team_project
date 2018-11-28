/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.GameRequest;
import java.util.List;
import Validation.UserValidator;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import Model.Review;

import Model.User;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    private UserValidator userValidator;
     
     @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String adduser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");      
       model.addAttribute("users", user);     
       return "menupage";

    }


    @RequestMapping(value = "/messenger3.htm", method = RequestMethod.GET)
    public String showmessages(ModelMap model) {
        List<GameRequest> incoming = userDao.fetchincomingrequests();
        model.addAttribute("messages", incoming);
        List<GameRequest> outgoing = userDao.fetchoutgoingrequests();
        model.addAttribute("messages2", outgoing);
        List<GameRequest> answered = userDao.fetchansweredrequests();
        model.addAttribute("messages", answered);
        return "messenger3";
    }

    @RequestMapping(value = "/accept.htm", method = RequestMethod.POST)
    public  String answer_request(@RequestParam("username") String name,@RequestParam("date") String date,@RequestParam("time") String time,ModelMap model) {

        
      userDao.submitrequest(name,date,time);
        return "redirect: messenger3.htm";

    }
    @RequestMapping(value = "/goToRegisterForm.htm", method = RequestMethod.GET)
    public String emptyForm(ModelMap model) {
        User user = new User();
        model.addAttribute(user);
        return "register";
    }

    @RequestMapping(value = "/registerFormHandling.htm", method = RequestMethod.POST)
    public String register(ModelMap model, User user, BindingResult bindingResult) {

        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userDao.insert(user);
        model.addAttribute("user", user);
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
                return "personpage";
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
    public String Try(ModelMap model) {
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
    public String showuser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");
       model.addAttribute("users", user);
        return "personpage";
    }
    @RequestMapping(value = "/editpersinf", method = RequestMethod.GET)
    public String edituser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");       
       model.addAttribute("users", user);    
        return "editpage";
    }
    

    @RequestMapping(value="/edit.htm",method=RequestMethod.GET)
        public String homenew(ModelMap model,User u) throws IOException{
        User user=new User();    
         user.setUsername("bbb");
        model.addAttribute("user", u);
        userDao.updateinfos(user.getUsername(), u.getFirstname(), u.getLastname());
        return "userpage";
    }
        
    @RequestMapping(value="/star.htm",method=RequestMethod.GET)
        public String starnew(ModelMap model,User u){
        User user=new User();
        Review fr=new Review();
       user.setUsername("bbb");           
       fr.setTeamwork(10);
       fr.setTechnique(5);
       fr.setAthletism(6);
       double grade=((fr.getAthletism()+fr.getTechnique()+fr.getTeamwork())/3);
       double g=(grade/2);
       model.addAttribute("users", user);       
       model.addAttribute("grade",fr);     
       model.addAttribute("star", g);
        return "starpage";
    }
    @RequestMapping(value="/event.htm",method=RequestMethod.GET)
        public String homenew(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventpage";
    }
    @RequestMapping(value="/eventcreate.htm",method=RequestMethod.GET)
        public String homecreate(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventcreatepage";
    }
    @RequestMapping(value="/eventedit.htm",method=RequestMethod.GET)
        public String homeedit(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventeditpage";
    }
    @RequestMapping(value="/eventdelete.htm",method=RequestMethod.GET)
        public String homedelete(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventdeletepage";
    }
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) throws IOException {
    User user=new User();
    modelMap.addAttribute("file", file);
    user.setUsername("bbb");
    userDao.updatepic(user.getUsername(),file);
    return "menupage";
}
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.FootballReview;
import Model.Grade;
import Model.Sport;
import Model.User;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
     
     @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String adduser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");
       Sport sport=new Sport();
       sport.setSportsId(1);
       sport.setSports("football");
       user.setSports(sport);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
        return "menupage";

    }
    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String showuser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");
       Sport sport=new Sport();
       sport.setSportsId(1);
       sport.setSports("football");
       user.setSports(sport);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
        return "personpage";
    }
    @RequestMapping(value = "/editpersinf", method = RequestMethod.GET)
    public String edituser(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");
       Sport sport=new Sport();
       sport.setSportsId(1);
       sport.setSports("football");
       user.setSports(sport);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
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
        FootballReview fr=new FootballReview();
        Grade g= new Grade();
       user.setUsername("bbb");
       Sport sport=new Sport();
       sport.setSportsId(1);
       sport.setSports("football");
       user.setSports(sport);
       g.setId(5);
       g.setGrade(5);       
       fr.setTeamwork(g);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
       model.addAttribute("grade",fr);
       model.addAttribute("star",g);
        return "starpage";
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Review;

import Model.User;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    public String user(ModelMap model) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");      
       model.addAttribute("users", user);     
       return "menupage";

    }
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
     @RequestMapping(value = "/uploadpic", method = RequestMethod.GET)
    public String picuser(ModelMap model, @ModelAttribute User u, BindingResult result,@RequestParam(value="img") MultipartFile fileUpload) {
       User user=new User();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");       
       model.addAttribute("users", user);    
        return "editpage";
    }
    @RequestMapping(value="/edit.htm",method=RequestMethod.GET)
        public String homenew(ModelMap model,@ModelAttribute User u
        ) throws IOException{
        User user=new User();    
         user.setUsername("bbb");
        model.addAttribute("user", u);
        userDao.updateinfos(user.getUsername(), u.getFirstname(), u.getLastname());
        return "userpage";
        
    }
    @RequestMapping(value="/request.htm",method=RequestMethod.GET)
        public String requestnew(ModelMap model,@ModelAttribute User u
        ) throws IOException{
        User user=new User();    
         user.setUsername("bbb");
        model.addAttribute("user", u);
       
        return "gamerequestpage";
        
    }
        
    @RequestMapping(value="/star.htm",method=RequestMethod.GET)
        public String starnew(ModelMap model,User u){
        User user=new User();
        Review fr=new Review();
       user.setUsername("bbb");           
       fr.setTeamwork(10);
       fr.setTechnique(5);
       fr.setAthletism(6);
       int teamwork=fr.getTeamwork()*10;
       int technique=fr.getTechnique()*10;
       int athletism=fr.getAthletism()*10;
       double grade=((fr.getAthletism()+fr.getTechnique()+fr.getTeamwork())/3);
       double g=(grade/2);
       model.addAttribute("users", user);       
       model.addAttribute("team",teamwork);
       model.addAttribute("athlet",athletism);
       model.addAttribute("tech",technique);
       model.addAttribute("star", g);
       model.addAttribute("stars",(grade*10));
        return "starpage";
    }
        @RequestMapping(value="/myreviews.htm",method=RequestMethod.GET)
        public String myreviewnew(ModelMap model,User u){
        User user=new User();
        Review fr=new Review();
       user.setUsername("bbb");           
       fr.setTeamwork(10);
       fr.setTechnique(5);
       fr.setAthletism(6);
       int teamwork=fr.getTeamwork()*10;
       int technique=fr.getTechnique()*10;
       int athletism=fr.getAthletism()*10;
       double grade=((fr.getAthletism()+fr.getTechnique()+fr.getTeamwork())/3);
       double g=(grade/2);
       model.addAttribute("users", user);       
       model.addAttribute("team",teamwork);
       model.addAttribute("athlet",athletism);
       model.addAttribute("tech",technique);
       model.addAttribute("star", g);
       model.addAttribute("stars",(grade*10));
        return "myreviewspage";
    }
        @RequestMapping(value="/others.htm",method=RequestMethod.GET)
        public String othersnew(ModelMap model,User u){
        User user=new User();
        Review fr=new Review();
       user.setUsername("bbb");           
       fr.setTeamwork(10);
       fr.setTechnique(5);
       fr.setAthletism(6);
       int teamwork=fr.getTeamwork()*10;
       int technique=fr.getTechnique()*10;
       int athletism=fr.getAthletism()*10;
       double grade=((fr.getAthletism()+fr.getTechnique()+fr.getTeamwork())/3);
       double g=(grade/2);
       model.addAttribute("users", user);       
       model.addAttribute("team",teamwork);
       model.addAttribute("athlet",athletism);
       model.addAttribute("tech",technique);
       model.addAttribute("star", g);
       model.addAttribute("stars",(grade*10));
        return "othersreviewpage";
    }
        @RequestMapping(value="/unfinished.htm",method=RequestMethod.GET)
        public String unfinishednew(ModelMap model,User u){
        User user=new User();
        Review fr=new Review();
       user.setUsername("bbb");           
       fr.setTeamwork(10);
       fr.setTechnique(5);
       fr.setAthletism(6);
       int teamwork=fr.getTeamwork()*10;
       int technique=fr.getTechnique()*10;
       int athletism=fr.getAthletism()*10;
       double grade=((fr.getAthletism()+fr.getTechnique()+fr.getTeamwork())/3);
       double g=(grade/2);
       model.addAttribute("users", user);       
       model.addAttribute("team",teamwork);
       model.addAttribute("athlet",athletism);
       model.addAttribute("tech",technique);
       model.addAttribute("star", g);
       model.addAttribute("stars",(grade*10));
        return "unfinishedreviewpage";
    }
    @RequestMapping(value="/event.htm",method=RequestMethod.GET)
        public String event(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventpage";
    }
    @RequestMapping(value="/eventcreate.htm",method=RequestMethod.GET)
        public String eventcreate(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventcreatepage";
    }
    @RequestMapping(value="/eventedit.htm",method=RequestMethod.GET)
        public String eventedit(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventeditpage";
    }
    @RequestMapping(value="/eventdelete.htm",method=RequestMethod.GET)
        public String eventdelete(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "eventdeletepage";
    }
    @RequestMapping(value="/search.htm",method=RequestMethod.GET)
        public String search(ModelMap model){
        User user=new User();    
        user.setUsername("bbb");
        model.addAttribute("users", user);
        return "searchpage";
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

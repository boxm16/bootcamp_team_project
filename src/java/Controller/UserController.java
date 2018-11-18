/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Sport;
import Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
       // userDao.insert(user);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
        return "menupage";

    }
     @RequestMapping(value = "/person", method = RequestMethod.GET)
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
       // userDao.insert(user);
       model.addAttribute("users", user);
       model.addAttribute("sports", sport);
        return "personpage";
    }
}

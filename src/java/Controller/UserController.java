/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Sports;
import Model.Users;
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
     
     @RequestMapping(value = "/adduser.htm", method = RequestMethod.GET)
    public String adduser(ModelMap model) {
       Users user=new Users();
       user.setFirstname("v");
       user.setLastname("dv");
       user.setPassword("1");
       user.setUsername("bbb");
       Sports sport=new Sports();
       sport.setSportsId(1);
       sport.setSports("football");
       user.setSports(sport);
         userDao.insert(user);
        return "index";

    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Sport;
import Model.User;
import Validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/goToRegisterForm.htm", method = RequestMethod.GET)
    public String emptyForm(ModelMap model) {
        User user = new User();
        model.addAttribute(user);

        return "register";
    }

    @RequestMapping(value = "/registerFormHandling.htm", method = RequestMethod.POST)
    public String authentication1(ModelMap model, User user, BindingResult bindingResult) {
        //  String username = user.getFirstname();
        //  System.out.println(username);

        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }
        Sport sport = new Sport(1, "football");
        user.setSports(sport);

        userDao.insert(user);
        model.addAttribute("user", user);
        return "success_registration";

    }

    @RequestMapping(value = "/adduser.htm", method = RequestMethod.GET)
    public String adduser(ModelMap model) {
        User user = new User();
        user.setFirstname("v");
        user.setLastname("dv");
        user.setPassword("1");
        user.setUsername("bbb");
        Sport sport = new Sport();
        sport.setSportsId(1);
        sport.setSports("football");
        user.setSports(sport);
        userDao.insert(user);
        return "index";

    }

    @RequestMapping(value = "/trialLink.htm", method = RequestMethod.GET)
    public String Try(ModelMap model) {
        User user = userDao.check_username("adfdf1");
        if (user != null) {
            model.addAttribute("userFromDB", user);
            return "success_registration";
        } else {
            return "error_page";
        }
    }

}

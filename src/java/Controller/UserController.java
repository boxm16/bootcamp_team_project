/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Sports;
import Model.Users;
import Validation.UserValidator;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
        Users users = new Users();
        model.addAttribute(users);

        return "register";
    }

    @RequestMapping(value = "/registerFormHandling.htm", method = RequestMethod.POST)
    public String authentication1(ModelMap model, Users user, BindingResult bindingResult) {
        //  String username = user.getFirstname();
        //  System.out.println(username);

        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }
        Sports sport = new Sports(1, "football");
        user.setSports(sport);

        userDao.insert(user);
        model.addAttribute("user", user);
        return "success_registration";

    }

    @RequestMapping(value = "/loginFormHandling.htm", method = RequestMethod.GET)
    public String adduser(HttpSession session, ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password) {
        Users user = userDao.checkUserByUsername(username);
        if (user != null) {
                  //BCrypt.checkpw(password, user.getPassword())
            if (password.equals(user.getPassword())) {
                user.setPassword(null);
                session.setAttribute("user", user);
                String message = "HI " + user.getUsername();
                model.addAttribute("message", message);
                return "user_page";
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
        Users user = userDao.checkUserByUsername("adfdf1");
        if (user != null) {
            model.addAttribute("userFromDB", user);
            return "success_registration";
        } else {
            return "error_page";
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.Message;
import Model.Sport;
import Model.User;
import Validation.UserValidator;
import java.util.List;
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
// 22222222222

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "messenger3", method = RequestMethod.GET)
    public String showmessages(ModelMap model) {

        List<Message> msg = userDao.fetchmessages();
        model.addAttribute("messages", msg);
        List<Message> msg2 = userDao.conversation();
        model.addAttribute("conversation", msg2);
        return "messenger3";
    }

}

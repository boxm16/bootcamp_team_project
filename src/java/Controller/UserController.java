/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.GameRequest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Herc
 */
@Controller

public class UserController {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "messenger3", method = RequestMethod.GET)
    public String showmessages(ModelMap model) {
        List<GameRequest> msg = userDao.fetchmessages();
        model.addAttribute("messages", msg);
        return "messenger3";
    }

    @RequestMapping(value = "accept", method = RequestMethod.POST)
    public @ResponseBody String answer_request(@RequestParam("username") String name,@RequestParam("date") String date,@RequestParam("time") String time,ModelMap model) {

        
      userDao.submitrequest(name,date,time);
        return "messenger3";
    }

}

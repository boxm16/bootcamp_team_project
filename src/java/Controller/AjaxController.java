/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author aroum
 */
@RestController
public class AjaxController {
    @Autowired
    private UserDao usrd;
    
    @RequestMapping(value="/find.htm",method=RequestMethod.GET,headers="Accept=*/*",produces="application/json")
    public @ResponseBody String filterusers(ModelMap model, @RequestParam(value="texts") String name) throws JsonProcessingException{        
        List<User> us= usrd.check(name);
    ObjectMapper mapper =new ObjectMapper();
        System.out.print(mapper.writeValueAsString(us));    
        return mapper.writeValueAsString(us);
    }
    
}

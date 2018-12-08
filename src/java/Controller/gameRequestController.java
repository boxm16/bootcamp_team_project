/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.GameRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Michail Sitmalidis
 */
@Controller
public class gameRequestController {
    
    
     @RequestMapping(value = "/handleGameRequestForm.htm", method = RequestMethod.POST)
    public String filledForm(ModelMap model, GameRequest gameRequest) {
         System.out.println("POPO");
        return "error_page";
    }

    
}

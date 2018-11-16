/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validation;

import Dao.UserDao;
import Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Michail Sitmalidis
 */
@Component
public class UserValidator implements Validator {
    
      @Autowired
    private UserDao userDao;

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User u = (User) o;

        String username = u.getUsername().trim();
        //System.out.println("vname:"+username);
        //if (!username.startsWith("t")) {
        //    errors.rejectValue("username", "name.notStartWithT");
       // }
       if (userDao.checkUserByUsername(username)!=null) {
       errors.rejectValue("username", "username.Exists");
       }
       
       
        String password = u.getPassword();
        if (password.length() < 3) {
            errors.rejectValue("password", "pwd.Short");
        }
        String password_confirmation=u.getPassword_confirmation();
        if(!password.equals(password_confirmation)) {
        errors.rejectValue("password_confirmation", "pwds.NotMatch");
        }

        //errors.rejectValue("password", "password.less7");
    }

}

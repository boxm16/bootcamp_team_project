/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Dao.RatingsDao;
import Dao.ReviewDao;
import Dao.UserDao;
import Model.Ratings;
import Model.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author aroum
 */
@RestController
public class AjaxController {
    @Autowired
    private UserDao usrd;
    
     @Autowired
    private RatingsDao ratingDao;
    
    @RequestMapping(value="/find.htm",method=RequestMethod.GET,headers="Accept=*/*",produces="application/json")
    public @ResponseBody String filterusers(ModelMap model, @RequestParam(value="texts") String name) throws JsonProcessingException{        
        List<User> us= usrd.check(name);
    ObjectMapper mapper =new ObjectMapper();
        System.out.print(mapper.writeValueAsString(us));    
        return mapper.writeValueAsString(us);
    }
    
    
     @RequestMapping(value = "/findAvaliablePlayersForThisGameByRest.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public @ResponseBody
    String findAvaliablePlayersForThisGame(@RequestParam(value = "courtReservationId") String courtReservationID) throws JsonProcessingException {

       List<Ratings> getAvailablePlayersForGame=ratingDao.getAvalialbePlayersForGame();

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(getAvailablePlayersForGame);

    }
    @RequestMapping(value = "/fileUpload.htm", method = RequestMethod.POST)
    public ResponseEntity<String> fileUpload(@RequestParam("img") MultipartFile file,
            @RequestParam("filename") String filename)
            throws IOException {
               // Save file on system
        if (!file.getOriginalFilename().isEmpty()) {
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File("C:/javacode", file.getOriginalFilename()))); //(path,name)
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
        } else {
            return new ResponseEntity<>("Invalid file.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>("File Uploaded Successfully.", HttpStatus.OK);
    }
}

package Dao;

import Model.User;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.Part;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Herc
 */
@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(User user) {
        em.persist(user);
    }
    public void updatepic(String us, MultipartFile file) throws IOException{
        em.find(User.class,us);
        em.createQuery("Update user SET profileimage='"+file.getInputStream()+"'WHERE username='"+us+"';").executeUpdate();
    }
    public void updateinfos(String us, String n, String ln) throws IOException{
        em.find(User.class,us);
        em.createQuery("Update user SET firstname='"+n+"',lastname='"+ln+"' WHERE username='"+us+"';").executeUpdate();
    }
    public List<User> check(String s){
      
       Query q= em.createNativeQuery("SELECT username FROM user WHERE username LIKE '"+s+"%';");
       List<User> usr=q.getResultList();
      
       return usr;
    }


}

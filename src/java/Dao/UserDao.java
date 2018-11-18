package Dao;

import Model.User;
import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Part;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

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
    public void updatepic(User u,String us, Part file) throws IOException{
        em.find(User.class,us);
        em.createQuery("Update User SET profileimage='"+file.getInputStream()+"'WHERE username='"+us+"';").executeUpdate();
    }
    

}

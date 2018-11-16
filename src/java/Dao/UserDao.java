package Dao;

import Model.User;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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

    //method checked, GOOD
    @Transactional
    public User checkUserByUsername(String username) {
        User user = em.find(User.class, username);
        return user;
    }

}

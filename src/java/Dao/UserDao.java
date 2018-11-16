package Dao;

import Model.Users;
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
    public void insert(Users user) {

        em.persist(user);

    }

    //method checked, GOOD
    @Transactional
    public Users checkUserByUsername(String username) {
        Users user = em.find(Users.class, username);
        return user;
    }

}

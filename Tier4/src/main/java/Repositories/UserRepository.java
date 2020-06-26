package Repositories;

import java.util.Optional;
import java.util.Set;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import Models.User;

@Repository
public class UserRepository implements CrudRepository<Object>{
	
	
	@Autowired
	EntityManager em;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public User save(User user) {
		Session session = em.unwrap(Session.class);
		session.save(user);
		return user;
	}

	public Set<User> findAll() {
		// TODO Auto-generated method stub
		Session session = em.unwrap(Session.class);
		Set<User> users = (Set<User>) session.createQuery("from User", User.class)
				 .list();
		        session.getTransaction().commit();

		        return users;
	}

	public Optional<User> findById(int id) {
		Session session = em.unwrap(Session.class);
		User user = session.get(User.class, id);
		return Optional.ofNullable(user);
	}

	public boolean update(Object t) {
		Session session = em.unwrap(Session.class);
		session.update(t);
		//return user;
		return true;
	}

	public boolean deleteById(int id) {
		Session session = em.unwrap(Session.class);
		Optional<User> user = Optional.ofNullable(session.get(User.class, id));
		boolean access=user.isPresent();
		if (access==true) {
			session.delete(user);
			return true;
		}
		else {return false;}
	}
	
	public Object save(Object t) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
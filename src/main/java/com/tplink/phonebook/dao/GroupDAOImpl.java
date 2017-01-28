package com.tplink.phonebook.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.tplink.phonebook.model.Group;
/**
 * Hibernate specific DAO implementation
 *
 */
@Repository
public class GroupDAOImpl implements GroupDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(GroupDAOImpl.class);
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public void addGroup(Group g) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(g);
		logger.info("Group saved successfully, Group Details="+g);
	}
	
	public void updateGroup(Group g) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(g);
		logger.info("Group updated successfully, Group Details="+g);
	}

	@SuppressWarnings("unchecked")
	public List<Group> listGroups() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Group> GroupsList = session.createQuery("from Group").list();
		for(Group g : GroupsList){
			logger.info("Group List::"+g);
		}
		return GroupsList;
	}

	public Group getGroupById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Group g = (Group) session.load(Group.class, new Integer(id));
		logger.info("Group loaded successfully, Group details="+g);
		return g;
	}

	public void removeGroup(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Group g = (Group) session.load(Group.class, new Integer(id));
		if(null != g){
			session.delete(g);
		}
		logger.info("Group deleted successfully, Group details="+g);
	}

}

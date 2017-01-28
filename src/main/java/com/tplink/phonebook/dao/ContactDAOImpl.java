package com.tplink.phonebook.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.tplink.phonebook.model.Contact;
/**
 * Hibernate specific DAO implementation
 *
 */

@Repository
public class ContactDAOImpl implements ContactDAO {
	private static final Logger logger = LoggerFactory.getLogger(ContactDAOImpl.class);
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public void addContact(Contact contact) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(contact);
		logger.info("Contact saved successfully, Contact Details="+contact);
	}

	public void updateContact(Contact contact) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(contact);
		logger.info("Contact updated successfully, Contact Details="+contact);
	}

	@SuppressWarnings("unchecked")
	public List<Contact> listContacts() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Contact> contactsList = session.createQuery("from Contact").list();
		for(Contact contact : contactsList){
			logger.info("Contact List::"+contact);
		}
		return contactsList;
	}
	
	public Contact getContactById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Contact contact = (Contact) session.load(Contact.class, new Integer(id));
		logger.info("Contact loaded successfully, Contact details="+contact);
		return contact;
	}

	public void removeContact(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Contact contact = (Contact) session.load(Contact.class, new Integer(id));
		if(null != contact){
			session.delete(contact);
		}
		logger.info("Contact deleted successfully, Contact details="+contact);
	}

}

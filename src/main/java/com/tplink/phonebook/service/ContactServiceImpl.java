package com.tplink.phonebook.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tplink.phonebook.dao.ContactDAO;
import com.tplink.phonebook.model.Contact;

@Service
public class ContactServiceImpl implements ContactService {
	
	private ContactDAO contactDAO;

	public void setContactDAO(ContactDAO contactDAO) {
		this.contactDAO = contactDAO;
	}

	//@transactional - way to let Spring start and commit/rollback transactions 
	@Transactional
	public void addContact(Contact contact) {
		this.contactDAO.addContact(contact);
	}

	@Transactional
	public void updateContact(Contact contact) {
		this.contactDAO.updateContact(contact);
	}

	@Transactional
	public List<Contact> listContacts() {
		return this.contactDAO.listContacts();
	}

	@Transactional
	public Contact getContactById(int id) {
		return this.contactDAO.getContactById(id);
	}

	@Transactional
	public void removeContact(int id) {
		this.contactDAO.removeContact(id);
	}

}
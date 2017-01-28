package com.tplink.phonebook.dao;

import java.util.List;

import com.tplink.phonebook.model.Contact;

/*
 * abstract interface to the database
 * maps application calls to the persistence layer
 */

public interface ContactDAO {
	
	public void addContact(Contact contact);
	public void updateContact(Contact contact);
	public List<Contact> listContacts();
	public Contact getContactById(int id);
	public void removeContact(int id);
}

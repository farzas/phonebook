package com.tplink.phonebook.service;

import java.util.List;

import com.tplink.phonebook.model.Contact;

/*
 * Provide logic to operate on the data sent to and from the DAO and the client
 */
public interface ContactService {

	public void addContact(Contact contact);
	public void updateContact(Contact contact);
	public List<Contact> listContacts();
	public Contact getContactById(int id);
	public void removeContact(int id);
	
}
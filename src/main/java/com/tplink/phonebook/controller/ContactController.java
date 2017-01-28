package com.tplink.phonebook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tplink.phonebook.model.Contact;
import com.tplink.phonebook.service.ContactService;

/*
 * Controller directs the incoming information
 * Dispatcher servlet delegates control to the various interfaces during the execution
 */

@Controller
public class ContactController {

	private ContactService contactService;

	@Autowired(required=true)
	@Qualifier(value="contactService")
	public void setContactService(ContactService cs){
		this.contactService = cs;
	}

	//return the home page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHomePage() {
		return "home";
	}

	//return the contact page
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getAll() {
		return "contact";
	}

	//return all the list of contacts in json format
	@RequestMapping(value = "/contacts", method = RequestMethod.GET)
	@ResponseBody
	public List<Contact> listContacts() {
		return this.contactService.listContacts();
	}

	//return the contact with the specific id
	@RequestMapping(value = "/contacts/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Contact getGroupById(@PathVariable("id") int id) {
		return this.contactService.getContactById(id);
	}
	
	//add data into contacts
	@RequestMapping(value= "/contacts", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Contact addContact(@RequestBody Contact c){
		this.contactService.addContact(c);
		return c;
	}

	//delete contact with the specific id
	@RequestMapping(value = "/contacts/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void removeContact(@PathVariable("id") int id){
		this.contactService.removeContact(id);
	}

	//to update contact with specific id
	@RequestMapping(value = "/contacts/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Contact editContact(@PathVariable("id") int id, @RequestBody Contact c){
		this.contactService.updateContact(c);
		return c;
	}
}

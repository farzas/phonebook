package com.tplink.phonebook.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Entity bean for contact model with JPA annotations
 *  Hibernate provides JPA implementation
 *
 */

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Table(name="GROUP1")
public class Group {

	@Id
	@Column(name="group_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	//to join group and contact
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.DETACH )
	@JoinTable(name = "contact_group", 
			   joinColumns = { @JoinColumn(name = "group_id") }, 
			   inverseJoinColumns = {@JoinColumn(name = "contact_id") })
	private List<Contact> contacts;

	public List<Contact> getContact() {
		return contacts;
	}

	public void setContact(List<Contact> contact) {
		this.contacts = contact;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}

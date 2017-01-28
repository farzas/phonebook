package com.tplink.phonebook.dao;

import java.util.List;

import com.tplink.phonebook.model.Group;

/*
 * abstract interface to the database
 * maps application calls to the persistence layer
 */

public interface GroupDAO {

	public void addGroup(Group group);
	public void updateGroup(Group group);
	public List<Group> listGroups();
	public Group getGroupById(int id);
	public void removeGroup(int id);
}

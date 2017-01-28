package com.tplink.phonebook.service;

import java.util.List;

import com.tplink.phonebook.model.Group;
/*
 * Provide logic to operate on the data sent to and from the DAO and the client
 */
public interface GroupService {

	public void addGroup(Group group);
	public void updateGroup(Group group);
	public List<Group> listGroups();
	public Group getGroupById(int id);
	public void removeGroup(int id);
}

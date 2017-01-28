package com.tplink.phonebook.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tplink.phonebook.dao.GroupDAO;
import com.tplink.phonebook.model.Group;

@Service
public class GroupServiceImpl implements GroupService {
	
	private GroupDAO groupDAO;

	public void setGroupDAO(GroupDAO groupDAO) {
		this.groupDAO = groupDAO;
	}

	@Transactional
	public void addGroup(Group group) {
		this.groupDAO.addGroup(group);
	}

	@Transactional
	public void updateGroup(Group group) {
		this.groupDAO.updateGroup(group);
	}

	@Transactional
	public List<Group> listGroups() {
		return this.groupDAO.listGroups();
	}

	@Transactional
	public Group getGroupById(int id) {
		return this.groupDAO.getGroupById(id);
	}

	@Transactional
	public void removeGroup(int id) {
		this.groupDAO.removeGroup(id);
	}

}
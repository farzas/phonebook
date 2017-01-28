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

import com.tplink.phonebook.model.Group;
import com.tplink.phonebook.service.GroupService;

/*
 * Controller directs the incoming information
 * Dispatcher servlet delegates control to the various interfaces during the execution
 */

@Controller
public class GroupController {

	private GroupService groupService;

	@Autowired(required=true)
	@Qualifier(value="groupService")
	public void setGroupService(GroupService gs){
		this.groupService = gs;
	}

	//redirect to group page
	@RequestMapping(value = "/indexgroup", method = RequestMethod.GET)
	public String getAll() {
		return "group";
	}

	//retrieve contacts in a group
	@RequestMapping(value = "/groupdetails", method = RequestMethod.GET)
	public String getContactsInGroup() {
		return "contactgroup";
	}

	//to retrieve all groups
	@RequestMapping(value = "/groups", method = RequestMethod.GET)
	@ResponseBody
	public List<Group> listGroups(){
		return this.groupService.listGroups();
	}

	//retrieve group with corresponding id
	@RequestMapping(value = "/groups/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Group getGroupById(@PathVariable("id") int id) {
		return this.groupService.getGroupById(id);
	}
	
	//add a new group
	@RequestMapping(value= "/groups", method = RequestMethod.POST)
	@ResponseBody
	public Group addGroup(@RequestBody Group g){
		this.groupService.addGroup(g);
		return g;
	}
	
	//delete group with corresponding id
	@RequestMapping(value = "/groups/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void removeGroup(@PathVariable("id") int id){
		this.groupService.removeGroup(id);
	}

	//to update group with corresponding id
	@RequestMapping(value = "/groups/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Group editGroup(@PathVariable("id") int id, @RequestBody Group g){
		this.groupService.updateGroup(g);
		return g;
	}
}

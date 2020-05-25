package com.mvc2;

import org.apache.log4j.Logger;

import chap08.Controller;
import chap08.MemberController;

public class ControllerMapper {

	public static Controller getController(String command, String crud) {
		Logger logger = Logger.getLogger(ControllerMapper.class);
		Controller controller = null;
		String commands[] = command.split("/");
		
		int i = 0;
		for(String str : commands) {
			System.out.println("str=" + str);
		}
		if(commands.length==2) {
			String work = commands[0];
			String requestName = commands[1];
			if("member".equals(work)) {
			
				controller = new MemberController(crud);
				
			}
		}
		return controller;
	}/////////////// end of Controller
	
}

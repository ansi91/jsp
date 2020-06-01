package com.mvc3;

import org.apache.log4j.Logger;

public class ControllerMapper3 {
																			// ==> member/memberList.mvc3
	public static Controller2020 getController(String command) { 
		Logger logger = Logger.getLogger(ControllerMapper3.class);
		logger.info("command:"+command);
		Controller2020 controller = null;
		String commands[] = command.split("/");
		for(String str : commands) {
			System.out.println("str=" + str);
		}
		if(commands.length==2) {
			String work = commands[0];
			String requestName = commands[1];
			System.out.println("[work]" + work);
			System.out.println("[requestName]" + requestName);
			if("member".equals(work)) {
			
				controller = new MemberController3(requestName);
				
			}
		}
		return controller;
	}/////////////// end of Controller
	
}

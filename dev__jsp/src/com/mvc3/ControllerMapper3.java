package com.mvc3;

import org.apache.log4j.Logger;

public class ControllerMapper3 { 
																			// ==> member/memberList.mvc3     || work는 컨트롤러 매퍼에만 있다
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
			logger.info("commands[1] =" + commands[1]);
			String requestName = commands[1];
			System.out.println("[work]" + work);
			System.out.println("[requestName]" + requestName);
			if("member".equals(work)) {
				logger.info("[work] = " + work);
				controller = new MemberController3(requestName);
				
			}else if ("board".equals(work)){
				logger.info("board = " + work);
				controller = new BoardController(requestName);
			}else if ("test".equals(work)){
				logger.info("test = " + work);
				controller = new TestController(requestName);
			}
				
			}
		
		return controller;
	}/////////////// end of Controller
	
}
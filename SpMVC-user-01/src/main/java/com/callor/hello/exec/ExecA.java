package com.callor.hello.exec;

public class ExecA {
	public static void name(String[] args) {
		ExecB execB = new ExecB();
		
		try {
			execB.add(null, null);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}

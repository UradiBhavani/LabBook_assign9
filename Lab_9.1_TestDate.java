package com.capgemini.assignment9;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestDate {
	static Date d;
	@BeforeClass
	public static void preInit() {
		d=new Date(31,2,2019);
	}
	@Test
	public void testDay() {
		if(d.getMonth()==1 || d.getMonth()==3 || d.getMonth()==5 || d.getMonth()==7 || d.getMonth()==8 ||d.getMonth()==10 ||d.getMonth()==12) {
			int expectedResult=31;
			int actualResult = d.getDay();
			Assert.assertFalse("Invalid day ", actualResult>expectedResult);
		}
		else if(d.getMonth()==4 || d.getMonth()==4 || d.getMonth()==9 || d.getMonth()==11) {
			int expectedResult=30;
			int actualResult = d.getDay();
			Assert.assertFalse("Invalid day", actualResult>expectedResult);
		}else if(d.getMonth()==2  ) {
			int expectedResult=28;
			int actualResult = d.getDay();
			Assert.assertFalse("Invalid day", actualResult>expectedResult);
		}
	}

	
	@Test
	public void testMonth() {
		int expectedResult=12;
		int actualResult = d.getMonth();
		Assert.assertFalse("Invalid Month", actualResult>expectedResult);
		
	}
	@Test
	public void testYear() {
		int expectedResult=2019;
		int actualResult = d.getYear();
		Assert.assertFalse("Invalid Year", actualResult>expectedResult);
		
	}

	

}

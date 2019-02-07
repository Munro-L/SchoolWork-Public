package main;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class StudentTest {
	private Student s;
	
	@Before
	public void setup(){
		s = new Student(25, "john");
	}
	
	
	
	@Test
	public void testTwoArgumentConstructor() {
		assertEquals("first name was not set", "john", s.getName());
		assertEquals("last name was not set", 25, s.getID());	
		assertEquals("gpa was not set", 0.0, s.getGpa(),0.01);	
	}
	
	
	@Test
	public void testFullConstructor() {
		s.setGpa(11.0);
		
		assertEquals("first name was not set", "john", s.getName());
		assertEquals("ID name was not set", 25, s.getID());	
		assertEquals("gpa was not set", 11.0, s.getGpa(), 0.01);	
	}
	
	@Test
	public void testEquals(){
		s.setGpa(11.2);
		
		Student s1 = new Student(23, "jane");
		
		assertFalse("equals not properly implemented", s.equals(null));
		assertTrue("equals not properly implemented", s.equals(s));
		
		assertFalse("equals not properly implemented", s.equals(s1));
		
		s1.setID(s.getID());
		assertFalse("equals not properly implemented", s.equals(s1));
		
		s1.setName(s.getName());
		assertFalse("equals not properly implemented", s.equals(s1));
		
		s1.setGpa(s.getGpa());
		assertTrue("equals not properly implemented", s.equals(s1));
	}
	
	@Test
	public void testgetSmarterStudents(){
		Student [] group = new Student[4];
		Student [] group_new = new Student[4];
		
		
		group[0] = new Student(24, "j", 11.5);
		group[1] = new Student(24, "j", 11.2);
		group[2] = new Student(24, "j", 5.0);
		group[3] = new Student(24, "j", 8.6);
	
		group_new[0] = new Student(24, "j", 11.5);
		group_new[1] = new Student(24, "j", 11.2);
		
		assertArrayEquals("Null check", null, s.getSmartStudents(null));		
		assertArrayEquals("didin't check gpa>8.9",group_new, s.getSmartStudents(group));	
	} 
	
	@Test
	public void testremoveStudent(){
		Student [] group = new Student[4];
		Student [] group_new = new Student[4];
		
		
		group[0] = new Student(24, "j", 11.5);
		group[1] = new Student(24, "j", 11.2);
		group[2] = new Student(24, "j", 9.0);
		group[3] = new Student(24, "j", 11.0);
	
		group_new[0] = new Student(24, "j", 11.5);
		group_new[1] = new Student(24, "j", 11.2);
		group_new[2] = new Student(24, "j", 11.0);
		
		assertArrayEquals("Null check", null, s.removeStudent(null, 2));
		assertArrayEquals("Null check", null, s.removeStudent(group, -1));	
		
		assertArrayEquals("didnt remove student", group_new, s.removeStudent(group, 2));
		
	}
	
	@Test
	public void testCreateRandomStudents(){
		Student [] g = s.createRandomStudents();
		boolean correct = true;
		for(int i=0;i<100;i++){
			if (2*(i+1)!=g[i].getID()){
				correct = false;
			}
		}
		assertTrue("id's not as specified",true==correct);
		
	}
	
	


}

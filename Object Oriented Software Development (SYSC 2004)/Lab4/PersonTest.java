package main;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class PersonTest {
	private Person p;
	
	@Before
	public void setup(){
		p = new Person("john", "doe");		
	}
	
	@Test
	public void testTwoArgumentConstructor() {
		assertEquals("first name was not set", "john", p.getFirstName());
		assertEquals("last name was not set", "doe", p.getLastName());	
		assertEquals("age was not set", 0, p.getAge());	
		assertEquals("height was not set", 0, p.getHeight());	
	}
	
	@Test
	public void testFullConstructor() {
		p.setAge(20);
		p.setHeight(165);
		
		assertEquals("first name was not set", "john", p.getFirstName());
		assertEquals("last name was not set", "doe", p.getLastName());	
		assertEquals("age was not set", 20, p.getAge());
		assertEquals("height was not set", 165, p.getHeight());		
	}
	
	@Test
	public void testEquals(){
		p.setAge(20);
		p.setHeight(165);
		
		Person p1 = new Person("philip", "pullman");
		
		assertFalse("equals not properly implemented", p.equals(null));
		assertTrue("equals not properly implemented", p.equals(p));
		
		assertFalse("equals not properly implemented", p.equals(p1));
		
		p1.setAge(p.getAge());
		assertFalse("equals not properly implemented", p.equals(p1));
		
		p1.setFirstName(p.getFirstName());
		assertFalse("equals not properly implemented", p.equals(p1));
		
		p1.setLastName(p.getLastName());
		assertFalse("equals not properly implemented", p.equals(p1));
		
		p1.setHeight(p.getHeight());
		assertTrue("equals not properly implemented", p.equals(p1));	
	}
	

	@Test
	public void testgetSiblings(){
		Person [] group = new Person[10];
		Person [] group_young = new Person[10];
		Person [] noonne = new Person[10];
		Person [] n = null;
		for(int i=0;i<10;i++){
			if(i<5){
				group_young[i] = new Person("p","g",i,150);
			}
			group[i] = new Person("p", "g", i, 150 );
		}
		
		p.setAge(5);
		
		assertArrayEquals("No null check",null, p.getSiblings(n));
		assertArrayEquals("Not checked the age", group_young, p.getSiblings(group));
		
		p.setAge(-1);
		assertArrayEquals("didnt output full array since everyone is older than this", noonne, p.getSiblings(group));
	}
	

	@Test
	public void testOrderPeoplebyHeight(){
		Person [] group = new Person[4];
		Person [] group_ord = new Person[4];
		Person [] group_ord1 = new Person[4];
		
		group[0] = new Person("g","h",20, 35);
		group[1] = new Person("g","h",20, 15);
		group[2] = new Person("g","h",20, 75);
		group[3] = new Person("g","f",20, 16);
		
		group_ord[0] = new Person("g","h",20, 15);
		group_ord[1] = new Person("g","f",20, 16);
		group_ord[2] = new Person("g","h",20, 35);
		group_ord[3] = new Person("g","h",20, 75);
		
		group_ord1[0] = new Person("g","h",20, 75);
		group_ord1[1] = new Person("g","f",20, 35);
		group_ord1[2] = new Person("g","h",20, 16);
		group_ord1[3] = new Person("g","h",20, 15);
		
		boolean correct = true;
		Person [] ans = p.OrderPeopleByHeight(group);
		
		for(int i=0;i<group.length;i++){
			if(ans[i].height!=group_ord[i].height && ans[i].height!=group_ord1[i].height) correct = false;
		}
		
		assertArrayEquals("No null check",null, p.OrderPeopleByHeight(null));
		assertEquals("Not correctly ordered",true,correct);
	}
	
	@Test
	public void testgetPeopleWithSameFirstName(){
		
		Person [] group = new Person[4];
		Person [] group_new = new Person[4];
		
		group[0] = new Person("jake","human");
		group[1] = new Person("jake","heard");
		group[2] = new Person("jake","greg");
		group[3] = new Person("cory","fein");
		
		group_new[0] = new Person("jake","human");
		group_new[1] = new Person("jake","heard");
		group_new[2] = new Person("jake","greg");
		
		assertArrayEquals("No null check",null, p.getPeopleWithSameFirstName(null));
		
		assertArrayEquals("didnt' find same first name", group_new, p.getPeopleWithSameFirstName(group));
	}

}

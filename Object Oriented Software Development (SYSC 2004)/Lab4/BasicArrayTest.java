package main;

import static org.junit.Assert.assertEquals;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Before;
import org.junit.Test;

public class BasicArrayTest {
	
	private BasicArray b;
	
	@Before
	public void setup(){
		b = new BasicArray();
	}
	
	@Test
	public void testSumArray() {
		int [] array = {1,2,3,4};
		assertEquals("Not Summed Correctly", 10, b.sumArray(array));
	}
	
	@Test
	public void testgetEvenNumbers(){
		int [] a = {8,6,4,2,0,0,0,0};
		assertEquals("No Negativity check", null, b.getEvenNumbers(-1));
		assertArrayEquals("returned array incorrect",  a, b.getEvenNumbers(8));
	}
	
	@Test
	public void testGetPrimeNumbers(){
		int [] a = {13,11,7,5,3,2,0,0,0,0,0,0,0,0,0};
		assertEquals("No Negativity check", null, b.getPrimeNumbers(-1));
		System.out.println(b.getPrimeNumbers(15));
		assertArrayEquals("returned array incorrect",  a, b.getPrimeNumbers(15));
	}
	
	@Test
	public void testfindSmallestAndLargets(){
		double [] a = null;
		double [] c = {1,9};
		double [] m = {1,2,3,5,9};
		double [] g = {-3, -2, -1};
		double [] f = {-3, -1};
		assertEquals("No null check", null, b.findSmallestAndLargest(a));
		assertArrayEquals("not the correct output", c, b.findSmallestAndLargest(m), 0);
		assertArrayEquals("not the correct output", f, b.findSmallestAndLargest(g), 0);
	}
	
	@Test
	public void testfindDuplicate(){
		String [] a = null;
		String [] g = {"Jake", "Cory", "Steve"};
		String [] m = {"Jake", "Cory", "Steve", "Cory"};
		assertEquals("No null check", null, b.findDuplicate(a));
		assertEquals("didnt return null because no duplicates", null, b.findDuplicate(g));
		assertEquals("didnt return Cory", "Cory", b.findDuplicate(m));
	}
	
	@Test
	public void testRemove(){
		int [] a = null;
		int [] c = {1,2,3,4,5,6,7}; 
		int [] d = {2,3,4,5,6,7}; 
		assertEquals("No null check", null, b.remove(a, 1));
		assertArrayEquals("didnt remove correctly", d, b.remove(c, 1));	
	}

}

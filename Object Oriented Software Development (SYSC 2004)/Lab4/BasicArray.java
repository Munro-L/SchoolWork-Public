package main;

public class BasicArray {

	
	public int sumArray(int[] array) {
		int i;
		int sum = 0;
		for (i = 0; i < array.length; i++) {
			sum = sum + array[i];
		}
		return sum;
	}
	
	public int[] getEvenNumbers(int val) {
		if (val < 0) {
			return null;
		}
		
		int[] even = new int[val];
		int i;
		int count = 0;
		
		for (i = val; i >= 0; i--) {
			if (i % 2 == 0) {
				even[count] = i;
				count++;
			}
		}
		
		return even;
	}
	
	public int[] getPrimeNumbers(int val) {
		if (val < 0) {
			return null;
		}
		
		int[] primes = new int[val];
		int i;
		int count = 0;
		
		for (i = val; i > 3; i--) {
			if ((i % 3 != 0) && (i % 2 != 0)) {
				primes[count] = i;
				count++;
			}
		}
		
		while(i != 1) {
			primes[count] = i;
			count++;
			i--;
		}
		
		return primes;
	}
	
	public double[] findSmallestAndLargest(double[] array) {
		if (array == null) {
			return null;
		}
		
		int i;
		//need to initialize these to keep Eclipse happy
		double largest = 0;		
		double smallest = 0;
		double[] smallLarge = new double[2];
		
		for (i = 0; i < array.length; i++) {
			if (i == 0) {
				smallest = array[i];
				largest = array[i];
			}
			
			if (array[i] < smallest) {
				smallest = array[i];
			}
			
			if (array[i] > largest) {
				largest = array[i];
			}
		}
		
		smallLarge[0] = smallest;
		smallLarge[1] = largest;
		return smallLarge;
	}
	
	public String findDuplicate(String[] given) {
		if (given == null || given.length == 0) {
			return null;
		}
		
		int i = 0;
		int j = 0;
		String current;
		
		for (i = 0; i < given.length; i++) {
			current = given[i];
			for (j = i + 1; j < given.length; j++) {
				if (current == given[j]) {
					return current;
				}
			}
		}
		return null;	//returns null if there is no match
	}
	
	public int[] remove(int[] oldArray, int val) {
		if (oldArray == null || oldArray.length == 0){
			return null;
		}
		
		int i;
		int j = 0;
		int[] newArray = new int[oldArray.length - 1];
		
		for (i = 0; i < oldArray.length; i++) {
			if (oldArray[i] != val) {
				newArray[j] = oldArray[i];
				j++;
			}
		}
		return newArray;
	}
	
	public static void main(String[] args) {
		BasicArray basicArray1 = new BasicArray();
		int[] arr = {0, 1, 2, 3};
		
		System.out.println(basicArray1.sumArray(arr));

	}
	
}

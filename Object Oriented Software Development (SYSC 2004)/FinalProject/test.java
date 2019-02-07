package main;

public class test {

	public test() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		Alignment al = new Alignment(new DNA(new Strand("s1","AGC"), new Strand("s2","TGA")), 2, -1, -1);
		al.computeAlignments();
		al.printAllOptimalAlignments();
		al.printCompletedMatrix();
	}

}

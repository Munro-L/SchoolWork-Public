package main;

public class Node {

	double score;
	int row;
	int col;
	boolean diag;
	boolean left;
	boolean up;

	public Node(double score, int row, int col) {
		this.score = score;
		diag = false;
		left = false;
		up = false;
		this.row = row;
		this.col = col;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	//adds the corresponding characters to the front of each strand and calls the next node's trace
	public void trace(Node[][] needlemanMatrix, DNA originalDNA, AlignedDNA alignedDNA, String strand1,
			String strand2) {
		if (alignedDNA.optimalAlignments.size() >= 1000) {
			return;
		}
		if (diag == false && left == false && up == false) // We're done! add the strands to the aligned dna list
		{
			alignedDNA.optimalAlignments.add(new DNA(new Strand("Optimal", strand1), new Strand("Optimal", strand2)));
			if(alignedDNA.optimalAlignments.size() >= 1000){
				System.out.print("A Maximum of 1000 Alignments has been reached...");
			}
		} else {
			if (diag == true)// add the corresponding letters to the strands
			{
				String s1 = originalDNA.strand1.sequence.charAt(col - 1) + strand1;
				String s2 = originalDNA.strand2.sequence.charAt(row - 1) + strand2;
				needlemanMatrix[row - 1][col - 1].trace(needlemanMatrix, originalDNA, alignedDNA, s1, s2);
			}

			if (up == true) {
				String s1 = "-" + strand1;
				String s2 = originalDNA.strand2.sequence.charAt(row - 1) + strand2;
				needlemanMatrix[row - 1][col].trace(needlemanMatrix, originalDNA, alignedDNA, s1, s2);
			}

			if (left == true) {
				String s1 = originalDNA.strand1.sequence.charAt(col - 1) + strand1;
				String s2 = "-" + strand2;
				needlemanMatrix[row][col - 1].trace(needlemanMatrix, originalDNA, alignedDNA, s1, s2);
			}
		}
	}

}

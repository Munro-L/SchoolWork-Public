package main;

import java.text.DecimalFormat;

public class Alignment {

	DNA dna;
	double matchScore;
	double mismatchPenalty;
	double gapPenalty;
	AlignedDNA alignedDNA;
	Node[][] alignmentMatrix;
	private int numRows;
	private int numCols;

	private DecimalFormat numberFormat = new DecimalFormat("#0.00"); //used to keep consistent formatting of the matrix.

	public Alignment(DNA dna, double matchScore, double mismatchPenalty, double gapPenalty) {
		this.dna = dna;
		this.matchScore = matchScore;
		this.mismatchPenalty = mismatchPenalty;
		this.gapPenalty = gapPenalty;
		alignedDNA = new AlignedDNA();
		numRows = dna.strand2.getSequence().length() + 1;
		numCols = dna.strand1.getSequence().length() + 1;
		alignmentMatrix = new Node[numRows][numCols];
		for (int i = 0; i < numRows; i++)
			for (int j = 0; j < numCols; j++)
				alignmentMatrix[i][j] = new Node(0.0, i, j);

	}

	public DNA getDna() {
		return dna;
	}

	public void setDna(DNA dna) {
		this.dna = dna;
	}

	public double getMatchScore() {
		return matchScore;
	}

	public void setMatchScore(double matchScore) {
		this.matchScore = matchScore;
	}

	public double getMismatchPenalty() {
		return mismatchPenalty;
	}

	public void setMismatchPenalty(double mismatchPenalty) {
		this.mismatchPenalty = mismatchPenalty;
	}

	public double getGapPenalty() {
		return gapPenalty;
	}

	public void setGapPenalty(double gapPenalty) {
		this.gapPenalty = gapPenalty;
	}

	public AlignedDNA getAlignedDNA() {
		return alignedDNA;
	}

	public void setAlignedDNA(AlignedDNA alignedDNA) {
		this.alignedDNA = alignedDNA;
	}

	public Node[][] getAlignmentMatrix() {
		return alignmentMatrix;
	}

	public void setAlignmentMatrix(Node[][] alignmentMatrix) {
		this.alignmentMatrix = alignmentMatrix;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((alignedDNA == null) ? 0 : alignedDNA.hashCode());
		result = prime * result + ((alignmentMatrix == null) ? 0 : alignmentMatrix.hashCode());
		result = prime * result + ((dna == null) ? 0 : dna.hashCode());
		long temp;
		temp = Double.doubleToLongBits(gapPenalty);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(matchScore);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(mismatchPenalty);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alignment other = (Alignment) obj;
		if (alignedDNA == null) {
			if (other.alignedDNA != null)
				return false;
		} else if (!alignedDNA.equals(other.alignedDNA))
			return false;
		if (alignmentMatrix == null) {
			if (other.alignmentMatrix != null)
				return false;
		} else if (!alignmentMatrix.equals(other.alignmentMatrix))
			return false;
		if (dna == null) {
			if (other.dna != null)
				return false;
		} else if (!dna.equals(other.dna))
			return false;
		if (Double.doubleToLongBits(gapPenalty) != Double.doubleToLongBits(other.gapPenalty))
			return false;
		if (Double.doubleToLongBits(matchScore) != Double.doubleToLongBits(other.matchScore))
			return false;
		if (Double.doubleToLongBits(mismatchPenalty) != Double.doubleToLongBits(other.mismatchPenalty))
			return false;
		return true;
	}

	
	//prints the initialized needleman matrix to the console.
	public void printInitializedMatrix() {
		for (int i = 0; i < numRows; i++) {
			if (i == 0) // Print top
			{
				System.out.print("\t\t");
				for (int k = 0; k < numCols - 1; k++) {
					System.out.print("  " + dna.strand1.sequence.charAt(k) + "\t");
				}
				System.out.print("\n");
				System.out.print("\t");
			}

			if (i > 0) {
				System.out.print(dna.strand2.sequence.charAt(i - 1) + "\t");
			}

			for (int j = 0; j < numCols; j++) {
				if (i == 0 || j == 0) {
					if (alignmentMatrix[i][j].score < 0) {
						System.out.print(numberFormat.format(alignmentMatrix[i][j].score) + "\t");
					} else {
						System.out.print(" " + numberFormat.format((alignmentMatrix[i][j].score + 0.0)) + "\t");
					}
				}

			}

			System.out.print("\n");
		}
	}

	// prints the completed needleman matrix to the console.
	public void printCompletedMatrix() {
		for (int i = 0; i < numRows; i++) {
			if (i == 0) // Print top
			{
				System.out.print("\t\t");
				for (int k = 0; k < numCols - 1; k++) {
					System.out.print("  " + dna.strand1.sequence.charAt(k) + "\t");
				}
				System.out.print("\n");
				System.out.print("\t");
			}

			if (i > 0) {
				System.out.print(dna.strand2.sequence.charAt(i - 1) + "\t");
			}

			for (int j = 0; j < numCols; j++) {
				if (alignmentMatrix[i][j].score < 0) {
					System.out.print(numberFormat.format(alignmentMatrix[i][j].score) + "\t");
				} else {
					System.out.print(" " + numberFormat.format((alignmentMatrix[i][j].score + 0.0)) + "\t");
				}

			}

			System.out.print("\n");
		}
	}

	// prints a single optimal alignment to the console based on the given
	// index.
	public void printOneOptimalAlignment(int index) {
		if (index < alignedDNA.optimalAlignments.size()) {
			System.out.println("Optimal Alignment " + index + ":");
			System.out.println(alignedDNA.optimalAlignments.get(index).strand1.sequence);
			System.out.println(alignedDNA.optimalAlignments.get(index).strand2.sequence);
		} else {
			System.out.println("Index out of range.");
		}
	}

	// prints the optimal alignments to the console.
	public void printAllOptimalAlignments() {
		for (int i = 0; i < alignedDNA.optimalAlignments.size(); i++) {
			System.out.println("Optimal Alignment at Index " + i + ":");
			System.out.println(alignedDNA.optimalAlignments.get(i).strand1.sequence);
			System.out.println(alignedDNA.optimalAlignments.get(i).strand2.sequence);
		}
	}

	// calls all of the individual steps required to compute the optimal
	// alignments
	public void computeAlignments() {
		initializeMatrix();
		computeNeedleman();
		traceback();
	}

	// initializes the needleman matrix's first row and column
	private void initializeMatrix() {
		System.out.print("Initializing Matrix... ");
		for (int i = 0; i < numRows; i++) {
			alignmentMatrix[i][0].setScore(gapPenalty * i);
			if (i != 0)
				alignmentMatrix[i][0].up = true;
		}

		for (int j = 0; j < numCols; j++) {
			alignmentMatrix[0][j].setScore(gapPenalty * j);
			if (j != 0)
				alignmentMatrix[0][j].left = true;
		}
		System.out.print("Initialized.\n");
	}

	// populates the needleman matrix nodes with their respective scores
	private void computeNeedleman() {
		System.out.print("Computing Matrix...");
		double match;
		double delete;
		double insert;
		double optimal;
		Node matchNode;
		Node deleteNode;
		Node insertNode;
		Node currentNode;
		for (int i = 1; i < numRows; i++) {
			for (int j = 1; j < numCols; j++) {
				matchNode = alignmentMatrix[i - 1][j - 1];
				deleteNode = alignmentMatrix[i - 1][j];
				insertNode = alignmentMatrix[i][j - 1];
				currentNode = alignmentMatrix[i][j];
				match = matchNode.getScore() + getMatch(i, j);
				delete = deleteNode.getScore() + gapPenalty;
				insert = insertNode.getScore() + gapPenalty;
				optimal = Math.max(match, delete);
				optimal = Math.max(optimal, insert);
				if (optimal == match) {
					currentNode.diag = true;

				}
				if (optimal == delete) {
					currentNode.up = true;
				}
				if (optimal == insert) {
					currentNode.left = true;
				}
				currentNode.setScore(optimal);
			}
		}

		System.out.print("Needleman Matrix Complete.\n");
	}

	// calls traceback function of the bottom left most node
	private void traceback() {
		System.out.print("Starting Traceback...");
		alignmentMatrix[numRows - 1][numCols - 1].trace(alignmentMatrix, dna, alignedDNA, "", "");
		System.out.print("Traceback Complete!\n");
	}

	// returns the match score for a particular node
	private double getMatch(int i, int j) {
		if (dna.strand2.sequence.charAt(i - 1) == dna.strand1.sequence.charAt(j - 1)) {
			return matchScore;
		} else {
			return mismatchPenalty;
		}
	}

}

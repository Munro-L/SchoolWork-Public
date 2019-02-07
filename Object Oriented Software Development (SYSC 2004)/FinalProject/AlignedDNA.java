package main;

import java.util.*;

public class AlignedDNA extends DNA {

	ArrayList<DNA> optimalAlignments;

	public AlignedDNA() {
		super();
		optimalAlignments = new ArrayList<DNA>();
	}

	public AlignedDNA(Strand strand1, Strand strand2) {
		super(strand1, strand2);
		optimalAlignments = new ArrayList<DNA>();
	}

	public ArrayList<DNA> getOptimalAlignments() {
		return optimalAlignments;
	}

	public void setOptimalAlignments(ArrayList<DNA> optimalAlignments) {
		this.optimalAlignments = optimalAlignments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((optimalAlignments == null) ? 0 : optimalAlignments.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		AlignedDNA other = (AlignedDNA) obj;
		if (optimalAlignments == null) {
			if (other.optimalAlignments != null)
				return false;
		} else if (!optimalAlignments.equals(other.optimalAlignments))
			return false;
		return true;
	}

}

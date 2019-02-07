package main;

public class DNA {

	Strand strand1;
	Strand strand2;

	public DNA() {
		strand1 = new Strand();
		strand2 = new Strand();
	}

	public DNA(Strand strand1, Strand strand2) {
		this.strand1 = strand1;
		this.strand2 = strand2;
	}

	public Strand getStrand1() {
		return strand1;
	}

	public void setStrand1(Strand strand1) {
		this.strand1 = strand1;
	}

	public Strand getStrand2() {
		return strand2;
	}

	public void setStrand2(Strand strand2) {
		this.strand2 = strand2;
	}

	@Override
	public String toString() {
		return "DNA [strand1=" + strand1 + ", strand2=" + strand2 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((strand1 == null) ? 0 : strand1.hashCode());
		result = prime * result + ((strand2 == null) ? 0 : strand2.hashCode());
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
		DNA other = (DNA) obj;
		if (strand1 == null) {
			if (other.strand1 != null)
				return false;
		} else if (!strand1.equals(other.strand1))
			return false;
		if (strand2 == null) {
			if (other.strand2 != null)
				return false;
		} else if (!strand2.equals(other.strand2))
			return false;
		return true;
	}

}

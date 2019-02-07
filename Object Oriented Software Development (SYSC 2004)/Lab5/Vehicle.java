package vehicles;

/*
 * Lindsay Munro-Mirehouse, 100996746
 * Vehicle Class, Feb 28th 2017
 */

public class Vehicle {
	private int numOfTires;
	private int numOfPassengers;
	private double speed;
	private String colour;
	
	//basic methods
	public Vehicle(int newTires, int newPassengers, double newSpeed, String newColour) {
		this.numOfTires = newTires;
		this.numOfPassengers = newPassengers;
		this.speed = newSpeed;
		this.colour = newColour;
	}

	public int getNumOfTires() {
		return numOfTires;
	}

	public void setNumOfTires(int numOfTires) {
		this.numOfTires = numOfTires;
	}

	public int getNumOfPassengers() {
		return numOfPassengers;
	}

	public void setNumOfPassengers(int numOfPassengers) {
		this.numOfPassengers = numOfPassengers;
	}

	public double getSpeed() {
		return speed;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	@Override
	public String toString() {
		return "Vehicle [numOfTires=" + numOfTires + ", numOfPassengers=" + numOfPassengers + ", speed=" + speed
				+ ", colour=" + colour + "]";
	}
	
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		
		if ((this == null) || (obj == null) || (this.getClass() != obj.getClass())) {
			return false;
		}
		
		Vehicle vehicle = (Vehicle) obj;
		
		if ((this.getNumOfTires() == vehicle.getNumOfTires()) && (vehicle.getNumOfPassengers() == this.getNumOfPassengers() && (this.getSpeed() == vehicle.getSpeed()) && (this.getColour() == vehicle.getColour()))) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//other methods
	public double turnRight() {
		this.setSpeed(this.getSpeed() + 5);
		return this.getSpeed();
	}
	
	public double turnLeft() {
		this.setSpeed(this.getSpeed() + 2);
		return this.getSpeed();
	}
}
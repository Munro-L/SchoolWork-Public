package vehicles;

/*
 * Lindsay Munro-Mirehouse, 100996746
 * MotorVehicle Class, Feb 28th, 2017
 */

public class MotorVehicle extends Vehicle {
	private double maxSpeed;
	private String licensePlate;
	
	public MotorVehicle(int newTires, int newPassengers, String newColour, String newPlate, double newSpeed, double newMaxSpeed) {
		super(newTires, newPassengers, newSpeed, newColour);
		this.maxSpeed = newMaxSpeed;
		this.licensePlate = newPlate;
	}

	public double getMaximumSpeed() {
		return maxSpeed;
	}

	public void setMaximumSpeed(double maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	
	@Override
	public String toString() {
		return super.toString() + "MotorVehicle [maxSpeed=" + maxSpeed + ", licensePlate=" + licensePlate + "]";
	}
	
	public boolean equals(Object obj) {
		if (super.equals(obj) && (this.getClass() == obj.getClass())) {
			MotorVehicle motVeh = (MotorVehicle) obj;
			if ((this.getMaximumSpeed() == motVeh.getMaximumSpeed()) && (this.getLicensePlate() == motVeh.getLicensePlate())) {
				return true;
			}		
		}
		
		return false;
	}

	public double move(int speedUp) {
		this.setSpeed(this.getSpeed() + speedUp);
		
		if (this.getSpeed() >= this.getMaximumSpeed()) {
			this.setSpeed(this.getSpeed() - 2*speedUp);
		}
		
		if (this.getSpeed() < 0) {
			this.setSpeed(this.getSpeed() + speedUp);
		}
		
		return this.getSpeed();
	}
}

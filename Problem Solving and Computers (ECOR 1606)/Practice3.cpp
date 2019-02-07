// INSERT YOUR PROGRAM COMMENTS HERE
//
// Name:
// Student Number:

#include <iostream>
#include <cmath>
#include <iomanip>
#include <cstdlib>

using namespace std;

bool isInt (double value) {
    double dummy;
    return bool(modf(value, &dummy) == 0);
}

double sqr(double value) {
	return value * value;
}

double computePressure(double hubD, double interference, double tireThick) {
	double b = 0.5 * hubD; 					//radius of hub
	double p; 								//interface pressure
	double c = b + tireThick;				//radius of hub plus tire thickness

	//modulus and poisson ration associateded with using steel hubs and tires
	const double youngMod = 207e9;
	const double poisson = 0.28;

	//computes interface pressure
	p = (interference / b) / ((1 / youngMod) * (((sqr(c) + sqr(b)) / (sqr(c) - sqr(b))) + poisson) + (1 / youngMod) * (1 - poisson));

	return p;
}

int main (void) {

    // INSERT YOUR CONSTANT DECLARATIONS HERE

    // INSERT YOUR VARIABLE DECLARATIONS HERE
    double hubD;			//diameter of hub
	double interference;
	double i;				//used in for loop
	double tireThick;		//thickness of tire
	double pressure;		//interface pressure between tire and hub
	double closestSoFar;	//pressure closest to ideal
	double closestTire;		//tire thickness that created the closest pressure


    // INSERT YOUR STATEMENTS HERE
	//testing computePressure Function
//	double hubD = 1;
//	double interference = 0.005;
//	double tireThick = 0.06;
//	cout << computePressure(hubD, interference, tireThick);


//	//PROGRAM STARTS HERE
	cout << "Enter hub diameter and interference:" << endl;
	cin >> hubD >> interference;

	//loops until exit conditions are met
	while (hubD != 0 || interference != 0) {

		//checks for invalid entries
		while (hubD < 0.5 || hubD > 2.5 || interference <= 0 || interference >= 0.05 * hubD) {
			cout << "Invalid entries ignored" << endl;
			cout << "Enter hub diameter and interference:" << endl;
			cin >> hubD >> interference;

			//checks for exit conitions
			if (hubD == 0 && interference == 0) {
				break;
			}
		}

		//if user entered exit conditions after entering garbage, they will still be able to exit
		if (hubD == 0 && interference == 0) {
				break;
		}

		//outputs table header
		cout << setw(20) << "Tire Thickness (cm)" << setw(30) << "Interface Pressure (MPa)" << endl << "--------------------------------------------------" << endl;

		//computes pressure for different tire thicknesses
		for (i = 0; i <= 12; i++) {
			tireThick = 0.06 + i * 0.005;
			pressure = computePressure(hubD, interference, tireThick);

			//tracks closest tire pressure to the acceptable value
			if (fabs(pressure - 20e6) < fabs(closestSoFar - 20e6) || i == 0) {
				closestSoFar = pressure;
				closestTire = tireThick;
			}

			//outputs a cute table :)
			cout << setw(12) << fixed << setprecision(1) << tireThick * 100 << setw(30) << setprecision(4) << pressure / 1000000 << endl;
		}

		//checks if any tire thicknesses are acceptable, and if so, outputs the closest
		if (closestSoFar > 25e6 || closestSoFar < 15e6) {
			cout << "None of the tire thicknesses are acceptable" << endl;
		} else {
			cout << "The ideal tire thickness is " << setprecision(1) << closestTire * 100 << "cm giving the pressure " << setprecision(0) << closestSoFar / 1e6 << "MPa" << endl;
		}

		//prompts for new values
		cout << "Enter hub diameter and interference:" << endl;
		cin >> hubD >> interference;

	}

    system("PAUSE"); return 0;

}

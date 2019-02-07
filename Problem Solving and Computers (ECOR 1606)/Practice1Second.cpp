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

double Si(double x) {
	//a metric shitload of constants
	const double A0 = 2.5253303767;
    const double A1 = 1.0370462484;
    const double A2 = 0.5688888889;
    const double A3 = 0.3111070642;
    const double A4 = 0.1242940878;
    const double t0 = 0.0469100770;
    const double t1 = 0.2307653450;
    const double t2 = 0.5000000000;
    const double t3 = 0.7692346550;
    const double t4 = 0.9530899230;

    //stores the result
    double output;

    //does all the math
    output = A0 * sin(x * t0);
    output = output + A1 * sin(x * t1);
    output = output + A2 * sin(x * t2);
    output = output + A3 * sin(x * t3);
    output = output + A4 * sin(x * t4);

    return output;
}

int main (void) {

    // INSERT YOUR CONSTANT DECLARATIONS HERE

    // INSERT YOUR VARIABLE DECLARATIONS HERE
	double a, b;
	int N;
	double i;
	double step;
	double greatestSoFar;
	double leastSoFar;

    // INSERT YOUR STATEMENTS HERE

    //testing Si function
    //cout << Si(1) << endl << Si(2) << endl << Si(3);

    //PROGRAM STARTS HERE


    cout << "Enter a, b and N" << endl;
    cin >> a >> b >> N;

    //checks for exit conditions
    while (a != 0 || b != 0 || N != 0) {

		//checks for garbage
    	while (a <= 0 || b < a || N < 2) {
    		cout << "Invalid entries ignored" << endl;
    		cin >> a >> b >> N;

    		//checks for exit conditions
    		if (a == 0 && b == 0 && N == 0) {
    			continue;
    		}
    	}

    	for (i = 0; i < N; i++) {
    		double x = a + i * (b - a) / (N - 1);

			cout << "X = " << x << ", Si(x) = " << Si(x) << endl;

    		if (Si(x) > greatestSoFar || i == a) {
    			greatestSoFar = Si(x);
    		}
    		if (Si(x) < leastSoFar || i == a) {
    			leastSoFar = Si(x);
    		}
    	}

    	cout << "Minimum Si = " << leastSoFar << endl << "Greatest Si = " << greatestSoFar << endl;

    	cout << "Enter a, b and N" << endl;
    	cin >> a >> b >> N;
    }

    system("PAUSE"); return 0;

}

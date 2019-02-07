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
	double value;

	double a0 = 2.5253303767;
	double a1 = 1.0370462484;
	double a2 = 0.5688888889;
	double a3 = 0.3111070642;
	double a4 = 0.1242940878;

	double t0 = 0.0469100770;
	double t1 = 0.2307653450;
	double t2 = 0.5000000000;
	double t3 = 0.7692346550;
	double t4 = 0.9530899230;

	value = a0 * sin(x * t0);
	value = value + a1 * sin(x * t1);
	value = value + a2 * sin(x * t2);
	value = value + a3 * sin(x * t3);
	value = value + a4 * sin(x * a4);

	return value;
}

int main (void) {

    // INSERT YOUR CONSTANT DECLARATIONS HERE

    // INSERT YOUR VARIABLE DECLARATIONS HERE
    double a, b, i;
	int N;
    double test = 0;
    double greatestSoFar = 0;
	double leastSoFar = 0;

    // INSERT YOUR STATEMENTS HERE
    //prompts for user values
    cout << "Enter a, b and N: " << endl;
	cin >> a >> b >> N;

	//checks for exit conditions
    while (a != 0 && b != 0 && N !=0) {

    	//checks if values are valid and prompts for new ones if needed
    	while (a < 0 || b < a || N < 2) {
    		cout << "Entered values are not acceptible" << endl;
    		cout << "Enter a, b and N: " << endl;
			cin >> a >> b >> N;

			//checks for exit conditions
			if (a == 0 && b == 0 && N == 0) {
				break
			}
    	}

    	//meant to catch users who entered garbage, and now want to exit
    	if (a == 0 && b == 0 && N == 0) {
			break
		}

	    //does the math, loops over a to b in steps of N
	    for (i = a; i <= b; i = i + N) {
	    	test = Si(i);

	    	//finds greatest and least values
			if (test > greatestSoFar || i == a) {
	    		greatestSoFar = test;
	    	}
	    	if (test < leastSoFar || i == a) {
	    		leastSoFar = test;
	    	}
	    }

		//outputs results
		cout << greatestSoFar << endl << leastSoFar << endl;

		//prompts for new values and repeats
		cout << "Enter a, b and N: " << endl;
		cin >> a >> b >> N;

	}

	system("PAUSE"); return 0;
}

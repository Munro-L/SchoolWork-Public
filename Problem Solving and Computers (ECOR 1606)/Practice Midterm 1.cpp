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



int main (void) {

    // INSERT YOUR CONSTANT DECLARATIONS HERE
    const double E = 207e9;		//Young's Modulus
    
    // INSERT YOUR VARIABLE DECLARATIONS HERE
    double 	diam, 			//diameter of tire
			thick, 			//tire thickness
			sigma,			//interference
			c,				//radius of tire
			p,				//pressure in Pa
			b,				//radius of hub
			
			//Math shortcuts			
			scaryFraction,
			numerator,
			denominator;
			
	double sum = 0;
	double count = 0;
	double greatP = 0;		
   
    // INSERT YOUR STATEMENTS HERE
    cout << "Enter diameter, tire thickness, and interference (-1 -1 -1 to stop):" << endl;
    cin >> diam >> thick >> sigma;
    
    //checks for exit conditions
    while ((diam != -1) && (thick != -1) && (sigma != -1)) {
    	
    	//checks to make sure entries are valid
		while (!(((diam >= 0.5) && (diam <= 2.5)) || ((thick >= 0.05) && (thick <= 0.1)) || ((sigma > 0) && (sigma < (0.05 * diam))))) {
    		cout << "Invalid values ignored." << endl;
    		cout << "Enter diameter, tire thickness, and interference (-1 -1 -1 to stop):" << endl;
    		cin >> diam >> thick >> sigma;
		}
		
		//finds radius of whole tire & radius of hub alone
		c = diam / 2;
    	b = c - thick;
    	
    	//computes pressure and outputs the result
    	p = (sigma / b) / ( (1 / E) * (1 + (pow(c,2) + pow(b,2)) / (pow(c,2) - pow(b,2))) );
    	//scaryFraction = (sqr(c) + sqr(b)) / (sqr(c) - sqr(b));
		//numerator = sigma / b;
    	//denominator = (1 / E) * (1 + scaryFraction);
    	//p = numerator / denominator;
    	cout << "The pressure is " << p << "Pa." << endl;
    	
    	//keeps track of sum and count
    	sum = sum + p;
    	count = count + 1;
    	
    	//tracks largest number
    	if (count == 1 || p > greatP) {
    		greatP = p;
    	}
    	
    	//prompts for new entries
    	cout << "Enter diameter, tire thickness, and interference (-1 -1 -1 to stop):" << endl;
    	cin >> diam >> thick >> sigma;
    }
    
    cout << "The average is " << sum / count << "Pa." << endl;
    cout << "The greatest pressure is " << greatP << "Pa." << endl;
    
    system("PAUSE"); return 0;

}

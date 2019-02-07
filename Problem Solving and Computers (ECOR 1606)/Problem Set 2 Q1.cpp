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
    
    // INSERT YOUR VARIABLE DECLARATIONS HERE
    double n;			//number entered by user
    double piTest;		//keeps track of pi calculation
    double denom = 1;	//denominator of fraction in series
    double branch = 1;	//cycles between 1 and 0 to decide which branch of the while loop to take
   
    // INSERT YOUR STATEMENTS HERE
    //recieves values from the user
    cout << "Enter a value for n:" << endl;
    cin >> n;
    
    //checks if numbers are intergers
    while (!(isInt(n))) {
    	cout << "Error: An Integer must be entered." << endl << "Enter another number:";
    	cin >> n;
    }
    
    //calculates denominator of last fraction in series
    n = 2 * n + 1;
    
    //calculates first fraction of series
    piTest = piTest + 1 / denom;
    
    //does the math, alternates positives and negatives
    while ((denom <= n)) {
    	if(branch == 0) {
    		denom = denom + 2;
    		piTest = piTest + 1 / denom;
    		branch++;
    	}
    	
    	if (branch == 1) {
    		denom = denom + 2;
    		piTest = piTest - 1 / denom;
    		branch--;
    	}
    }
    
    //multiplies series by 4
	piTest = 4 * piTest;
	
	//outputs result
	cout << "The value obtained for pi is " << piTest << "." << endl;

    
    
    system("PAUSE"); return 0;

}

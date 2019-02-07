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

    //variables to do with lot dimensions
    double lotWidth;
    double lotLength;
    double allowedLotLength;
    double allowedLotWidth;

    double change;				//temporarily stores a number to allow lotWidth and lotLength to swap

    //variables to do with house dimesnions
    double houseWidth;
    double houseLength;

    //variables to do with ares
    double lotArea;
    double houseArea;

    //variables to do with statistics
    int numFit = 0;					//number of houses that fit the lot
    int numBig = 0;					//number of houses that are too big
    int numSmall = 0;				//number of houses that are too small
    int numClear = 0;				//number of houses that do not fit lot line clearance
  	int numLotTries = 0;			//number of attempted entries
  	int numHouseEntries = 0;		//number of house dimensions entered
  	int invalidHouse = 0

	// INSERT YOUR STATEMENTS HERE
    cout << "Enter lot dimensions: " << endl;
    cin >> lotWidth >> lotLength;
    numLotTries++;

    //checks if lot dimensions are positive
    while (lotWidth < 0 || lotLength < 0) {
	    cout << "Only positive numbers are valid: " << endl;
	    cout << "Enter lot dimensions: " << endl;
		cin >> lotWidth >> lotLength;
		numLotTries++;
	}

    //forces lotWidth to always be the smaller number
    if (lotLength < lotWidth) {
    	change = lotWidth;
    	lotWidth = lotLength;
    	lotLength = change;
    }

    cout << "Enter house dimensions (0 0 to exit): " << endl;
	cin >> houseWidth >> houseLength;
	numHouseEntries++;

	//checks for exit conditions
    while (houseWidth != 0 && houseLength != 0) {

    	//checks if house dimensions are positive
	    while (houseWidth < 0 || houseLength < 0) {
	    	cout << "Only positive numbers are valid: " << endl;
	    	cout << "Enter house dimensions (0 0 to exit): " << endl;
			cin >> houseWidth >> houseLength;
			numHouseEntries++;
	    }

	    //forces houseWidth to always be the smaller number
	    if (houseLength < houseWidth) {
	    	change = houseWidth;
	    	houseWidth = houseLength;
	    	houseLength = change;
	    }

	    //sets lot clearance boundary
	    allowedLotWidth = lotWidth - 4;
	    allowedLotLength = lotLength - 4;

	    //calculates lot and house area
	    lotArea = lotWidth * lotLength;
	    houseArea = houseWidth * houseLength;


	    //checks conditions and outputs result
	    if ((houseWidth > allowedLotWidth) || (houseLength > allowedLotLength)) {
	    	cout << "The house does not allow for lot clearance." << endl;

		} else if (houseArea < 0.25 * lotArea) {
			cout << "The house is too small." << endl;

		} else if (houseArea > 0.4 * lotArea) {
			cout << "The house is too big." << endl;

		} else {
			cout << "The house fits the lot." << endl;
		}

		//takes in new values and starts over
		cout << "Enter house dimensions (0 0 to exit): " << endl;
	    cin >> houseWidth >> houseLength;
	    numHouseEntries++;

	}

    cout << "The number of tries to get a valid lot size is " << numLotTries << "." << endl;
    cout << "the number of house sizes entered is " << numHouseEntries << "." << endl;

    system("PAUSE"); return 0;

}

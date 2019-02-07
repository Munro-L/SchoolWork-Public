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
    const double E = 207E9;              //Young's modulus for material

    // INSERT YOUR VARIABLE DECLARATIONS HERE
    double p,      //interface pressure (in Pa)
           b,      //radius of hub (m)
           c,      //radius of hub plus tire thickness (m)
           delta,  //amount of interference (m)
           diaB,   //diameter for b
           thick,  //tire thickness

    // INSERT YOUR STATEMENTS HERE
    cout << "Enter diameter, tire thickness, and interference (-1 -1 -1 to stop):" << endl;
    cin >> diaB >> thick >> delta;
    
    while (!(diaB == -1 && thick == -1 && delta == -1)) {
          
          if (diaB < 0.5 || diaB > 2.5 || thick < 0.05 || thick > 0.1 || delta <= 0 || delta > 0.005 * diaB) {
                //get here for invalid
                cout << "Invalid entries ignored." << endl;
                
          } else {
                 //get here for valid, do the math
          ]
             
                       
          cout << "Enter diameter, tire thickness, and interference (-1 -1 -1 to stop):" << endl;
          cin >> diaB >> thick >> delta;
          }
          } //endwhile

    system("PAUSE"); return 0;

}

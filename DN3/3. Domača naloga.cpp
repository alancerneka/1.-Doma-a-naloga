#include <iostream>
#include <cmath>
using namespace std;

// Funkcija za izračun arctan(x) s preko Taylorjeve vrste
double arctan(double x, int n) {
    double rezultat = 0.0;
    for (int i = 0; i <= n ; ++i ) {
        rezultat += pow(-1, i) * pow( x, 2 * i + 1)/(2 * i + 1);
    }
    return rezultat;
}


// Funkcija za izračun približka integrala preko Taylorjeve vrste
double TMetoda(double a, double b, int n) {
    double h = (b - a) / n;
    double integral = 0.0;

    for ( int i = 0;i <= n; ++i ) {
        double x =  a + ( i * h);
        double funkcija = (exp(3 * x) * arctan(x / 2, 10));

        if (i == 0 || i == n) {
            //Če se nahajamo na robnih točkah intervala
            integral += funkcija *h/2;
        } 
        
        else {
            //Če se nahajamo v točkah znotraj intervala
            integral += h * funkcija;
        }
        
    }
    return integral;
    
}

int main() {
    
    const double pi = 3.141592653589;
    int n = 100000;
    
    //Meje intervala
    double a = 0.0;
    double b = pi / 4.0;
    

    double priblizek = TMetoda(a, b, n);

    cout << "Približna vrednost integrala je: " << priblizek <<endl<<"Pri "<<n<<" enakih podintervalih"<< endl;

    return 0;
}


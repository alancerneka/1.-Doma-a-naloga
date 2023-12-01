#include <iostream>
#include <fstream>

#include <vector>

using namespace std;

int main() {
    
    int Število;
    int ID;
    
    double x;
    double y;

    char d;
    //vektorji za shranjevanje
    vector<int> seznamID;
    vector<double> seznamY;
    vector<double> seznamX;
    vector<double> seznamOdvod;
    
    ifstream file;
    file.open("poly.txt",ios::in);

//Preverjanje ali je odprvlo datoteko
    if (file.is_open()) {

        file >> Število;
//shranjevanje števil v vektorje
        while (file >> ID >> d >> x >> y) {
            seznamID.push_back(ID);
            seznamX.push_back(x);
            seznamY.push_back(y);
        }

        file.close();
//računanje odvoda 
        for (int i = 0; i < Število; i++) {
            
            if (seznamID.at(i) == seznamID.at(0)) {
                seznamOdvod.push_back((-3 * seznamY.at(i) + 4 * seznamY.at(i + 1) - seznamY.at(i + 2)) / (2 * (seznamX.at(i + 1) - seznamX.at(i))));
                //cout << seznamOdvod.at(i) << endl;
            }
            else if (seznamID.at(i) == seznamID.at(Število-1)) {
                seznamOdvod.push_back((3 * seznamY.at(i) - 4 * seznamY.at(i - 1) + seznamY.at(i - 2)) / (2 * (seznamX.at(i) - seznamX.at(i - 1))));
                //cout << seznamOdvod.at(i) << endl;
            }
            else {
                seznamOdvod.push_back((seznamY.at(i + 1) - seznamY.at(i - 1)) / (2 * (seznamX.at(i) - seznamX.at(i - 1))));
                //cout << seznamOdvod.at(i) << endl;
            }
        }
        ofstream newFile;
        //odpiranje nove datoteke
        newFile.open("diff_poly.txt", ios::out);

        if (newFile.is_open()) {
            //zapisovanje odvodov v datoteko
            for (int i = 0; i < Število; i++) {
                newFile << seznamOdvod.at(i) << endl;
            }
            newFile.close();
        }
        else cout << "Beležke ni bilo možno napisati\n";
    }
    else cout << "Beležka ni odprta\n";
    
    return 0;
}
#include <iostream>
//#include <Eigen/Core>

using namespace std;

int ajouteDeux(int a)
{
    a+=2;
    return a;
}

int main()
{
    int nombre(4), resultat;
    resultat = ajouteDeux(nombre);

    //Eigen::VectorXd l_arm=Eigen::VectorXd::Ones(4);
    
    cout << "Le nombre original vaut : " << nombre << endl;
    cout << "Le resultat vaut : " << resultat << endl;

    //cout << "vectorXd est égal à : " << l_arm << endl;
    return 0;
}

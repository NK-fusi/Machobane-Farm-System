#include <iostream>
using namespace std;

string Maize = "************************maize";
string Peas = "+++++++++++++++++++++++++Peas";
string Wheat = "&&&&&&&&&&&&&&&&&&&&&&&&&&Wheat";
string Potatoes = "------------------------Potatoes";
string Beans = "%%%%%%%%%%%%%%%%%%%%%%%%%%%Beans";
string Pumpkin = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Pumpkin";
string Sorghum = "##############################Sorghum";
string Watermelon = "^^^^^^^^^^^^^^^^^^^^^^^^^^^Watermelon";
string Groundnuts = "$$$$$$$$$$$$$$$$$$$$$$$$$$Groundnuts";
void WinterPlanting()
{
	cout << "PLot1" << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout  << Potatoes << endl;
    cout << "Plot2" << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << Wheat << endl;
    cout << "Plot3" << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
    cout << Peas << endl;
}
void PrepareSoil(int Moisture,int Fertility)
{
    if (Moisture>5  && Fertility>5)
    {
        return;
    }
    else
    {
        cout<<"Add manure: ";
        cin>>Fertility;
    }
}

void SummerPlanting()
{
    int Season;
    cout << "----Choose Season ----\n";
    cout << "1. Winter\n" ;
    cout << "2. Summer\n" ;

    cout << "Enter Sesson: ";
    cin >> Season;
    cout << "" << endl;

    if (Season==1)
    {
        string choice1;
        cout << "--------You can Plant the following in winter-----\n";
        cout<<"POtatoes\n";
        cout<<"Wheat\n";
        cout<<"Peas\n";
        cout<< "Do you want to plant the above Plants(Y/N): ";
        
        cin >> choice1;

        if (choice1=="Y")
        {
        cout <<Potatoes<<endl;
        cout <<Wheat<<endl;
        cout <<Peas<<endl;
        }
        else
            return;
        


    }

    else if(Season==2)
    {
        string choice2;
        cout << "--Well looks like its summer so you intercrop the following--\n";
        cout << Maize<<endl;
        cout << Beans<<endl;
        cout << Pumpkin<<endl;
        cout << Sorghum<<endl;
        cout << Watermelon<<endl;
        cout << Groundnuts<<endl;
        cout << "Do you wish to proceed? the intercroping is automated based on your feild(Y/N): ";
        cin >> choice2;

        if (choice2 == "Y")
        {
            cout <<Maize<<endl;
            cout<<Beans<<endl;
            cout<<Maize<<endl;
            cout<<Beans<<endl;
        }

        else
          return;
    }


}
void ManageMoisture()
{
    int temp=0;
    cout << "Initial Moisture = " << temp << endl;
    cout << "Increase Moisture: ";
    cin >> temp;
    cout << "Moisture has been increased to " << temp << endl;

}
void CropMagement();
void Harvesting();

int main() {



    int choice;
    int Moisture;
    int Fertility;

    cout<<"Enter soil moisture levels"<<endl;
    cin>>Moisture;
    cout<<"Enter soil fertility"<<endl;
    cin>>Fertility;

    do {
        // Display the menu
        cout << "Menu:\n";
        cout << "6. Prepare the soil\n";
        cout << "1. Planting\n";
        cout << "2. Moisture Management\n";
        cout << "3. Not Set\n";
        cout << "4. Exit\n";
        cout << "Enter your choice: ";

        // Get user choice
        cin >> choice;

        // Process user choice
        switch (choice) {
            case 6:
                PrepareSoil(Moisture,Fertility);
            case 1:
                SummerPlanting();
            
                break;
            case 2:
                ManageMoisture();
                
                break;
            case 3:
                cout << "You selected Option 3.\n";
           
                break;
            case 4:
                cout << "Exiting program. Goodbye!\n";
                break;
            default:
                cout << "Invalid choice. Please enter a valid option.\n";
        }

    } while (choice != 4);

    return 0;
}

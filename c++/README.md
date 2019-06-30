##### Using The Program

The C++ version

The C++ folder consists of a cpp file and the example csv and txt files. The class where the work is done is in the [`compare_csv.cpp`](./compare_csv.cpp) file.

To run the C++ program, make sure you have a C++ compiler on your machine. Then simply cd into this directory, compile the [`compare_csv.cpp`](./compare_csv.cpp) file, and run it.

```
make compare_csv
```

```
./compare_csv
```

The program consists of two different classes. One class, ```VectorFromFile``` creates a vector of strings from a txt file that contains your master list of emails. The other class, ```CombineCSVs``` creates another vector of strings with emails from any number of csv files you feed it. The program is currently hardcoded to take the example csv files in this folder. You can change the length of the array passed into the ```CombineCSVs``` class and give it all the csv files you need.

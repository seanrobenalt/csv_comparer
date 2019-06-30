#include <iostream>
#include <iomanip>
#include <fstream>
#include <vector>
#include <iostream>
#include <sstream>
#include <array>
#include <algorithm>
using namespace std;

// function to compare strings for uniqueness
bool compare_string (string str_one, string str_two) {
  return (str_one == str_two);
}

// this class removes new line characters from the lines of a file
class VectorFromFile {
  public:
    vector<string> format_and_return_vector(string);
};

vector<string> VectorFromFile::format_and_return_vector(string file_name) {
  int pos;

  array<string, 2> chars_to_remove = { "\n", "\r" };

  string line;

  ifstream master_file(file_name);
  vector<string> master_list_emails;

  while(getline(master_file, line)) {

    for(int i = 0; i < chars_to_remove.size(); i++)
    {
      if((pos=line.find(chars_to_remove[i])) != string::npos)
        line.erase(pos);
    }

    master_list_emails.push_back(line);
  }
  return master_list_emails;
}

// this class combines csv files, you can combine any number by changing length of array passed in
class CombineCSVs {
  public:
    vector<string> format_and_return_email_list(array<string, 2>);
};

vector<string> CombineCSVs::format_and_return_email_list(array<string, 2> files_list) {
  vector<string> new_emails;

  string line;

  for(int i = 0; i < files_list.size(); i++)
  {
    ifstream a_file(files_list[i]);

    while(getline(a_file, line)) {
      istringstream csv_stream(line);

      string data;

      while(getline(csv_stream, data, ',')) {
        data.erase(remove(data.begin(), data.end(), '\n'), data.end());
        new_emails.push_back(data);
      }
    }
  }
  return new_emails;
}

// uses the two above classes, and then writes a new csv file to this directory
int main() {
  VectorFromFile master_list;
  vector<string> master_list_emails = master_list.format_and_return_vector("master_list.txt");

  array<string, 2> files_list = { "some_file.csv", "some_other_file.csv" };
  CombineCSVs new_email_list;
  vector<string> new_emails = new_email_list.format_and_return_email_list(files_list);

  // make the new_emails list not have duplicates
  unique(new_emails.begin(), new_emails.end(), compare_string);

  ofstream new_non_duplicate_list_file;
  new_non_duplicate_list_file.open("new_non_duplicate_list.csv");
  new_non_duplicate_list_file << "Email\n";

  for(int i = 0; i < new_emails.size(); i++)
  {
    bool already_exists = find(master_list_emails.begin(), master_list_emails.end(), new_emails[i]) != master_list_emails.end();

    if (already_exists == 0 && new_emails[i].find("@") != string::npos)
      new_non_duplicate_list_file << new_emails[i] << "\n";
  }

  return 0;
}

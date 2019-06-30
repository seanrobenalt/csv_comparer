##### Using The Program

The Ruby folder consists of a test scenario and outcome. The class where the work is done is in the [`compare_csv.rb`](./compare_csv.rb) file.

To instantiate a new `CompareCSV` instance, you must pass in a master file (txt) and an array of csv files you want to compare to it. The master file should consist of the emails you DO NOT want to send marketing emails to and be a txt file. For an example, see [`master_list.txt`](./master_list.txt).

For the example in this repo, you would instantiate the instance by running:

```
instance = CompareCSV.new("master_list.txt", ["some_file.csv", "some_other_file.csv"])
```

The `CompareCSV` instance will take care of removing new line characters from the emails in the `master_list.txt`, by using a separate class, [`ArrayFromFile`](./array_from_file.rb).

If you then run `execute` on your instance:

```
instance.execute
```

You will get a new csv file generated in this directory. The generated csv file will contain a csv with first names, last names and emails of the folks who were not in your master file.

*Edit: run the program from IRB in the command line like so:*

```
✔ ~/Documents/csv_comparer [master|✔]
22:42 $ irb
2.3.7 :001 > require_relative "compare_csv"
 => true
2.3.7 :002 > instance = CompareCSV.new("master_list.txt", ["some_file.csv", "some_other_file.csv"])
 => #<CompareCSV:0x00007f8ba0227a80 @master_file="master_list.txt", @files=["some_file.csv", "some_other_file.csv"], @new_non_duplicate_list=[]>
2.3.7 :003 > instance.execute
 => [{:first_name=>"Test", :last_name=>"ShouldBeInFinal", :email=>"notinmasterfile@gmail.com"}, {:first_name=>"Test", :last_name=>"OneMore", :email=>"onemorenotinmaster@gmail.com"}, {:first_name=>"Duplicate", :last_name=>"Person", :email=>"shouldshowonceinfinal@gmail.com"}, {:first_name=>"Test", :last_name=>"Person3", :email=>"tester3notinmaster@gmail.com"}, {:first_name=>"Test", :last_name=>"Hotmail", :email=>"tester5notinmaster@hotmail.com"}, {:first_name=>"Test", :last_name=>"ShouldBeInFinal", :email=>"2notinmasterfile@gmail.com"}, {:first_name=>"Test", :last_name=>"OneMore", :email=>"onemorenotinmaster@gmail.com"}, {:first_name=>"Duplicate", :last_name=>"Person", :email=>"shouldshowonceinfinal@gmail.com"}]
2.3.7 :004 > exit
```

##### Testing

The repo also comes with a [test file](./compare_spec.rb). You must have `rspec` installed on your machine for this to work. If you get an error, just run `gem install rspec`.

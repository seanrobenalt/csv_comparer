#### CompareCSV

This is a simple Ruby program that produces a csv with first names, last names and emails.

##### The Use Case

This program is useful to run when building email lists for marketing campaigns. You might have many different forms for email submission - newsletter forms, generic contact forms, giveaway forms, etc. These forms may feed into many different lists. By the time you are ready to send out mass marketing emails, some people in these lists may have already signed up for your services and should not receive your marketing emails.

##### Using The Program

First clone this repo.

The repo consists of a test scenario and outcome. The class where the work is done is in the [`compare_csv.rb`](./compare_csv.rb) file.

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

##### Testing

The repo also comes with a [test file](./compare_spec.rb). You must have `rspec` installed on your machine for this to work. If you get an error, just run `gem install rspec`.

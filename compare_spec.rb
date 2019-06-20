require "rspec"
require_relative "array_from_file"
require_relative "compare_csv"

RSpec.describe "array from file" do
  before do
    @master_file = ArrayFromFile.new("master_list.txt")
  end
  it "contains the new line characters at end of line if read plain" do
    master_file = @master_file.read_plain

    master_file.each do |email|
      expect(email[-2..-1]).to eq "\r\n"
    end
  end

  it "removes the new line characters if format_r_n is called" do
    master_file = @master_file.format_r_n

    master_file.each do |email|
      expect(email[-4..-1]).to eq ".com"
    end
  end
end

RSpec.describe "final csv" do
  before do
    @master_file = ArrayFromFile.new("master_list.txt").format_r_n
    @new_list = CompareCSV.new("master_list.txt", ["some_file.csv", "some_other_file.csv"]).execute
  end

  it "does not include any emails from master file" do
    @new_list.map{|name_and_email| name_and_email[:email]}.each do |email|
      expect(@master_file).not_to include email
    end
  end

  it "includes first name, last name and email" do
    @new_list.each do |hash|
      expect(hash).to have_key :first_name
      expect(hash).to have_key :last_name
      expect(hash).to have_key :email
    end
  end

  it "does not include the duplicate email" do
    emails = @new_list.map{|name_and_email| name_and_email[:email]}
    expect(emails).to include "shouldshowonceinfinal@gmail.com"

    emails.delete("shouldshowonceinfinal@gmail.com")
    expect(emails).not_to include "shouldshowonceinfinal@gmail.com"
  end
end

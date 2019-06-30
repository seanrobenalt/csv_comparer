require_relative "array_from_file"

class CompareCSV

  def initialize(master_file, files)
    @master_file = master_file
    @files = files
    @new_non_duplicate_list = []
  end

  def execute
    master_file = ArrayFromFile.new(@master_file).format_r_n

    require "csv"

    @files.each do |lead_file|
      CSV.foreach(
        lead_file, {
          encoding: "UTF-8",
          headers: true,
          header_converters: :symbol,
          converters: :all
        }
      ) do |row|
        row_hash = row.to_hash
        email = row_hash[:email].to_s.downcase

        @new_non_duplicate_list << row_hash unless master_file.include? email
      end
    end

    CSV.open("new_non_duplicate_list_with_name.csv", "w") do |csv|
      csv << ["First Name", "Last Name", "Email"]
      @new_non_duplicate_list.uniq.each do |lead|
        csv << [lead[:first_name], lead[:last_name], lead[:email]]
      end
    end
    @new_non_duplicate_list
  end
end

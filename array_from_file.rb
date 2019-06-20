class ArrayFromFile

  def initialize(filename)
    @filename = filename
  end

  def read_plain
    (File.readlines @filename)
  end

  def format_r_n
    (File.readlines @filename).uniq.map{ |email|
      email.delete!("\r\n").to_s.downcase
    }
  end
end

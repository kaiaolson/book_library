class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_to_library(name, type)
    case type
    when "paper book"
      PaperBook.new(name, type)
      @books << [name, type]
    when "ebook"
      Ebook.new(name, type)
      @books << [name, type]
    when "audiobook"
      Audiobook.new(name, type)
      @books << [name, type]
    else
      puts "That's not a book format we recognize."
    end
  end

  def all
    @books.each {|item| puts "#{item[0]} (#{item[1]})" }
  end

  def search(word)
    results = []
    @books.each {|item| results << item if item[0].include?(word) }
    results.empty? ? (puts "Search returned no results...") : (results.each {|item| puts "#{item[0]} (#{item[1]})"})
  end

  def sort
    @books.sort.each {|item| puts "#{item[0]} (#{item[1]})" }
  end

end

class PaperBook < Library
  attr_accessor :name, :type
  def initialize(name, type = "paper book")
    @name, @type = name, type
  end
end

class Ebook < Library
  attr_accessor :name, :type
  def initialize(name, type = "ebook")
    @name, @type = name, type
  end
end

class Audiobook < Library
  attr_accessor :name, :type
  def initialize(name, type = "audiobook")
    @name, @type = name, type
  end
end

# ----------------------------------------------------------------------------

# class Media
# end
#
# class BookShelf < Media
#   def initialize(media_type = "bookshelf")
#     @media_type = media_type
#     @memory = []
#   end
#
#   def store(media)
#     @memory << media
#   end
# end
#
# class Computer < Media
#   def initialize(media_type = "computer")
#     @media_type = media_type
#     @memory = []
#   end
#
#   def store(media)
#     @memory << media
#   end
# end
#
# class Kindle < Media
#   def initialize(media_type = "kindle")
#     @media_type = media_type
#     @memory = []
#   end
#
#   def store(media)
#     @memory << media
#   end
# end
#
# class iPad < Media
#   def initialize(media_type = "ipad")
#     @media_type = media_type
#     @memory = []
#   end
#
#   def store(media)
#     @memory << media
#   end
# end

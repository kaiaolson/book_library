class Library
  attr_accessor :books
  attr_accessor :media

  def initialize
    @books = []
    @media = {
      bookshelf: @bookshelf_library = Array.new,
      computer: @computer_library = Array.new,
      kindle: @kindle_library = Array.new,
      ipad: @ipad_library = Array.new
    }
  end

  # To add a book to a library
  def add_book
    print "What is the name of the book you would like to add? "
    name = gets.chomp
    print "What is the type of the book you would like to add? "
    type = gets.chomp
    case type
    when "paper book"
      PaperBook.new(name, type)
      @books << [name, type]
      puts "You have added #{name}!"
    when "ebook"
      Ebook.new(name, type)
      @books << [name, type]
      puts "You have added #{name}!"
    when "audiobook"
      Audiobook.new(name, type)
      @books << [name, type]
      puts "You have added #{name}!"
    else
      puts "That's not a book format we recognize."
    end
  end

  def display
    loop do
      print "How would you like to display your books? (sorted (all), unsorted (all), by media, by type) Type back to exit. "
      display_method = gets.chomp.downcase
      case
      when display_method.include?("unsort")
        all
      when display_method.include?("sort")
        sort
      when display_method.include?("media")
        print "What media would you like to display? (Select bookshelf, computer, Kindle, or iPad) "
        media = gets.chomp.downcase
        display_by_media(media)
      when display_method.include?("type")
        print "What type would you like to display? (Select paper book, ebook, or audiobook) "
        type = gets.chomp.downcase
        display_by_type(type)
      else
        puts "I don't recognize that command."
      end
      break if display_method == "back"
    end
  end

  # Display all books (unsorted)
  def all
    @books.each {|item| puts "#{item[0]} (#{item[1]})" }
  end

  # Search for a keyword within book names
  def search(word)
    results = []
    @books.each {|item| results << item if item[0].downcase.include?(word) }
    results.empty? ? (puts "Search returned no results...") : (results.each {|item| puts "#{item[0]} (#{item[1]})"})
  end

  # Display sorted list of all books
  def sort
    @books.sort.each {|item| puts "#{item[0]} (#{item[1]})" }
  end

  # Display sorted list of books of a specified type
  def display_by_type(type)
    @books.sort.each {|item| puts "#{item[0]} (#{item[1]})" if item[1] == type}
  end

  def display_by_media(media)
    case media
    when "bookshelf"
      puts "Your bookshelf is empty!" if @bookshelf_library.empty?
      @bookshelf_library.sort.each {|item| puts "#{item[0]} (#{item[1]})"}
    when "computer"
      puts "Your computer is empty!" if @computer_library.empty?
      @computer_library.sort.each {|item| puts "#{item[0]} (#{item[1]})"}
    when "kindle"
      puts "Your Kindle is empty!" if @kindle_library.empty?
      @kindle_library.sort.each {|item| puts "#{item[0]} (#{item[1]})"}
    when "ipad"
      puts "Your iPad is empty!" if @ipad_library.empty?
      @ipad_library.sort.each {|item| puts "#{item[0]} (#{item[1]})"}
    end
  end

  # To store a book in a particular media type

  # Method to add book to a media library
  def add_to_media
    puts "What would you like to store #{@book_to_store[0]} in? "
    media_type = gets.chomp.downcase
    if (media_type.include?("computer") == false) && (media_type.include?("kindle") == false) && (media_type.include?("ipad") == false)
      puts "That's not a specified media type!"
    else
      @media.each do |key, library|
        if media_type.include? key.to_s
          library << @book_to_store
          puts "You have added #{@book_to_store[0]} to your #{key}!"
        end
      end
    end
  end

  def store(book)
    @book_to_store = []

    # To accommodate books in multiple formats
    @books.each {|item| @book_to_store << item if item[0].include?(book) }
    if @book_to_store.length > 1
      book_to_store_available_types = @book_to_store.map {|item| item[1]}
      puts "Which type of #{book} would you like to store? Available types: #{book_to_store_available_types.join(", ")}"
      book_to_store_type = gets.chomp

      @book_to_store.delete_if {|item| item[1] != book_to_store_type}
      @book_to_store.flatten!
    else
      @book_to_store.flatten!
    end

    # to add the book to a particular library
    case @book_to_store[1]
    when "paper book"
      @bookshelf_library << @book_to_store
    when "ebook"
      add_to_media
    when "audiobook"
      add_to_media
    end
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
# Might use these classes if I want to give it the capability of multiple media of the same type

class Bookshelf < Library
  def initialize(media_type = "bookshelf")
    @media_type = media_type
    super(@bookshelf_library)
  end
end

class Computer < Library
  def initialize(media_type = "computer")
    @media_type = media_type
    super(@computer_library)
  end
end

class Kindle < Library
  def initialize(media_type = "kindle")
    @media_type = media_type
    super(@kindle_library)
  end
end

class Ipad < Library
  def initialize(media_type = "ipad")
    @media_type = media_type
    super(@ipad_library)
  end
end

require "./book_library_classes.rb"

library = Library.new
# Command Line Program to run Model Book Library
loop do
  print "What would you like to do?
  add : add a book
  store : store a book in your bookshelf, computer, Kindle, or iPad
  view : display books
  search : search books by keyword
  exit : exit program
  "
  input1 = gets.chomp.downcase
  break if input1 == "exit"

  case input1
  when "add"
    library.add_book
  when "store"
    print "What is the name of the book you would like to store? "
    input2 = gets.chomp
    library.store(input2)
  when "search"
    print "What word would you like to search for? "
    input2 = gets.chomp.downcase
    library.search(input2)
  when "view"
    library.display
  else
    puts "I don't recognize that command."
  end
end

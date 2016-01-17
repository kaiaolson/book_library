require "./book_library_classes.rb"


names = ["Anna Karenina", "Iliad", "The Name of the Wind", "Murder on the Orient Express", "Another Thing to Fall"]
types = ["paper book", "ebook", "audiobook"]

library = Library.new
5.times {library.add_to_library(names.sample, types.sample)}
puts "---------------"
library.all
puts "---------------"
library.sort
puts "---------------"
library.search("Name")

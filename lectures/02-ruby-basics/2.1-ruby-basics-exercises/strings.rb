puts "hi","\n","how", "are", "you", "?", "\n"

print "hi ", "how ", "are ", "you ", "? ", "\n"

puts %q!c:\napolean's documents\tomorrow's bus schedule.txt!
puts %q/c:\napolean's documents\tomorrow's bus schedule.txt/
puts %q^c:\napolean's documents\tomorrow's bus schedule.txt^
puts %q(c:\napolean's documents\tomorrow's bus schedule.txt)
puts %q{c:\napolean's documents\tomorrow's bus schedule.txt}
puts %q<c:\napolean's documents\tomorrow's bus schedule.txt>

print %Q^Say:\tHello world\n\tHello world\n^
print %Q(Say:\tHello world\n\tHello world\n)

puts "\nhere doc, note << operator and terminator\n"
puts <<GROCERY_LIST
Grocery list
------------
1. Salad mix.
2. Strawberries.*
3. Cereal.
4. Milk.*

* Organic
GROCERY_LIST

puts "\nhere doc within puts:\n"
puts 'Grocery list', '------------', <<GROCERY_LIST, '* Organic'
1. Salad mix.
2. Strawberries.*
3. Cereal.
4. Milk.*

GROCERY_LIST

puts "\nnesting two here docs:\n"

puts 'Produce', '-------', <<PRODUCE, 'Dairy', '-----', <<DAIRY, '* Organic'
1. Strawberries*
2. Blueberries

PRODUCE
1. Yogurt
2. Milk*
3. Cottage Cheese

DAIRY

puts "\nindenting"
puts "indenting preserved within here string"
puts "do not indent terminator"

puts 'Grocery list', '------------', <<GROCERY_LIST
    1. Salad mix.
    2. Strawberries.
    3. Cereal.
    4. Milk.
GROCERY_LIST

puts "\nto indent the terminator\n"
puts 'Grocery list', '------------', <<-GROCERY_LIST
    1. Salad mix.
    2. Strawberries.
    3. Cereal.
    4. Milk.
    GROCERY_LIST
	
puts "\nquoting rules"	
puts "to use double quoting rules"
	name = 'Charlie Brown'

puts <<QUIZ
Student: #{name}

1.\tQuestion: What is 4+5?
\tAnswer: The sum of 4 and 5 is #{4+5}
QUIZ

puts <<"QUIZ"
Student: #{name}

1.\tQuestion: What is 4+5?
\tAnswer: The sum of 4 and 5 is #{4+5}
QUIZ

puts "\nto use single quoting rules:"
puts <<'BUS_SCHEDULES'
c:\napolean's documents\tomorrow's bus schedule.txt
c:\new documents\sam spade's bus schedule.txt
c:\bus schedules\the #9 bus schedule.txt
BUS_SCHEDULES
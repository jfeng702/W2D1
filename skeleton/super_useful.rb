# PHASE 2
def convert_to_int(str)
  begin
    integer = Integer(str)
  rescue ArgumentError
    puts "Enter a string"
  ensure
    integer ||= nil
  end
  integer
end

# PHASE 3

class CoffeeError < StandardError
  def error_message
    return "Yummmmm... coffee... Ok, I'm feeling forgiving..."
  end
end
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif 'coffee' == maybe_fruit
    raise CoffeeError
  else
    raise StandardError
  end

end



def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.error_message
    retry
  rescue StandardError
    puts 'Dont do dat'
  end

end

class YearsError < StandardError
  def error_message
    return 'Years is less than 5'
  end
end

class StringError < StandardError
  def error_message
    return 'Name or Favorite Pastime is empty'
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime


    if @yrs_known < 5
      raise YearsError
    end

    if name.length == 0 || fav_pastime.length == 0
      raise StringError
    end
  end



  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000
    100.times {add(Contact.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::Hacker.say_something_smart))}
  end

  def contacts
    @contacts
  end

  def add(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(id)
    @contacts.find_index { |contact| contact.id == id }
  end

  def modify_contact
    print "Enter id:"
    id = gets.chomp.to_i
    index=find(id)

    if index==nil
      puts "No contact found"
    else
      @contacts[index].to_s
      print "Is this  the correct contact? (y/n)"
      response=gets.chomp

      if response == "y" || response == "yes"
        puts "[1] Change First Name"
        puts "[2] Change Last Name"
        puts "[3] Change Email"
        puts "[4] Change Note"

        user_selected = gets.to_i

        if user_selected == 1
          puts "Enter a new value for First Name: "
          @contacts[index].first_name=gets.chomp
        elsif user_selected == 2
          puts "Enter a new value for Last Name: "
          @contacts[index].last_name=gets.chomp
        elsif user_selected == 3
          puts "Enter a new value for Email: "
          @contacts[index].email=gets.chomp
        elsif user_selected == 4
          puts "Enter a new value for Note: "
          @contacts[index].note=gets.chomp
        end

      end

    end
  end

  def display_all
    @contacts.each {|contact| contact.to_s}
  end
      
  def display_contact
    print "Enter id:"
    id = gets.chomp.to_i
    index=find(id)

    if index==nil
      puts "No contact found"
    else
      @contacts[index].to_s
    end
  end
      
  def display_attribute
    puts "Choose attribute:"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"

    user_selected = gets.to_i

    if user_selected == 1
      puts "Enter a First Name: "
      search=gets.chomp
      toprint = @contacts.select { |contact| contact.first_name == search }
      toprint.each {|contact| contact.to_s}
    elsif user_selected == 2
      puts "Enter a Last Name: "
      search=gets.chomp
      toprint = @contacts.select { |contact| contact.last_name == search }
      toprint.each {|contact| contact.to_s}
    elsif user_selected == 3
      puts "Enter an Email: "
      search=gets.chomp
      toprint = @contacts.select { |contact| contact.email == search }
      toprint.each {|contact| contact.to_s}
    elsif user_selected == 4
      puts "Enter a Note: "
      search=gets.chomp
      toprint = @contacts.select { |contact| contact.note == search }
      toprint.each {|contact| contact.to_s}
    end
  end

  def delete_contact
    print "Enter id:"
    id = gets.chomp.to_i
    index=find(id)

    if index==nil
      puts "No contact found"
    else
      @contacts.delete(@contacts[index])
    end
  end
end
class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)  
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id 
    @@id += 1
  end

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)    
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact    
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts.each {|contact| 
      puts "First Name: #{contact.first_name}"
      puts "Last Name: #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
      puts "ID: #{contact.id}"
      puts}
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each {|contact| 
      if contact.id == id
        return contact
      end
    }    
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    puts "a. First Name"
    puts "b. Last Name"
    puts "c. Email"
    puts "d. Note"
    print "Which attribute do you want to update: "
    choice = gets.chomp
    case choice
          when 'a'
            print "Enter the new first name: "
            new = gets.chomp
            @first_name = new
          when 'b'
            print "Enter the new last name: "
            new = gets.chomp
            @last_name = new
          when 'c'
            print "Enter the new email: "
            new = gets.chomp
            @email = new
          when 'd'
            print "Enter the new note: "
            new = gets.chomp
            @note = new                                
    end      
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    puts "a. First Name"
    puts "b. Last Name"
    puts "c. Email"
    puts "d. ID"
    print "Which attribute do you want to search by: "
    choice = gets.chomp
    case choice
      when 'a'
        print "Enter the first name: "
        search = gets.chomp
        @@contacts.each {|contact| if contact.first_name == search then return contact end}    
      when 'b'
        print "Enter the last name: "
        search = gets.chomp
        @@contacts.each {|contact| if contact.last_name == search then return contact end}        
      when 'c'
        print "Enter the email: "
        search = gets.chomp
        @@contacts.each {|contact| if contact.email == search then return contact end}        
      when 'd'
        print "Enter the ID: "
        search = gets.chomp.to_i
        @@contacts.each {|contact| if contact.id == search then return contact end}                                     
    end      
  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name
    puts "First Name: #{self.first_name}"
    puts "Last Name: #{self.last_name}"
    puts "Email: #{self.email}"
    puts "Note: #{self.note}"
    puts "ID: #{self.id}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete        
    @@contacts.delete(self)
  end

end


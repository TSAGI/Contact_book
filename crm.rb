require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      puts      
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    print 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit    
    end
  end

  def add_new_contact    
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp
    puts
    Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def modify_existing_contact    
    print 'Enter ID of contact: '
    id = gets.chomp.to_i
    c = Contact.find(id)
    c.full_name   
    puts "Which attribute do you want to update: "
    puts "a. First Name"
    puts "b. Last Name"
    puts "c. Email"
    puts "d. Note"
    print "Choose a letter: "
    choice = gets.chomp
    case choice
      when 'a'
        print "Enter the new first name: "
        new = gets.chomp
        c.first_name = new            
      when 'b'
        print "Enter the new last name: "
        new = gets.chomp
        c.last_name = new      
      when 'c'
        print "Enter the new email: "
        new = gets.chomp 
        c.email = new     
      when 'd'
        print "Enter the new note: "
        new = gets.chomp   
        c.note = new                                 
    end      
    c.save
    c.full_name    
  end

  def delete_contact    
    print 'Enter ID of contact: '
    id = gets.chomp.to_i
    Contact.find(id).delete    
  end

  def display_all_contacts
    Contact.all.each {|contact| contact.full_name}
  end

  def search_by_attribute    
    puts "Which attribute do you want to search by: "
    puts "a. First Name"
    puts "b. Last Name"
    puts "c. Email"
    puts "d. ID"
    print "Choose a letter: "
    choice = gets.chomp
    contact = nil
    case choice
    when 'a'
      print "Enter the first name: "
      search = gets.chomp      
      contact = Contact.find_by(first_name: search)
    when 'b'
      print "Enter the last name: "
      search = gets.chomp     
      contact = Contact.find_by(last_name: search)
    when 'c'
      print "Enter the email: "
      search = gets.chomp     
      contact = Contact.find_by(email: search)
    when 'd'
      print "Enter the ID: "
      search = gets.chomp.to_i   
      contact = Contact.find(search)   
    end  
     if contact then contact.full_name else puts "\nno such contact\n\n" end      
  end


end
a = CRM.new
a.main_menu
at_exit do
  ActiveRecord::Base.connection.close
end
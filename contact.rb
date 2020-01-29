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

  #this method is linked to the modify_existing_contact method
  #in crm.rb
  def update(choice, new)    
    case choice
          when 'a'            
            @first_name = new
          when 'b'            
            @last_name = new
          when 'c'            
            @email = new
          when 'd'            
            @note = new                                
    end      
  end

  #this method finds the contact based on the attribute selected
  #in the search_by_attribute method in crm.rb
  def self.find_by(choice, search)    
    case choice
      when 'a'        
        @@contacts.each {|contact| if contact.first_name == search then return contact end}    
      when 'b'        
        @@contacts.each {|contact| if contact.last_name == search then return contact end}        
      when 'c'        
        @@contacts.each {|contact| if contact.email == search then return contact end}        
      when 'd'        
        @@contacts.each {|contact| if contact.id == search then return contact end}                                     
    end      
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    puts
    puts "First Name: #{self.first_name}"
    puts "Last Name: #{self.last_name}"
    puts "Email: #{self.email}"
    puts "Note: #{self.note}"
    puts "ID: #{self.id}"
    puts
  end

  # This method should delete the contact  
  def delete        
    @@contacts.delete(self)
  end

end


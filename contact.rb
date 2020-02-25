gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text  

  def full_name
    puts
    puts "First Name: #{self.first_name}"
    puts "Last Name: #{self.last_name}"
    puts "Email: #{self.email}"
    puts "Note: #{self.note}"
    puts "ID: #{self.id}"
    puts
  end 

end

Contact.auto_upgrade!


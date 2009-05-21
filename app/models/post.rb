class Post < ActiveRecord::Base
  attr_accessor :password
  
  validates_inclusion_of :password, :in => ["brian_and_scott"], :message => "is invalid"
end

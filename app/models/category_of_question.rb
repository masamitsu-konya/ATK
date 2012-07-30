class CategoryOfQuestion < ActiveRecord::Base 
   image_accessor :category_image
   attr_accessible :category_name, :category_image
   acts_as_paranoid

   has_many :questions
   has_many :rankings

   validates :category_name, :presence => true, :uniqueness => {:case_sensitive => false} 
end

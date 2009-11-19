class Photo < ActiveRecord::Base
  
  has_many :comments
  
  has_attached_file :source, :styles => { :medium => "600x300", :small  => "300x100>" }

  validates_presence_of :title
  #validates_attachment_presence :source
                             
end
class Answer < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :question
  acts_as_votable
end

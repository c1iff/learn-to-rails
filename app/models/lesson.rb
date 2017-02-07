class Lesson < ApplicationRecord
  belongs_to :section

  validates :number, :presence => true, :uniqueness => true
end

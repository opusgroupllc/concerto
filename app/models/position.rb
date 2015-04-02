class Position < ActiveRecord::Base
  belongs_to :project 
  has_many :candidates
  
  LEVELS = ["Internship", "Junior", "Mid", "Senior", "Not Available"]

  validates :title, presence: true
  validates :level, inclusion: { in: LEVELS } 

end

class Project < ActiveRecord::Base
  has_many :positions
  # has_many :candidates, through: position
  
  def position_count
    Project.includes(:positions).count
  end	

  def candidate_count
    #self.joins(:positions)
  end

end

class Project < ActiveRecord::Base
  has_many :positions, dependent: :destroy
  has_many :candidates, through: :positions
  
  def position_count
    Project.includes(:positions).count
  end	

  def candidate_count
    #self.joins(:positions)
  end

end

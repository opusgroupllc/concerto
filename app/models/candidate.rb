class Candidate < ActiveRecord::Base
  STAGES = ['Initial Discovery', 'Phone Screen', 'On Site Interview', 'Archive' ]
  REFERRALS = ['From Recruiter', 'Opus Search', 'Personally Applied', 'Referred by Internal Employee']
  
  # belongs_to :stage 
  has_many :projects, through: :positions

  has_one :position
  has_many :documents

  validates :first_name, :last_name, presence: true 
  validates :referral, inclusion: { in: REFERRALS }

  def advance! # move candidate to the next stage
    current    = STAGES.index( self.stage )
    self.stage = STAGES[ current + 1 ] if current < STAGES.count - 1
    save
  end

  def archive! 
    current    = STAGES.index( self.stage )
    self.stage = STAGES.last if current != STAGES.last
    save
  end

  def flag!
   # self.stage = STAGES.last
   archive!
  end

  private 

    # def candidate_starts_in_discovery

end

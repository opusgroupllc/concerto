class CandidateJudgement < ActiveRecord::Base      
  belongs_to :user
  belongs_to :candidate
end

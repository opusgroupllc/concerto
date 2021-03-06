class Candidate < ActiveRecord::Base
  include AASM
  mount_uploader :resume, ResumeUploader

  has_many :candidate_comments
  has_many :candidate_judgements

  aasm do # default column: aasm_state
    state :pre_initial_screen, :initial => true
    state :initial_screen
    state :pre_phone_screen
    state :phone_screen
    state :pre_inperson_interview
    state :inperson_interview
    state :viable_candidate
    state :offer_rejected
    state :offer_accepted
    state :rejected

    #  Solicit Feedback
    event :release_to_initial_screen_feedback do
      transitions :from => :pre_initial_screen, :to => :initial_screen
    end

    # All feedback received, Decision Making, Reject or Pre-Phone
    event :success_initial_screen_feedback do
      transitions :from => :initial_screen, :to => :pre_phone_screen
    end

    # Select Phone Interviewers complete, Start Phone Interview
    event :release_to_phone_interview do
      transitions :from => :pre_phone_screen, :to => :phone_screen
    end

    # Phone Screen Complete, Reject or Pre-Inperson
    event :success_phone_interview do
      transitions :from => :phone_screen, :to => :pre_inperson_interview
    end

    # Select InPerson Interviewers complete, Start InPerson Interview
    event :release_to_inperson_interview do
      transitions :from => :pre_inperson_interview, :to => :inperson_interview
    end

    # InPerson Complete, Viable Candidate
    event :success_inperson_interview do
      transitions :from => :inperson_interview, :to => :viable_candidate
    end

    # InPerson Complete, Offer Accepted
    event :candiate_offer_accepted do
      transitions :from => :viable_candidate, :to => :offer_accepted
    end

    event :candiate_offer_rejected do
      transitions :from => :viable_candidate, :to => [:offer_rejected, :offer_accepted]
    end




    event :reject do
      transitions :from => [:pre_initial_screen, :initial_screen, :pre_phone_screen, :phone_screen, :pre_inperson_interview, :inperson_interview, :viable_candidate, :offer_accepted, :offer_rejected], :to => :rejected
    end
  end
end

class Candidate < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader
end

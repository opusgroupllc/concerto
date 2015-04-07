class PagesController < ApplicationController
  def dashboard
    @candidates = Candidate.all.limit(10)
    @projects   = Project.all.limit(3)
    @positions  = Position.all.limit(5)   
    
  end

  #def terms-of-use
  #end

  def contact
  end

  def documentation
  end

  def about
  end
end

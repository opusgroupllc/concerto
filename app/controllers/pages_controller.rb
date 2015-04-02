class PagesController < ApplicationController
  def dashboard
    @candidates = Candidate.all
    @positions = Position.all
    @projects = Project.all   
    
  end

  def terms-of-use
  end

  def contact
  end

  def documentation
  end

  def about
  end
end

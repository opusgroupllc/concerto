class CandidateJudgementsController < ApplicationController
  def create
  @candidate = Candidate.find(params[:candidate_id])
  @comment = @candidate.candidate_judgements.create(candidate_judgement_params)
  redirect_to candidate_path(id: @candidate.id, state: candidate_judgement_params[:state])
end

private
  def candidate_judgement_params
    params.require(:candidate_judgement).permit(:judgement, :user_id, :state)
  end
end

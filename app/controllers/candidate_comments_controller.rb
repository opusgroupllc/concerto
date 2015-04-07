class CandidateCommentsController < ApplicationController
  def create
  @candidate = Candidate.find(params[:candidate_id])
  @comment = @candidate.candidate_comments.create(candidate_comment_params)
  redirect_to candidate_path(id: @candidate.id, state: candidate_comment_params[:state])
end

private
  def candidate_comment_params
    params.require(:candidate_comment).permit(:state, :body, :user_id)
  end
end

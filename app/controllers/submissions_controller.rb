class SubmissionsController < ApplicationController
  # POST /submission
  # POST /submission.xml
  def create
    @submission = Submission.new(params[:submission])
    @challenge = Challenge.find(params[:challenge_id])
    @submission.language = Language.find(params[:language][:id])
    @submission.challenge = @challenge
    @submission.user = current_user

    respond_to do |format|
      if @submission.save
        flash[:notice] = 'Submission was successfully created.'
        format.html { redirect_to(@challenge) }
      else
        flash[:error] = 'There was an error durring submission.'
        format.html { redirect_to(@challenge) }
      end
    end
  end
end

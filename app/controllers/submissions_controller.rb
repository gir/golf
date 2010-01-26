class SubmissionsController < ApplicationController
  # GET /submission
  # GET /submission.xml
  def index
    @submission = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/1
  # GET /submission/1.xml
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/new
  # GET /submission/new.xml
  def new
    @submission = Submission.new
    @languages = Language.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/1/edit
  def edit
    @submission = Submission.find(params[:id])
    @languages = Language.all
  end

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

  # PUT /submission/1
  # PUT /submission/1.xml
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Submission was successfully updated.'
        format.html { redirect_to(@submission) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submission/1
  # DELETE /submission/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submission_url) }
      format.xml  { head :ok }
    end
  end
end

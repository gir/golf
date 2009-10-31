class SubmitionsController < ApplicationController
  # GET /submitions
  # GET /submitions.xml
  def index
    @submitions = Submition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submitions }
    end
  end

  # GET /submitions/1
  # GET /submitions/1.xml
  def show
    @submition = Submition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submition }
    end
  end

  # GET /submitions/new
  # GET /submitions/new.xml
  def new
    @submition = Submition.new
    @languages = Language.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @submition }
    end
  end

  # GET /submitions/1/edit
  def edit
    @submition = Submition.find(params[:id])
    @languages = Language.all
  end

  # POST /submitions
  # POST /submitions.xml
  def create
    @submition = Submition.new(params[:submition])
    @challenge = Challenge.find(params[:challenge_id])
    @submition.language = Language.find(params[:language][:id])
    @submition.challenge = @challenge

    respond_to do |format|
      if @submition.save
        flash[:notice] = 'Submition was successfully created.'
        format.html { redirect_to(@challenge) }
      else
        flash[:error] = 'There was an error durring submition.'
        format.html { redirect_to(@challenge) }
      end
    end
  end

  # PUT /submitions/1
  # PUT /submitions/1.xml
  def update
    @submition = Submition.find(params[:id])

    respond_to do |format|
      if @submition.update_attributes(params[:submition])
        flash[:notice] = 'Submition was successfully updated.'
        format.html { redirect_to(@submition) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submitions/1
  # DELETE /submitions/1.xml
  def destroy
    @submition = Submition.find(params[:id])
    @submition.destroy

    respond_to do |format|
      format.html { redirect_to(submitions_url) }
      format.xml  { head :ok }
    end
  end
end

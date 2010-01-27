require 'spec_helper'

describe ChallengesController do

  def mock_challenge(stubs={
    :title => "title",
    :description => "description",
    :example_output => "foo",
    :regex => "foo"
  })
    @mock_challenge ||= mock_model(Challenge, stubs)
  end

  describe "GET index" do
    it "assigns all challenges as @challenges" do
      Challenge.stub(:find).with(:all).and_return([mock_challenge])
      get :index
      assigns[:challenges].should == [mock_challenge]
    end
  end

  describe "GET show" do
    it "assigns the requested challenge as @challenge" do
      Challenge.stub(:find).with("37").and_return(mock_challenge)
      get :show, :id => "37"
      assigns[:challenge].should equal(mock_challenge)
    end
  end

  describe "GET new" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "assigns a new challenge as @challenge" do
      Challenge.stub(:new).and_return(mock_challenge)
      get :new
      assigns[:challenge].should equal(mock_challenge)
    end
  end

  describe "GET edit" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "assigns the requested challenge as @challenge" do
      Challenge.stub(:find).with("37").and_return(mock_challenge)
      get :edit, :id => "37"
      assigns[:challenge].should equal(mock_challenge)
    end
  end

  describe "POST create" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
      @challenge = mock_challenge
      @challenge.stub!(:user=).and_return(@current_user)
      @challenge.stub!(:save).and_return(true)
    end

    describe "with valid params" do
      it "assigns a newly created challenge as @challenge" do
        Challenge.stub(:new).with({'these' => 'params'}).and_return(mock_challenge(:save => true))
        post :create, :challenge => {:these => 'params'}
        assigns[:challenge].should equal(mock_challenge)
      end

      it "redirects to the created challenge" do
        Challenge.stub(:new).and_return(mock_challenge(:save => true))
        post :create, :challenge => {}
        response.should redirect_to(challenge_url(mock_challenge))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved challenge as @challenge" do
        Challenge.stub(:new).with({'these' => 'params'}).and_return(mock_challenge(:save => false))
        post :create, :challenge => {:these => 'params'}
        assigns[:challenge].should equal(mock_challenge)
      end

      it "re-renders the 'new' template" do
        Challenge.stub(:new).and_return(@challenge)
        @challenge.should_receive(:save).and_return(false)
        post :create, :challenge => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    describe "with valid params" do
      it "updates the requested challenge" do
        Challenge.should_receive(:find).with("37").and_return(mock_challenge)
        mock_challenge.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :challenge => {:these => 'params'}
      end

      it "assigns the requested challenge as @challenge" do
        Challenge.stub(:find).and_return(mock_challenge(:update_attributes => true))
        put :update, :id => "1"
        assigns[:challenge].should equal(mock_challenge)
      end

      it "redirects to the challenge" do
        Challenge.stub(:find).and_return(mock_challenge(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(challenge_url(mock_challenge))
      end
    end

    describe "with invalid params" do
      it "updates the requested challenge" do
        Challenge.should_receive(:find).with("37").and_return(mock_challenge)
        mock_challenge.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :challenge => {:these => 'params'}
      end

      it "assigns the challenge as @challenge" do
        Challenge.stub(:find).and_return(mock_challenge(:update_attributes => false))
        put :update, :id => "1"
        assigns[:challenge].should equal(mock_challenge)
      end

      it "re-renders the 'edit' template" do
        Challenge.stub(:find).and_return(mock_challenge(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "destroys the requested challenge" do
      Challenge.should_receive(:find).with("37").and_return(mock_challenge)
      mock_challenge.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the challenges list" do
      Challenge.stub(:find).and_return(mock_challenge(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(challenges_url)
    end
  end

end

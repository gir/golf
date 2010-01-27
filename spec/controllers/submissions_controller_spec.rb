require 'spec_helper'

describe SubmissionsController do

  def mock_submission(stubs={})
    @language = mock_model(Language, :id => 1, :name => 'ruby')
    @user = mock_model(User)
    @challenge = mock_model(Challenge, :id => 1)
    @mock_submission ||= mock_model(Submission, :code => "foo",
                                    :language => @language,
                                    :user => @user,
                                    :challenge => @challenge)
  end

  describe "POST create" do
    before :each do
      @submission = mock_submission
      @submission.stub!(:language=).and_return(@language)
      @submission.stub!(:challenge=).and_return(@challenge)
      @submission.stub!(:user=).and_return(@user)
      @submission.stub!(:save).and_return(true)
      Challenge.stub!(:find).and_return(@challenge)
      Language.stub!(:find).and_return(@language)
      Submission.stub(:new).and_return(@submission)
    end

    describe "with valid params" do
      it "assigns a newly created submission as @submission" do
        Submission.stub(:new).with({'these' => 'params'}).and_return(mock_submission(:save => true))
        post :create, :challenge_id => @challenge.id, :language => {:id => @language.id}
        assigns[:submission].should equal(mock_submission)
      end

      it "redirects to the associated challenge page" do
        post :create, :challenge_id => @challenge.id, :language => {:id => @language.id}
        response.should redirect_to(challenge_url(@submission.challenge))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved submission as @submission" do
        Submission.stub(:new).with({'these' => 'params'}).and_return(mock_submission(:save => false))
        post :create, :challenge_id => @challenge.id, :language => {:id => @language.id}
        assigns[:submission].should equal(mock_submission)
      end

      it "re-renders the associated challenge show" do
        Submission.stub(:new).and_return(mock_submission(:save => false))
        post :create, :challenge_id => @challenge.id, :language => {:id => @language.id}
        response.should redirect_to(challenge_url(@submission.challenge))
      end
    end

  end
end

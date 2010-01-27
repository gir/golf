require 'spec_helper'

describe LanguagesController do

  def mock_language(stubs={})
    @mock_language ||= mock_model(Language, stubs)
  end

  describe "GET index" do
    it "assigns all languages as @languages" do
      Language.stub(:find).with(:all).and_return([mock_language])
      get :index
      assigns[:languages].should == [mock_language]
    end
  end

  describe "GET show" do
    it "assigns the requested language as @language" do
      Language.stub(:find).with("37").and_return(mock_language)
      get :show, :id => "37"
      assigns[:language].should equal(mock_language)
    end
  end

  describe "GET new" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "assigns a new language as @language" do
      Language.stub(:new).and_return(mock_language)
      get :new
      assigns[:language].should equal(mock_language)
    end
  end

  describe "GET edit" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "assigns the requested language as @language" do
      Language.stub(:find).with("37").and_return(mock_language)
      get :edit, :id => "37"
      assigns[:language].should equal(mock_language)
    end
  end

  describe "POST create" do
    before :each do
      @current_user = mock_model(User, :id => 1, :roles => ["admin"],
                                 :has_role? => true)
      controller.stub!(:current_user).and_return(@current_user)
    end

    describe "with valid params" do
      it "assigns a newly created language as @language" do
        Language.stub(:new).with({'these' => 'params'}).and_return(mock_language(:save => true))
        post :create, :language => {:these => 'params'}
        assigns[:language].should equal(mock_language)
      end

      it "redirects to the created language" do
        Language.stub(:new).and_return(mock_language(:save => true))
        post :create, :language => {}
        response.should redirect_to(language_url(mock_language))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved language as @language" do
        Language.stub(:new).with({'these' => 'params'}).and_return(mock_language(:save => false))
        post :create, :language => {:these => 'params'}
        assigns[:language].should equal(mock_language)
      end

      it "re-renders the 'new' template" do
        Language.stub(:new).and_return(mock_language(:save => false))
        post :create, :language => {}
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
      it "updates the requested language" do
        Language.should_receive(:find).with("37").and_return(mock_language)
        mock_language.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :language => {:these => 'params'}
      end

      it "assigns the requested language as @language" do
        Language.stub(:find).and_return(mock_language(:update_attributes => true))
        put :update, :id => "1"
        assigns[:language].should equal(mock_language)
      end

      it "redirects to the language" do
        Language.stub(:find).and_return(mock_language(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(language_url(mock_language))
      end
    end

    describe "with invalid params" do
      it "updates the requested language" do
        Language.should_receive(:find).with("37").and_return(mock_language)
        mock_language.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :language => {:these => 'params'}
      end

      it "assigns the language as @language" do
        Language.stub(:find).and_return(mock_language(:update_attributes => false))
        put :update, :id => "1"
        assigns[:language].should equal(mock_language)
      end

      it "re-renders the 'edit' template" do
        Language.stub(:find).and_return(mock_language(:update_attributes => false))
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

    it "destroys the requested language" do
      Language.should_receive(:find).with("37").and_return(mock_language)
      mock_language.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the language list" do
      Language.stub(:find).and_return(mock_language(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(languages_url)
    end
  end

end

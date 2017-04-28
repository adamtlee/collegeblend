require 'rails_helper'

RSpec.describe SurveysController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Survey. As you add validations to Survey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all surveys as @surveys" do
      survey = Survey.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:surveys)).to eq([survey])
    end
  end

  describe "GET #show" do
    it "assigns the requested survey as @survey" do
      survey = Survey.create! valid_attributes
      get :show, params: {id: survey.to_param}, session: valid_session
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "GET #new" do
    it "assigns a new survey as @survey" do
      get :new, params: {}, session: valid_session
      expect(assigns(:survey)).to be_a_new(Survey)
    end
  end

  describe "GET #edit" do
    it "assigns the requested survey as @survey" do
      survey = Survey.create! valid_attributes
      get :edit, params: {id: survey.to_param}, session: valid_session
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Survey" do
        expect {
          post :create, params: {survey: valid_attributes}, session: valid_session
        }.to change(Survey, :count).by(1)
      end

      it "assigns a newly created survey as @survey" do
        post :create, params: {survey: valid_attributes}, session: valid_session
        expect(assigns(:survey)).to be_a(Survey)
        expect(assigns(:survey)).to be_persisted
      end

      it "redirects to the created survey" do
        post :create, params: {survey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Survey.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved survey as @survey" do
        post :create, params: {survey: invalid_attributes}, session: valid_session
        expect(assigns(:survey)).to be_a_new(Survey)
      end

      it "re-renders the 'new' template" do
        post :create, params: {survey: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested survey" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: new_attributes}, session: valid_session
        survey.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested survey as @survey" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: valid_attributes}, session: valid_session
        expect(assigns(:survey)).to eq(survey)
      end

      it "redirects to the survey" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(survey)
      end
    end

    context "with invalid params" do
      it "assigns the survey as @survey" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: invalid_attributes}, session: valid_session
        expect(assigns(:survey)).to eq(survey)
      end

      it "re-renders the 'edit' template" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested survey" do
      survey = Survey.create! valid_attributes
      expect {
        delete :destroy, params: {id: survey.to_param}, session: valid_session
      }.to change(Survey, :count).by(-1)
    end

    it "redirects to the surveys list" do
      survey = Survey.create! valid_attributes
      delete :destroy, params: {id: survey.to_param}, session: valid_session
      expect(response).to redirect_to(surveys_url)
    end
  end

end

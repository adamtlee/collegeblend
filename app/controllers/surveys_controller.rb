class SurveysController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ]
  before_filter :load_survey, :only => [:show, :edit, :update]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @surveys = Survey::Survey.all
  end

  def new
    @survey = Survey::Survey.new
    authorize User
  end

  def create
    authorize User
    @survey = Survey::Survey.new(survey_params)
    authorize User
    if @survey.valid? && @survey.save
      default_redirect
    else
      render :action => :new
    end
  end

  def edit
    authorize User
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      authorize User
      default_redirect
    else
      render :action => :edit
    end
  end

  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    rails4? ? params_whitelist : params[:survey_survey]
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end

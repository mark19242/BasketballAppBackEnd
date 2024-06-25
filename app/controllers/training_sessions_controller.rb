class TrainingSessionsController < ApplicationController
  def index
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @training_sessions = TrainingSession.where(date: date, status: 'available')
    render json: @training_sessions
  end

  def create
    @training_session = TrainingSession.new(training_session_params)
    if @training_session.save
      render json: @training_session, status: :created
    else
      render json: @training_session.errors, status: :unprocessable_entity
    end
  end

  private

  def training_session_params
    params.require(:training_session).permit(:date, :time, :status, :user_id)
  end
end

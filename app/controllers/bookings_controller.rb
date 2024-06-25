class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: params[:user_id])
    render json: @bookings, include: :training_session
  end

  def create
    @booking = Booking.new(booking_params)
    @training_session = TrainingSession.find(params[:booking][:training_session_id])
    if @training_session.status == 'available' && @booking.save
      @training_session.update(status: 'booked')
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @training_session = @booking.training_session
    if @booking.destroy
      @training_session.update(status: 'available')
      render json: { message: 'Booking cancelled successfully' }, status: :ok
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :training_session_id)
  end
end

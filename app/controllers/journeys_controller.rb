class JourneysController < ApplicationController

  #### Before action callbacks #########
  before_action :authenticate_available_customer, only: [:book]
  before_action :authenticate_unavailable_customer, only: [:complete]
  before_action :set_journey, only: [:complete]

  def book
    @journey = @customer.get_a_cab_at(booking_params.to_h.symbolize_keys)
  end

  def complete
    @journey.complete!(complete_params.to_h.symbolize_keys) unless @journey.completed?
  end

  private

  def booking_params
    params.require(:journey).permit(:x, :y, :kind)
  end

  def complete_params
    params.require(:journey).permit(:x, :y)
  end

  def set_journey
    @journey = @customer.journeys.find(params[:id])
  end

  protected

  def authenticate_available_customer
    authenticate_or_request_with_http_token('Application', 'Either customer does not exists or on journey.') do |token, options|
      @customer = Customer.available.find_by(token: token)
    end
  end

  def authenticate_unavailable_customer
    authenticate_or_request_with_http_token('Application', 'Either customer does not exists or not on journey.') do |token, options|
      @customer = Customer.unavailable.find_by(token: token)
    end
  end

end

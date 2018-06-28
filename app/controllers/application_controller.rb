# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    token = params[:token]
    puts "TOKEN"
    puts token
    payload = TokiToki.decode(token)
    puts "payload"
    puts payload
    @current_user ||= User.find_by_login(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end

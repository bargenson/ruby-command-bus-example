class ApplicationController < ActionController::API
  protected

  def command_bus
    Rails.application.config.command_bus
  end
end

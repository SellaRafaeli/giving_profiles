# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :signed_in_root_path

  def signed_in_root_path(current_user)
    home_user_path(current_user)
  end
end

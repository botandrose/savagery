require "rails"
require "savagery/helpers/rails"
require "savagery/middleware"

module Savagery
  class Engine < Rails::Engine
    initializer "savagery.helpers" do |app|
      ActionController::Base.helper Helpers::Rails
    end

    initializer "savagery.middleware" do |app|
      if Rails.env.development?
        app.config.middleware.use Middleware
      end
    end
  end
end


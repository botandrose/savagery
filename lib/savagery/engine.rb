require "rails"
require "savagery/helpers"
require "savagery/middleware"

module Savagery
  class Engine < Rails::Engine
    initializer "savagery.helpers" do |app|
      ApplicationController.helper Helpers::Rails
    end

    initializer "savagery.middleware" do |app|
      app.config.middleware.use Middleware
    end
  end
end


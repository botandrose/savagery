require "rails"
require "savagery/helpers"

module Savagery
  class Engine < Rails::Engine
    initializer "include helpers" do |app|
      ApplicationController.helper(Helpers)
    end
  end
end

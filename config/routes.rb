# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  def load_routes_folder(base_foldername)
    this_directory = File.dirname(File.expand_path(__FILE__))
    route_folder_path = File.expand_path(base_foldername, this_directory)
    Dir["#{route_folder_path}/**/*.rb"].each do |path|
      load path
    end
  end

  load_routes_folder('routes')
end

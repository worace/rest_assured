class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV["RA_ADMIN_USERNAME"], password: ENV["RA_ADMIN_PASSWORD"]
end

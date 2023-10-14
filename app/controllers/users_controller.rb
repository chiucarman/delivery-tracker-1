class UsersController < ApplicationController
  def sign_in
    render({ :template => "users/sign_in"})
  end
end

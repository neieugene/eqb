class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
  	@users = User.all
  end
end

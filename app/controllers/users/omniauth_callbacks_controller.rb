class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    unless (Client.where(:idvk => request.env["omniauth.auth"].extra.raw_info.id).exists?)
        client = Client.create(:idvk => request.env["omniauth.auth"].extra.raw_info.id, :first_name => request.env["omniauth.auth"].extra.raw_info.first_name, :last_name => request.env["omniauth.auth"].extra.raw_info.last_name, :photo => request.env["omniauth.auth"].extra.raw_info.photo_100)
        client.save
    end
    redirect_to "/clients"
  end
end

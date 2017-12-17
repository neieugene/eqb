class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    unless (Client.where(:idvk => request.env["omniauth.auth"].extra.raw_info.id).exists?)
        client = Client.create(:idvk => request.env["omniauth.auth"].extra.raw_info.id, :first_name => request.env["omniauth.auth"].extra.raw_info.first_name, :last_name => request.env["omniauth.auth"].extra.raw_info.last_name, :photo => request.env["omniauth.auth"].extra.raw_info.photo_100)
        client.save
    else
    	client = Client.where(:idvk => request.env["omniauth.auth"].extra.raw_info.id)
    end
    session[:current_client] = client
    redirect_to "/lab_queues"
  end
end

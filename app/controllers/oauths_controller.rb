class OauthsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def sign_in

    render :layout => false
  end

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to candidates_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to candidates_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

end

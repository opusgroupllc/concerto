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
    # mocklogin
    # reset_session # protect from session fixation attack
    # @user = User.find_by(email: "test@test.com")
    # if @user
    #   auto_login(@user)
    # else
    #   @user = User.create(email: "test@test.com")
    #   auto_login(@user)
    # end
    # redirect_to candidates_path, :notice => "Logged in for #{@user.email}!"
    #
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to candidates_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)

        unless @user.email.split('@').last ==   'opusgroupllc.com'
          @user.delete
          raise "Must have a @OpusGroupLLC.com domain"
        end

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to candidates_path, :notice => "Logged in from #{provider.titleize}!"
      rescue Exception => e
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}! #{e.message}"
      end
    end
  end

  def destroy
    logout
    reset_session
    redirect_to(root_path, notice: 'Logged out!')
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

end

class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  # We can think of new action as login page and destroy as logout page.
  # Need new and create actions to create a session.
  def new
    # Login Page - new.html.erb
  end

  def create
    reviewer = Reviewer.find_by(name: params[:reviewer][:name])
    password = params[:reviewer][:password]

    if reviewer && reviewer.authenticate(password)
      session[:reviewer_id] = reviewer.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      redirect_to login_path, alert: "Invaild username/password combination."
    end
  end

  # Need a destroy action to destroy a session.
  def destroy
    reset_session # Wipe out session and everything in it.
    redirect_to login_path, notice: "You have been logged out."
  end
end

class SessionsController < ApplicationController
  layout 'login'
  def new
    @session = Session.new
  end

  def create
    @session = Session.new( session_params  )
    if @session.authenticate
      session[ 'user_id' ] = @session.current_user.id
      redirect_to users_path, notice: 'Bienvenido'
    else
      render :new
    end
  end

  def delete
    session[ 'user_id' ] = nil
    redirect_to login_path
  end

  private

  def session_params
    params.require( :session ).permit( :user_name, :password )
  end
end
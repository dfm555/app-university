class Session
  include ActiveModel::Model

  attr_accessor :user_name, :password

  def authenticate
    current_user && current_user.authenticate( password )
  end

  def current_user
    User.find_by( "user_name = ? or email = ?", user_name, user_name )
  end

end

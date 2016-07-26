class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!(session[:user_id])
  end

  def self.is_admin?(session)
    User.find(session[:user_id]).role == "Admin"
  end


end

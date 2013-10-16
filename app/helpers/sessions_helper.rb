module SessionsHelper

  def sign_in(developer)
    cookies.permanent[:remember_token] = developer.remember_token
    self.current_developer = developer
  end
  def current_developer=(developer)
    @current_developer = developer
  end

  def current_developer
    @current_developer ||= Developer.find_by_remember_token(cookies[:remember_token])
  end
   def signed_in?
    !current_developer.nil?
  end

   def sign_out
    self.current_developer = nil
    cookies.delete(:remember_token)
  end
end
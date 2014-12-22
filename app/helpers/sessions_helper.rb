module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user?(user)
		user == current_user
	end

	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user and user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # 아까 들어갔던 URL 주소를 session 변수(variable)에게 전달합니다. 여기에선 이 변수의 키(key)인 :forwarding_url 에게 전달하게 됩니다.
  # 다만, GET request에 한해서 전달됩니다. 이제 막 들어가려는 URL 주소가 남아도는 걸 방지하지요. 
  # 
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end

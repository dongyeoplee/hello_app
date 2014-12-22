class User < ActiveRecord::Base

	attr_accessor :remember_token
	
	# 'self'는 현재 유저(current user)를 의미합니다. 그렇지만 User model 안에서는 'self'는 그냥 옵션이에요.
	# self.email = self.email.downcase 이라고 쓰기도 하지만, self.email = email.downcase 도 가능합니다.
	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	has_many :microposts
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }, allow_blank: true
	has_secure_password

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		# 'self'가 없으면 'remember_token'이라는 local variable을 만들어 버릴 것입니다. 이건 아니죠.
		# 하지만 'self'를 쓰면 user의 'remember_token' 속성(attribute)으로 확실하게 설정됩니다. (기억하시죠? 'before_save' callback도 'email'이 아니라 'self.email'을 사용했어요.) 
		self.remember_token = User.new_token

		# User.digest 메서드를 활용해서 업데이트합니다.
		update_attribute(:remember_digest, User.digest(remember_token))
	end

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

	def forget
		update_attribute(:remember_digest, nil)
	end
end

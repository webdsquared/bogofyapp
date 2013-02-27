class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation

  validates :name, presence: true
  validates :email, presence: true

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :tweets

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :mushrooms
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :avatar
end

class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication wardern_condition
    conditions = wardern_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR Lower(email) = value",
    { value: login.strip.downcase}]).first
  end
end

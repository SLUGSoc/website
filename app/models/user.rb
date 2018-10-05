# frozen_string_literal: true

# User model as seeded by Devise. Represents a user of the application that can
# log in using their given details.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end

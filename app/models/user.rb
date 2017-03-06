class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # TODO: Figure out how we are going to reference district/state to the user. Can the user subscribe to reports of multiple district members? What if they don't specify a district?
end

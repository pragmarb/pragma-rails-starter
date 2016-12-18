class User < ApplicationRecord
  devise(
    :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
    :confirmable
  )

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end

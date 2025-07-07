class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w[admin user], message: "%{value} n'est pas un rôle valide. Vous ne pouvez pas créer de compte." }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= "user"
  end

  def admin?
    role == "admin"
  end
end

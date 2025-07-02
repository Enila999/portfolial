class Customer < ApplicationRecord
  has_many :projects, dependent: :destroy

  def to_s
    name
  end
end

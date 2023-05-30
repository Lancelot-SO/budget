class User < ApplicationRecord
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end

class Company < ApplicationRecord
  has_many :contacts
  has_many :deals

  has_many :tasks
  has_many :activities, dependent: :nullify

  validates :name, presence: true

end

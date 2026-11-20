class Contact < ApplicationRecord
  belongs_to :company
  has_many :deals
  has_many :tasks
  has_many :activities, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end

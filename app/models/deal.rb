class Deal < ApplicationRecord
  belongs_to :company
  belongs_to :contact

  has_many :tasks
  has_many :activities, dependent: :nullify

  validates :title, presence: true
  validates :stage, presence: true

end

class Task < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :contact, optional: true
  belongs_to :deal, optional: true

  validates :title, presence: true
end

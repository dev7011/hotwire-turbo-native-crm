class Activity < ApplicationRecord

  belongs_to :company, optional: true
  belongs_to :contact, optional: true
  belongs_to :deal, optional: true

  validates :activity_type, presence: true
  validates :subject, presence: true
end

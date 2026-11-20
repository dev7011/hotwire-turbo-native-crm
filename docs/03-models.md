class Company < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :deals, dependent: :destroy
  has_many :activities, dependent: :nullify
  has_many :tasks, dependent: :nullify
  
  validates :name, presence: true
end



class Activity < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :contact, optional: true
  belongs_to :deal, optional: true
  
  validates :activity_type, presence: true
  validates :subject, presence: true
end

class Task < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :contact, optional: true
  belongs_to :deal, optional: true
  
  validates :title, presence: true
  
  scope :open, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  scope :upcoming, -> { where(due_at: Time.current..) }
end
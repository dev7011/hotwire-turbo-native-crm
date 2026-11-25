class Deal < ApplicationRecord
  STAGES = %w[
    lead
    qualified
    proposal
    negotiation
    won
    lost
  ].freeze

  belongs_to :company
  belongs_to :contact

  has_many :tasks
  has_many :activities, dependent: :nullify

  validates :title, presence: true
  validates :stage, presence: true,
            inclusion: { in: STAGES }

  validates :value, presence: true,
            numericality: { greater_than: 0 }

  scope :active, -> { where.not(stage: %w[won lost]) }

end

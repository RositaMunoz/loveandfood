# frozen_string_literal: true

# Model de la tabla Match
class Match < ApplicationRecord
  belongs_to :matcher, class_name: 'User'
  belongs_to :matched, class_name: 'User'
  has_many :appointment, dependent: :destroy
  validates_uniqueness_of :matcher_id, scope: %i[matched_id]
end

# frozen_string_literal: true

# Modelo de la tabla Appointment (citas)
class Appointment < ApplicationRecord
  belongs_to :establecimiento
  belongs_to :match
  belongs_to :user, optional: true
  validates :fecha, :hora, presence: { message: 'Debe completar el campo' }
end

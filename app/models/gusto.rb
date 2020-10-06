# frozen_string_literal: true

# Modelo de la tabla Gusto
class Gusto < ApplicationRecord
  has_and_belongs_to_many :users
  validates :nombre, presence: { message: 'Debe completar el campo' }, uniqueness: true
  validates :descripcion, presence: { message: 'Debe completar el campo' },
                          length: { maximum: 100, too_long: '%<count}>s son los
                                                             caracteres máximos' }
end

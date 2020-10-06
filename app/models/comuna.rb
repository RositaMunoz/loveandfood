# frozen_string_literal: true

# Modelo de la tabla Comuna
class Comuna < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :establecimientos, dependent: :destroy

  validates :nombre, presence: { message: 'Debe completar el campo' },
                     uniqueness: true

  def self.options_for_select
    order('LOWER(nombre)').map { |e| [e.nombre, e.id] }
  end
end

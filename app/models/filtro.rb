# frozen_string_literal: true

# Modelo de la tabla Filtro
class Filtro < ApplicationRecord
  belongs_to :user

  enum gender: %i[other male female nonbinary]
  def self.genders_for_select
    genders.keys.map { |x| [x.humanize, x] }
  end
end

# frozen_string_literal: true

# Modelo de la tabla Comentario
class Comentario < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :establecimiento, optional: true
  validates :mensaje, presence: { message: 'Debe completar el campo' },
                      length: { maximum: 500, too_long: '%<count>s son los
                                                         caracteres máximos' }

  enum rating: %i[0 1 2 3 4 5]
  def self.ratings_for_select
    ratings.keys.map { |x| [x.humanize, x] }
  end
end

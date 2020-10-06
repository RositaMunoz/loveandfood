# frozen_string_literal: true

# Modelo de la tabla Establecimiento
class Establecimiento < ApplicationRecord
  has_one_attached :images
  has_one_attached :profile_image
  belongs_to :user
  has_many :comentarios, dependent: :destroy, foreign_key: :negocio_id
  has_many :appointments, dependent: :destroy
  has_one :comuna

  validates :nombre, :tipo, :descripcion, :adress, presence: { message: 'Debe completar
                                                                         el campo' }
  validates :nombre, uniqueness: true
  validates :profile_image, file_content_type: { allow: ['image/jpeg', 'image/png'] },
                            if: -> { profile_image.attached? }
  validates :images, file_content_type: { allow: ['image/jpeg', 'image/png'] },
                     if: -> { images.attached? }
end

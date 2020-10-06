# frozen_string_literal: true

# Modelo de la tabla User
class User < ApplicationRecord
  has_one_attached :foto_perfil
  has_many :establecimientos, dependent: :destroy
  belongs_to :comuna
  has_many :comentarios, dependent: :destroy
  has_and_belongs_to_many :gustos
  has_many :appointments, dependent: :destroy
  has_many :matchered_matchs, foreign_key: 'matcher_id', class_name: 'Match',
                              dependent: :destroy
  has_many :matcheded_matchs, foreign_key: 'matched_id', class_name: 'Match',
                              dependent: :destroy
  has_many :filtro, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username

  enum gender: %i[other male female nonbinary]
  def self.genders_for_select
    genders.keys.map { |x| [x.humanize, x] }
  end

  validates :name, presence: true
  # validates :foto_perfil, file_size: { less_than: 1.megabytes }
end

class List < ApplicationRecord
  has_many :bookmarks
  has_one_attached :photo

  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, uniqueness: true, presence: true

end

# README
class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 3 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
end


class Movie < ApplicationRecord
  has many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end

class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

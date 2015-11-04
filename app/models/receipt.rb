class Receipt < ActiveRecord::Base
  belongs_to :school
  belongs_to :store

  before_validation :generate_slug, on: :create, uniqueness: true

  validates :amount, presence: true

  def to_param
    slug
  end

  private

  include Status
  include SlugGenerator
end

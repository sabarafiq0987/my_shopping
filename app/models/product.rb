# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :desc, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: /\.gif|jpg|png/i,
    message: 'must be url with gif,jpg, png.'
  }
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
        error.add(:base,'Line items present')
        throw :abort
    end
  end
end

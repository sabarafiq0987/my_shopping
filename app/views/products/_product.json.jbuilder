# frozen_string_literal: true

json.extract! product, :id, :title, :desc, :image_url, :price, :created_at, :updated_at
json.url product_url(product, format: :json)

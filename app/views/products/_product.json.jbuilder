json.extract! product, :id, :name, :description, :url, :created_at, :updated_at
json.url product_url(product, format: :json)

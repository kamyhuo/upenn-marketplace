json.extract! listing, :id, :title, :price, :state, :description, :shop_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)

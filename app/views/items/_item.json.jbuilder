json.extract! item, :id, :title, :description, :price, :category, :brand, :image_url, :socket_Type, :promo_Price, :memory_Type, :created_at, :updated_at
json.url item_url(item, format: :json)

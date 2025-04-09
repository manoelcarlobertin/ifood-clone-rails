json.extract! prato, :id, :name, :description, :price, :restaurante_id, :created_at, :updated_at
json.url prato_url(prato, format: :json)

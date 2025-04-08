json.extract! restaurante, :id, :name, :description, :delivery_tax, :city, :street, :neighborhood, :number, :complement, :category_id, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)

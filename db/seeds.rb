# db/seeds.rb
require 'faker'

Limpar as tabelas (cuidado em ambientes de produção)
puts "Limpando dados antigos..."
OrderProduct.destroy_all
Order.destroy_all
Product.destroy_all
ProductCategory.destroy_all
Restaurante.destroy_all
Category.destroy_all
User.destroy_all

puts "Criando categorias de culinária..."
# Cria algumas categorias/cuisines para os restaurantes
cuisines = %w[Italian Chinese Brazilian Mexican Japanese]
categories = cuisines.map do |cuisine|
  Category.create!(title: cuisine)
end

puts "Criando restaurantes (dados operacionais)..."
# Cria restaurantes com dados básicos de localização e descrição
9.times do
  Category_id = categories.sample.id
  Restaurante.create!(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    delivery_tax: Faker::Commerce.price(range: 2.0..10.0),
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    neighborhood: Faker::Address.community,  # ou use Faker::Address.secondary_address se preferir
    number: Faker::Address.building_number,
    complement: Faker::Address.secondary_address,
    category_id: Category_id
  )
end

puts "Criando categorias de produtos para cada restaurante..."
# Cada restaurante recebe 3 categorias de produtos
Restaurante.find_each do |restaurante|
  3.times do
    ProductCategory.create!(
      title: Faker::Food.dish,
      restaurante_id: restaurante.id
    )
  end
end

puts "Criando produtos para cada categoria de produto..."
# Cada categoria de produto recebe 5 produtos
ProductCategory.find_each do |prod_cat|
  5.times do
    Product.create!(
      name: Faker::Food.ingredient,
      description: Faker::Lorem.sentence(word_count: 8),
      price: Faker::Commerce.price(range: 5.0..50.0),
      product_category_id: prod_cat.id
    )
  end
end

puts "Criando usuários (clientes)..."
# Cria alguns usuários para os pedidos
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

puts "Criando restaurantes para autenticação (Devise)..."
# Esses registros são para o modelo de autenticação de restaurantes (caso utilize Devise)
5.times do
  Restaurante.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

puts "Criando pedidos e associando produtos..."
# Para cada usuário, cria um pedido em um restaurante (operacional) e adiciona alguns produtos
User.find_each do |user|
  # Seleciona um restaurante aleatório
  restaurante = Restaurante.order("RANDOM()").first
  order = Order.create!(
    name: user.email,
    mobile_phone: Faker::PhoneNumber.cell_phone,
    total_value: 0.0, # será calculado depois
    city: Faker::Address.city,
    neighborhood: Faker::Address.community,
    number: Faker::Address.building_number,
    complement: Faker::Address.secondary_address,
    status: 0,  # supondo que 0 seja o status inicial
    restaurante_id: restaurante.id
  )

  # Seleciona produtos disponíveis do restaurante via suas categorias
  product_categories = ProductCategory.where(restaurante_id: restaurante.id)
  products = Product.where(product_category_id: product_categories.pluck(:id))

  # Seleciona entre 1 e 3 produtos para o pedido
  selected_products = products.sample(rand(1..3))
  total = 0.0

  selected_products.each do |prod|
    quantity = rand(1..5)
    OrderProduct.create!(
      order_id: order.id,
      product_id: prod.id,
      quantity: quantity
    )
    total += prod.price * quantity
  end

  order.update(total_value: total)
end

puts "Dados populados com sucesso!"

class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # Esses passos permitem que o usuário revise o pedido feito no carrinho e o envie, transformando-o em um pedido real.

  # show: 1º Exibe o status do pedido (ex.: "Em preparação", "Enviado", etc.).
  def show
  end

  # new: 2º Mostra o resumo do pedido para confirmação.
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # create: 3º Cria o pedido no banco de dados.
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_path, status: :see_other, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params.expect(:id))
  end
  # params.expect(order: [ :name, :mobile_phone, :total_value, :city, :neighborhood, :number, :complement, :status, :restaurante_id ])

  def order_params
    params.require(:order).permit(
      :name, :mobile_phone, :restaurant_id, :city, :neighborhood, :street, :total_value,
      :number, :complement, :status, order_products_attributes: [ :quantity, :product_id ]
    )
  end
end

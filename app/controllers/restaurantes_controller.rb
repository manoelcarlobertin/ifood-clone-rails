class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: %i[ show edit update destroy ]

  # def index
  #   @restaurants = Restaurant.all
  #   filter_by_query if params[:q]
  #   filter_by_city if params[:city]
  #   filter_by_category if params[:category]
  # end

  # Estamos permitindo que o usuário filtre restaurantes por cidade, categoria e/ou por uma palavra-chave,
  # antes de aplicar a paginação.
  def index
    @restaurantes = Restaurante.all

    # Filtro por endereço (exemplo: por cidade)
    if params[:city].present?
      @restaurantes = @restaurantes.where(city: params[:city])
    end

    # Filtro por categoria
    if params[:category].present?
      @restaurantes = @restaurantes.joins(:category).where(categories: { title: params[:category] })
    end

    # Pesquisa por texto (nome ou descrição)
    if params[:query].present?
      query = "%#{params[:query]}%"
      @restaurantes = @restaurantes.where("name ILIKE ? OR description ILIKE ?", query, query)
    end
    # Exibe 3 restaurantes por página. Você pode ajustar a quantidade conforme necessário.
    @restaurantes = Restaurante.page(params[:page]).per(3)
  end

  # Estamos exibindo os * detalhes * de um restaurante específico, incluindo uma listagem dos pratos disponíveis.
  def show
    @restaurante = Restaurante.find(params[:id])
    # Supondo que o restaurante tenha muitos pratos (pratos), algo como:
    @pratos = @restaurante.pratos  # Certifique-se de ter definido o relacionamento
  end

  # GET /restaurantes/new
  def new
    @restaurante = Restaurante.new
  end

  # GET /restaurantes/1/edit
  def edit; end

  # POST /restaurantes or /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: "Restaurante was successfully created." }
        format.json { render :show, status: :created, location: @restaurante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1 or /restaurantes/1.json
  def update
    respond_to do |format|
      if @restaurante.update(restaurante_params)
        format.html { redirect_to @restaurante, notice: "Restaurante was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1 or /restaurantes/1.json
  def destroy
    @restaurante.destroy!

    respond_to do |format|
      format.html { redirect_to restaurantes_path, status: :see_other, notice: "Restaurante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurante
    @restaurante = Restaurante.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def restaurante_params
    params.expect(restaurante: [ :name, :description, :delivery_tax, :city, :street, :neighborhood, :number, :complement, :category_id ])
  end

  # def filter_by_query
  #   @restaurant = @restaurants.ransack(name_or_description_cont: params[:q]).result
  # end

  # def filter_by_city
  #   @restaurant = @restaurants.where(city: params[:city])
  # end

  # def filter_by_category
  #   @restaurant = @restaurants.select do |r|
  #     r.category.title == params[:category]
  #   end
  # end
end

class PratosController < ApplicationController
  before_action :set_prato, only: %i[ show edit update destroy ]

  # GET /pratos or /pratos.json
  def index
    @pratos = Prato.all
  end

  # GET /pratos/1 or /pratos/1.json
  def show
  end

  # GET /pratos/new
  def new
    @prato = Prato.new
  end

  # GET /pratos/1/edit
  def edit
  end

  # POST /pratos or /pratos.json
  def create
    @prato = Prato.new(prato_params)

    respond_to do |format|
      if @prato.save
        format.html { redirect_to @prato, notice: "Prato was successfully created." }
        format.json { render :show, status: :created, location: @prato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pratos/1 or /pratos/1.json
  def update
    respond_to do |format|
      if @prato.update(prato_params)
        format.html { redirect_to @prato, notice: "Prato was successfully updated." }
        format.json { render :show, status: :ok, location: @prato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pratos/1 or /pratos/1.json
  def destroy
    @prato.destroy!

    respond_to do |format|
      format.html { redirect_to pratos_path, status: :see_other, notice: "Prato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prato
      @prato = Prato.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prato_params
      params.expect(prato: [ :name, :description, :price, :restaurante_id ])
    end
end

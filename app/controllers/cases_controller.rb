# frozen_string_literal: true
class CasesController < ApplicationController
  before_action :set_case, only: [:update, :destroy]

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all

    render json: @cases
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    render json: Case.find(params[:id])
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = current_user.cases.build(case_params)

    if @case.save
      render json: @case, status: :created
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    if @case.update(case_params)
      head :no_content
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  def random
    @case = Case.get_random
    render json: @case
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy

    head :no_content
  end

  def set_case
    @case = current_user.cases.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:brand, :mockup, :medium)
  end

  private :set_case, :case_params
end

# frozen_string_literal: true
class ProjectsController < OpenReadController
  before_action :set_project, only: [:update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    render json: @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    render json: Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy

    head :no_content
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:url, :case_id)
  end

  private :set_project, :project_params
end

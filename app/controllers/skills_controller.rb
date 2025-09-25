class SkillsController < ApplicationController
  # before_action :require_user, only: [:new, :create]
  before_action :require_authentication
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :load_categories, only: [:new, :edit, :create, :update]

  def index
    @skills = Skill.includes(:category).all
    @categories = Category.all
    
    # 🔎 Search filter
    if params[:search].present?
      @skills = @skills.where("skills.name LIKE ? OR skills.description LIKE ?", 
                              "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # 📂 Category filter
    if params[:category_id].present?
      @skills = @skills.where(category_id: params[:category_id])
    end

    # ⭐ Level filter
    if params[:level].present?
      @skills = @skills.where(level: params[:level])
    end
    
    @skills = @skills.order(:name)
  end

  def show
    # @skill is set by before_action
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    
    if @skill.save
      redirect_to skills_path, notice: 'Skill was successfully created!'
    else
      render :new
    end
  end

  def edit
    # @skill is set by before_action
  end

  def update
    if @skill.update(skill_params)
      redirect_to skills_path, notice: 'Skill was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path, notice: 'Skill was deleted!'
  end

  private

  # def require_user
  #   unless current_user
  #     flash[:alert] = "You must be logged in to access this page"
  #     redirect_to root_path
  #     return
  #   end
  # end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def load_categories
    @categories = Category.all
  end  

  def skill_params
    params.require(:skill).permit(:name, :level, :description, :category_id, :image)
  end
end
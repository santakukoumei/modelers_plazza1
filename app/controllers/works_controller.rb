class WorksController < ApplicationController
  before_action :set_work, except: [:index, :new, :create]
  

  def index
    @works = Work.includes(:user)
  end

  def new
   @work = Work.new
  end

  def create
     @work = Work.new(work_params)
     if @work.save
       redirect_to root_path
     else
       render :new
     end
  end

  private

  def work_params
    params.require(:work).permit(:title, :category_id, :concept, :explanation, :image).merge(user_id: current_user.id)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end

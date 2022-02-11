class WorksController < ApplicationController
  before_action :set_work, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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

  def show
     @comment = Comment.new
     @comments = @work.comments
  end

  def edit
  end

  def update
    if @work.update(work_params)
     redirect_to work_path(@work)
    else
     render :edit
    end
  end

  def destroy
    if @work.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private

  def work_params
    params.require(:work).permit(:title, :category_id, :concept, :explanation, :image).merge(user_id: current_user.id)
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def contributor_confirmation
    unless current_user == @work.user
      redirect_to root_path 
    end
  end
end

class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @task = current_user.tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success]="タスクが正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger]="タスクが投稿されませんでした"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success]="編集が正常に完了されました"
      redirect_to @task
    else
      flash.now[:danger]="編集がされませんでした"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @task.save
    flash[:success] = "タスクが正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end

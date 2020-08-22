class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success]="タスクが正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger]="タスクが投稿されませんでした"
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.new(task_params)
    if @task.save
      flash[:success]="編集が正常に完了されました"
      redirect_to @task
    else
      flash.now[:danger]="編集がされませんでした"
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    @task.save
    flash[:success] = "タスクが正常に削除されました"
    redirect_to tasks_url
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
end

class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = Todo.all

    # Filtering
    if params[:tag]
      @todos = @todos.joins(:tags).where(tags: { name: params[:tag] })
    end

    # Custom priority sorting logic
    custom_logic = ->(todo) { todo.completed ? 0 : todo.urgency_score }
    @todos = @todos.to_a.sort_by { |todo| custom_logic.call(todo) }

    # Get all tags for filtering
    @tags = Tag.all
  end


  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      update_tags(@todo)
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      update_tags(@todo)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed, :priority)
  end


  def update_tags(todo)
    tag_names = params[:todo][:tag_list].split(",").map(&:strip).uniq
    tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }

    todo.tags = tags
  end
end

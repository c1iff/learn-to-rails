class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:id])
    render :show
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
    render :new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    puts "!!!!!!!!!!", @section.lessons.to_a
    if @lesson.save
      redirect_to section_path(@section.id)
    else
      render :new
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @section = Section.find(params[:section_id])
    @lesson.destroy
    redirect_to section_path(@section)
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to chapter_path(@section)
    else
      render :edit
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :number, :content)
  end
end

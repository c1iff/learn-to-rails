class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
    @lessons = @section.lessons
    render :show
  end

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new
    render :new
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new(section_params)
    if @section.save
      redirect_to chapter_path(@chapter.id)
    else
      puts "didn't work!!!!!!!!!!"
      render :new
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @chapter = Chapter.find(@section.chapter_id)
    @section.lessons.each do |l|
      l.destroy
    end
    @section.destroy
    redirect_to chapter_path(@chapter.id)
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to chapter_path(@section.chapter_id)
    else
      render :edit
    end
  end

  private
  def section_params
    params.require(:section).permit(:name)
  end
end

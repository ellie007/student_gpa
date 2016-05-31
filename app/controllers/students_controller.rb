class StudentsController < ApplicationController

  def index
    if params[:first_name] || params[:last_name]
      @students = Student.search(params)
    else
      @students = Student.all
    end

    @students = @students.sort_by {|student| student.last}

    respond_to do |format|
      format.html
      format.json { render json: @students }
    end
  end

  def show
    @student = Student.find_by_id(params[:id])
    @student_classes = Student.find_by_id(params[:id]).klasses.sort_by {|klass| klass.name}

    respond_to do |format|
      format.html
      format.json { render json: @student }
    end
  end

end

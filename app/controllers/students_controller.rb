class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_student, only: [ :edit, :update]
  def index
    @students = Student.all
  end
  def new
    @student =Student.new
  end
  def show
  end
  def create
    # debugger
    @student = Student.new(student_params)
    
    if @student.save
      StudentMailer.with(student: @student).welcome_email.deliver_later

      flash[:notice] = "You successfilly sign up"
      redirect_to  @student
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
       end
      
    end
  end
  def edit
  end

  def update
    if  @student.update(student_params)
      flash[:notice] = "You successfilly updated"
      redirect_to  @student
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
       end
      
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])

  end
  def require_same_student
   if current_user != @student
    flash[:notice] = "You can only edit and updated your own profile"
    redirect_to  student_path(current_user)
   end
  end
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end

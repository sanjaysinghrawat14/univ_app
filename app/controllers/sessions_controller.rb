class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]


  def new
    
  end

  def create
    

       student = Student.find_by(email: params[:session][:email])
       if student && student.authenticate(params[:session][:password])
        session[:student_id] = student.id
        flash[:notice] = "You are login successfully"
        redirect_to student
      else
        flash.now[:alert] = "There is something wrong with your login details"
        respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
        end
       end
  end



  def destroy
    session[:student_id]=nil
    flash[:notice] = "Logged out"

    redirect_to root_path
  end
end

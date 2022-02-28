class StudentCoursesController < ApplicationController

    def create
        course_to_add = Course.find(params[:course_id])

        if !(current_user.courses.include?(course_to_add))
            current_user.student_courses.create(course: course_to_add)
            flash[:notice] = "You have successfully enroll in #{course_to_add.name}"
            redirect_to current_user
        else
            flash[:notice] = "Something was wrong in your enrollment"
            redirect_to root_path
        end
    end

end
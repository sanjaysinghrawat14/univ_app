Rails.application.routes.draw do
  get 'sessions/new'
  # get 'students/new'
  root 'courses#index'
  get "courses/new", to: "courses#new", as: "new_course"
  get "about" , to: "pages#about"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  post "course_enroll", to: "student_courses#create"
  resources :students
end

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "jquery-3.6.0.js", preload: true
pin "jquery", to: "jquery-3.6.0.min.js", preload: true
# pin "materialize", to: "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js", preload: true
# pin "jquery", to: "jquery-3.6.0.min.js", preload: true


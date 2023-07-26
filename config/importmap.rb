# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.0/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "filepond", to: "https://ga.jspm.io/npm:filepond@4.30.4/dist/filepond.js"
pin_all_from 'app/javascript/custom', under: 'custom'
pin "filepond-plugin-image-preview", to: "https://ga.jspm.io/npm:filepond-plugin-image-preview@4.6.11/dist/filepond-plugin-image-preview.js"
pin "filepond-plugin-file-validate-type", to: "https://ga.jspm.io/npm:filepond-plugin-file-validate-type@1.2.8/dist/filepond-plugin-file-validate-type.js"
pin "filepond-plugin-image-crop", to: "https://ga.jspm.io/npm:filepond-plugin-image-crop@2.0.6/dist/filepond-plugin-image-crop.js"
pin "filepond-plugin-image-edit", to: "https://ga.jspm.io/npm:filepond-plugin-image-edit@1.6.3/dist/filepond-plugin-image-edit.js"
pin "filepond-plugin-file-poster", to: "https://ga.jspm.io/npm:filepond-plugin-file-poster@2.5.1/dist/filepond-plugin-file-poster.js"
pin "@pqina/pintura", to: "https://ga.jspm.io/npm:@pqina/pintura@8.60.13/pintura.js"

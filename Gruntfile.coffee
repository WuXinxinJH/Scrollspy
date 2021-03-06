module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-sass"

  grunt.initConfig
    sass:
      development:
        options:
          sourceMap: false
        files:[
          {
            expand: true
            cwd: "scroll/scss/"
            src: "*.scss"
            dest: "scroll/css/"
            ext: ".css"
          },
          {
            expand:true
            cwd: "SCSS/"
            src: "main.scss"
            dest: "dist/css"
            ext: ".css"
          }
        ]
    jade:
      development:
        options:
          pretty:true
          data:
            debug:false
        files:[
          "./index.html":"./index.jade",
          "scroll/demo.html":"scroll/demo.jade"
        ]
    shell:
      moveFont:
        command: 'cp -r SCSS/lib/ dist/'


  grunt.registerTask 'default',["jade:development","sass:development","shell:moveFont"]
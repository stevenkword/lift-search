# Lift Search
# https://github.com/voceconnect/lift-search

module.exports = (grunt) ->

  # Project configuration

  grunt.initConfig
    compass:
      options:
        config: "config.rb"
        force: true,
      development:
        options:
          environment: "development"
      production:
        options:
          environment: "production"
    jshint:
      options:
        "curly": true
        "eqeqeq": true
        "eqnull": true
        "browser": true
        "undef": true
        "unused": true
        "trailing": true
        "globals":
          "jQuery": true
          "$": true
          "Backbone": true
          "_": true
          "ajaxurl": true
      all: [
        "js/**/*.js"
        "!js/**/*.min.js"
      ]
    uglify:
      options:
        mangle: false
      prod:
        files:
          "js/admin.min.js": [
            "js/admin.js"
          ]
    imagemin:
      all:
        files: [
          expand: true,
          cwd: "img/",
          src: "**/*.{png,jpg}",
          dest: "img/"
        ]
    build:
      options:
        default: "staging"
      staging: [
        "jshint"
        "uglify"
        "compass:development"
      ]
      production: [
        "uglify"
        "compass:production"
      ]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-build'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'

  grunt.registerTask 'default', [
    'build:staging'
  ]
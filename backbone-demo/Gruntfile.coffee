module.exports = (grunt) ->

	grunt.initConfig(

		pkg: grunt.file.readJSON('package.json')

		config:
			dev:
				options:
					variables:
						# development mode
						'environment': 'dev'
			dist:
				options:
					variables:
						# production mode
						'environment': 'dist'


		## watch
		watch:
			options:
				livereload: true
				spawn: false

			bower:
				files: ['bower_components/**/*']
				tasks: ['bower_concat']

			coffee:
				files: ['src/coffee/**/*.coffee', 'src/coffee/main.coffee']
				tasks: ['coffee']

			copy:
				files: ['src/**/*.html']
				tasks: ['copy']

			gruntfile:
				files: ["Gruntfile.coffee"]


		bower_concat:
			default:
				dest: '<%= grunt.config.get("environment") %>/js/libs.js'
				dependencies:
					'backbone': 'jquery'

		coffee:
			default:
				options:
					join: true
				files:
					'<%= grunt.config.get("environment") %>/js/main.js' : ['src/coffee/**/*.coffee', 'src/coffee/main.coffee']


		connect:
			default:
				options:
					port: 8001
					base: './<%= grunt.config.get("environment") %>/'

		# dist

		clean:
			default:
				src: ['<%= grunt.config.get("environment") %>/*']



		copy:
			default:
				files:
					[
						expand: true
						cwd: 'src'
						src: 'js/**/*'
						dest: '<%= grunt.config.get("environment") %>/'
					,
						expand: true
						cwd: 'src'
						src: '**/*.html'
						dest: '<%= grunt.config.get("environment") %>/'
					]

	)

	## setup
	require('load-grunt-tasks')(grunt)

	## tasks

	grunt.registerTask('dev', [
		'config:dev'
		'clean'
		'copy'
		'bower_concat'
		'coffee'
		'connect:default'
		'watch'
	])
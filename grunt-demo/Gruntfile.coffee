module.exports = (grunt) ->

	grunt.initConfig(


		pkg: grunt.file.readJSON('package.json')

		config:
			dev:
				options:
					variables:
						# development mode
						'environment': 'dev'
						'compass-env': 'development'
						"GA_ID": "_"
						"GA_URL": "_"
						"FB_APP_ID": "_"
			dist:
				options:
					variables:
						# production mode
						'environment': 'dist'
						'compass-env': 'production'
						# insert Google Analytics ID
						"GA_ID": "_"
						"GA_URL": "_"
						# insert Facebook app id
						"FB_APP_ID": "_"

		"sftp-deploy":
			default:
				auth:
					host: 'starling.columba.uberspace.de'
					port: 22,
					authKey: 'key1'

				src: 'dist'
				dest: '/var/www/virtual/starling/html/wef/transformation-maps/'
				exclusions: ['.sass-cache']
				progress: true

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

			sass:
				files: ['src/sass/**/*.sass']
				tasks: ['compass']

			images:
				files: ['src/images/*.png,jpg,gif']
				tasks: ['copy']

			html:
				files: ['src/**/*.html']
				tasks: ['includereplace']

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

		compass:
			default:
				options:
					environment: '<%= grunt.config.get("compass-env") %>'

		connect:
			default:
				options:
					port: 8000
					base: './<%= grunt.config.get("environment") %>/'

		# dist

		clean:
			default:
				src: ['<%= grunt.config.get("environment") %>/*']

		includereplace:
			default:
				files:[
					{
						expand: true
						# process html, exclude partials starting with underscore
						src: ['*.html', '!_*']
						cwd: 'src'
						# copy to dev or dist folder
						dest: '<%= grunt.config.get("environment") %>/'
					}
				]
				options:
					globals:
						# put any constants here
						SITE_NAME: 'Site name'
						# any compile mode specific things should go here
						GA_ID: '<%= grunt.config.get("GA_ID") %>'
						GA_URL: '<%= grunt.config.get("GA_URL") %>'
						FB_APP_ID: '<%= grunt.config.get("FB_APP_ID") %>'

		copy:
			default:
				files:

					[
						expand: true
						cwd: 'src'
						src: 'assets/**/*'
						dest: '<%= grunt.config.get("environment") %>/'
					,
						expand: true
						cwd: 'src'
						src: 'js/**/*'
						dest: '<%= grunt.config.get("environment") %>/'
					]

		cssmin:
			combine:
				files:
					'<%= grunt.config.get("environment") %>/css/styles.css': ['<%= grunt.config.get("environment") %>/css/styles.css']


		uglify:
			options:
				compress:
					drop_console: true
				mangle: true
			default:
				files: [
					'<%= grunt.config.get("environment") %>/js/libs.js' : '<%= grunt.config.get("environment") %>/js/libs.js'
					'<%= grunt.config.get("environment") %>/js/main.js' : '<%= grunt.config.get("environment") %>/js/main.js'
				]


		imagemin:
			default:
				files: [
					expand: true
					cwd: '<%= grunt.config.get("environment") %>/assets/'
					src: ['**/*.{png,jpg,gif}']
					dest: '<%= grunt.config.get("environment") %>/assets/'
				]

	)

	## setup
	require('load-grunt-tasks')(grunt)

	## tasks
	grunt.registerTask('default', [
		'config:dev'
		'coffee'
		'compass'
	])

	grunt.registerTask('dev', [
		'config:dev'
		'clean'
		'copy'
		'bower_concat'
		'coffee'
		'compass'
		'includereplace'
		'connect'
		'watch'
	])

	grunt.registerTask('dist', [
		'config:dist'
		'clean'
		'copy'
		'bower_concat'
		'coffee'
		'compass'
		'includereplace'
		'uglify'
		'cssmin'
		'imagemin'
		'connect:default:keepalive'
	])

	grunt.registerTask('ftp', [
		'sftp-deploy'
	])


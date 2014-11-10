<section class="chapter" data-background="https://c3.staticflickr.com/3/2336/12963647764_4e36b1e7f7_b.jpg" id="dev-tools">
<h1 style="float: left; background: rgba(0,0,0,.6);">Development tools</h1>
<div class="credit"><a href="https://www.flickr.com/photos/gamersincepong/12963647764/in/photolist-JtQTn-gyBUH8-7gZ7jk-hU9dX1-oXDdeW-6KiPpW-i2xjA-fkcmCg-e8XyLZ-dnhqBa-dnhi18-bwZnw8-7nngQh-5Gpzf1-8YnZfz-8YEPsJ-5MpoYi-7bY6D5-kKy5Qm-AWPhK-axQdFE-axMw1r-34Ydj3-9t9Mgs-6MVmQk-dRUCR9-apw4pq-7vB3Xz-dg8q3B-3qABBc-5pgQvd-cBFPks-97W6vk-77TfQi-4R3qvW-bAYR2i-bHkaJX-jUr7wz-dyzDnx-4ohaCg-a3WRRa-4dJTMQ-4u9yjQ-5vWbSL-7ZtXWw-9JeeMM-9DeocW-aodKwL-btGHBi-S9pz3/lightbox/">Image credit</a></div>

<div class="time">14:40</div>

</section>



# Minimal web development process
## HTML
## CSS
## Javascript

## Webbrowser (testing)
Note:
In regular web development you have these three minimum building blocks: HTML for markup, i.e., the description of what's on the page. CSS for styling these elements and Javascript for interactivitiy and other stuff that you need to program. And then finally you throw it all into a webbrowser and are done with it.



# _Our_ web development process
## HTML
## Sass -> CSS
## Coffee -> Javascript
## Webbrowser (testing)

## grunt (build tool)
## bower (package management)

## github (version management)

Note:
...and our process.



<a href="http://leemart.in/hipster-stack">
<img src="assets/dev-tools/hipster_stack.jpg" class="full"></img>
</a>



# Coffeescript
<iframe src="http://coffeescript.org" class="full"></iframe>
Note:
first up, coffeescript. compiles to javascript. why use this?
read first paragraph.
scroll a bit further down, show comparison between coffee and javascript.



# Loaded topic: Google 'coffeescript opinions'
<iframe src="http://oscargodson.com/posts/why-i-dont-use-coffeescript.html" class="triple"></iframe>
<iframe src="https://github.com/raganwald-deprecated/homoiconic/blob/master/2011/12/jargon.md" class="triple"></iframe>
<iframe src="http://www.walkercoderanger.com/blog/2014/03/coffeescript-isnt-the-answer/" class="triple"></iframe>



# Javascript weirdness
<iframe src="http://wtfjs.com/2013/08/07/Math.max()-behaviour" style="background:white" class="full"></iframe>



# More Javascript weirdness
```javascript
""           ==   "0"           // false
0            ==   ""            // true
0            ==   "0"           // true
false        ==   "false"       // false
false        ==   "0"           // true
false        ==   undefined     // false
false        ==   null          // false
null         ==   undefined     // true
" \t\r\n"    ==   0             // true
```



# Coffeescript
## Only explicit global variables
```coffeescript
window.globalVar = 14
```

* '==' operator more reliable

* changing function scope without __this_
```coffeescript
() ->
	# regular, caller-scope
() =>
	# surrounding scope
```



# Coffeescript
## Classes!
```coffeescript
class Animal
	name: "Heinz"
	speed: 14
	position: 0

	constructor: (name) ->
		@name = name

	walk: () =>
		position += speed
```




# Sass
<iframe src="http://sass-lang.com" class="full"></iframe>



# Sass features
## Nesting
```sass
h1
	.big
		font-size: 24px
		&.imprtnt
			font-size: 44px
```

▼

```css
h1.big {
	font-size: 24px;
}
h1.big.imprtnt {
	font-size: 44px;
}
```



# Sass features
## Variables
```sass
$background-color: #333
$highlight-color: #fee

body
	background: $background-color

p
	color: $highlight-color
```

▼

```css
body {
	background: #333;
}
p {
	color: #fee;
}
```



# Sass features
## Mixins
```sass
=border-radius($radius)
  -webkit-border-radius: $radius
  -moz-border-radius:    $radius
  -ms-border-radius:     $radius
  border-radius:         $radius

.box
  +border-radius(10px)
```

▼

```css
.box {
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -ms-border-radius: 10px;
  border-radius: 10px;
}
```



# Chrome
<iframe src="http://www.google.com/chrome/" class="full"></iframe>
Note:
Chrome often browser of choice
great dev tools included
also: often faster than the other browsers which is nice when you want to get a good feeling about the stuff you're developing ;)



# Chrome DevTools
<iframe src="http://discover-devtools.codeschool.com" class="full"></iframe>
Note:
Paul Irish, developer advocate for Chrome, produces lots of tutorials and helpful videos.



# Chrome DevTools
<iframe src="http://developer.chrome.com/devtools/docs/videos" class="full"></iframe>
Note:
show chrome devtools
explain tabs
show mobile support



# Grunt
<iframe src="http://gruntjs.com" class="full"></iframe>
Note:
grunt: a task runner - automation for everything



#Project directory structure
##Source code is in /src
##Development version in /dev
##Distribution version in /dist
```
bower.json
/dev
/dist
Gruntfile.coffee
package.json
/src
	/assets
	/coffee
	/sass
	index.html
```



# Grunt
## package.json
```json
{
  "name": "my-project-name",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "~0.4.5",
    "grunt-contrib-jshint": "~0.10.0",
    "grunt-contrib-nodeunit": "~0.4.1",
    "grunt-contrib-uglify": "~0.5.0"
  }
}
```



# Grunt
## Gruntfile.coffee
```coffeescript
module.exports = (grunt) ->
	## project definition:
	grunt.initConfig(

		pkg: grunt.file.readJSON('package.json')
		# configure plugins:
		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			build:
				src: 'src/<%= pkg.name %>.js'
				dest: 'build/<%= pkg.name %>.min.js'
	)

	## load plugins:
	require('load-grunt-tasks')(grunt)

	## define tasks:
	grunt.registerTask('default', ['uglify'])
```



# Grunt - useful plugins
### config
```coffeescript
	grunt.initConfig(
		# ...
		# sets a configuration
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
	)
	# ...
	grunt.registerTask('dev', ['config:dev'])
```



# Grunt - useful plugins
### coffee
```coffeescript
	grunt.initConfig(
		# ...
		# compiles coffeescript
		coffee:
			default:
				options:
					join: true
				files:
					'<%= grunt.config.get("environment") %>/js/main.js' :
					['src/coffee/**/*.coffee', 'src/coffee/main.coffee']
```
Note:
most plugins working with files have that parameter structure



# Grunt - useful plugins
### sass
```coffeescript
	grunt.initConfig(
		# ...
		# compiles sass
		sass:
			default:
				files:
					'<%= grunt.config.get("environment") %>/css/styles.css' :
					['src/sass/**/*.sass']
```




# Grunt - useful plugins
### connect
```coffeescript
	grunt.initConfig(
		# ...
		# starts a webserver
		connect:
			default:
				options:
					port: 8001
					base: './<%= grunt.config.get("environment") %>/'
```



# Grunt - useful plugins
### watch
```coffeescript
	grunt.initConfig(
		# ...
		# triggers tasks on file changes
		watch:
			options:
				livereload: true
				spawn: false

			coffee:
				files: ['src/coffee/**/*.coffee']
				tasks: ['coffee']
			sass:
				files: ['src/sass/**/*.sass']
				tasks: ['sass']
```



# Grunt
```coffeescript
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
```



# Grunt - demo



# bower
<iframe src="http://bower.io" class="full"></iframe>
Note:
finally, the last piece of the stack: the package manager
so, why a package manager for the web?
for all the libraries and frameworks out there that you might want to add to your project (hear more about that later)
basics like jquery, d3.js, backbone, helpers like underscore or lo-dash or even your own libraries. managing that manually, including versions, is a pain!



# bower.json
```json
{
  "name": "OECD regional well-being",
  "version": "1.0.0",
  "homepage": "http://oecdregionalwellbeing.org",
  "authors": [
    "Moritz Stefaner <moritz@stefaner.eu>"
  ],
  "license": "None",
  "private": true,
  "ignore": [
    "**/.*",
    "node_modules",
    "bower_components",
    "test",
    "tests"
  ],
  "dependencies": {
    "underscore": "~1.6.0",
    "d3": "~3.4.1",
    "jquery": "1.9.1",
    "backbone": "~1.1.2",
    "bootstrap": "~3.1.1"
  }
}
```



# Grunt - bower_concat
```
	grunt.initConfig(
		# ...
		# concatenates libraries from bower
		bower_concat:
			default:
				dest: '<%= grunt.config.get("environment") %>/js/libs.js'
				dependencies:
					'backbone': 'jquery'
```



# bower - Demo
Note:
add new library with >bower install hammerjs --save



# git
<iframe src="http://git-scm.com" class="full"></iframe>



# git
```
> git add file
```
Stage files and directories
```shell
> git reset
```
Clean the stage
```
> git commit -m 'greatest commit evar'
```
Commit the stage

```
> git push
```
Send to remote repository
```
> git pull
```
Get latest commits from remote repository

Note:
add for staging files, reset for cleaning the stage



# Tower (OSX)
<iframe src="http://www.git-tower.com" class="full"></iframe>



# github
<iframe src="http://www.github.com" class="full"></iframe>

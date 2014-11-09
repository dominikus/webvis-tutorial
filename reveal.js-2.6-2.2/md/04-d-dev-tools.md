<section class="chapter" id="dev-tools">
<h1>Development tools</h1>

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

## githooks (web deployment)

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
<iframe src="http://oscargodson.com/posts/why-i-dont-use-coffeescript.html" height="200px"></iframe>
<iframe src="https://github.com/raganwald-deprecated/homoiconic/blob/master/2011/12/jargon.md" height="200px"></iframe>
<iframe src="http://www.walkercoderanger.com/blog/2014/03/coffeescript-isnt-the-answer/" height="200px"></iframe>



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
<iframe src="https://developer.chrome.com/devtools/docs/videos" class="full"></iframe>
Note:
show chrome devtools
explain tabs
show mobile support


# Grunt
<iframe src="http://gruntjs.com" class="full"></iframe>
Note:
grunt: a task runner - automation for everything



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
<pre><code class="coffeescript">
module.exports = (grunt) ->
	## project definition
	grunt.initConfig(

		pkg: grunt.file.readJSON('package.json')

		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			build:
				src: 'src/<%= pkg.name %>.js'
				dest: 'build/<%= pkg.name %>.min.js'
	)

	## load plugins
	require('load-grunt-tasks')(grunt)

	## tasks
	grunt.registerTask('default', ['uglify'])
</code></pre>



<section>
<h1>Grunt - useful plugins</h1>
<h3>config</h3>
<pre><code class="coffeescript">
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
</code></pre>
</section>



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



# Grunt - useful plugins

### sass
Compiles Sass
### connect
Starts a webserver
### watch
Triggers tasks on file changes
### clean
Deletes files and directories
### copy
Copies files and directories




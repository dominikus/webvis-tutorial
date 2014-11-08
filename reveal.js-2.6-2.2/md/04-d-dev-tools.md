# Development tools



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
```cofeescript
window.globalVar = 14
```

## '==' operator more reliable

## changing function scope without __this_
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


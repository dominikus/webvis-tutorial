<section class="chapter" id="performance">
	<h1>Performance</h1>
	<div class="time">17:00</div>
</section>




<section data-background="">
<h2>"The Unseen Experience: Putting Detail Into The Web" - Kevin Sweeney @ push.conference 2013</h2>
<iframe src="//player.vimeo.com/video/81767870?byline=0&amp;portrait=0" class="full" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</section>



# HTML
## Put scripts, styles etc. last!
<pre><code>
< html >
	< head >
		< script type="text/javascript" src="http ://jquery.com/jquery.js" >
		< style type="text/css" src="huge.css" >
	...
</code></pre>

▼

<pre><code>
	...
		< script type="text/javascript" src="http ://jquery.com/jquery.js" >
		< style type="text/css" src="huge.css" >
	< /body >
< /html >
</code></pre>



# HTML
<img src="http://cdn.meme.li/instances/54353870.jpg" class="full"></img>
Note:
Minify javascript files, css files, images, JSON-data ...



# Grunt: uglify
```coffeescript
		uglify:
			options:
				compress:
					drop_console: true
				mangle: true
				beautify:
					ascii_only: true
					quote_keys: true
					beautify: false
			build:
				src: 'js/main.js'
				dest: 'dist/js/main.js'

		imagemin:
			dynamic:
				files: [
					expand: true
					cwd: 'assets/img'
					src: ['**/*.{png,jpg,gif}']
					dest: 'dist/assets/img'
				]
```



<section class="large">
# Graphics technologies

<br>

<div class="fragment triple">

<h2>SVG</h2>

<ul>
<li class="pro">&#x2295;&nbsp;vector-based </li>
<li class="pro">&#x2295;&nbsp;DOM integration </li>
<li class="con">&#x2296;&nbsp;slow(er) </li>
</ul>
</div>

<div class="fragment triple">
<h2>Canvas</h2>

<ul>
<li class="pro">&#x2295;&nbsp;fast </li>
<li class="neutral">&#x2299;&nbsp;low-level </li>
<li class="con">&#x2296;&nbsp;no DOM </li>
</ul>
</div>

<div class="fragment triple">

<h2>WebGL</h2>

<ul>
<li class="pro">&#x2295;&nbsp;faster </li>
<li class="pro">&#x2295;&nbsp;3D </li>
<li class="neutral">&#x2299;&nbsp;low-level </li>
<li class="con">&#x2296;&nbsp;no DOM </li>
</ul>
</div>

Note:
Another aspect when developing for mobile is performance. Phones and tablets are just slower than your usual laptop. So it makes sense to pick the right graphics technology for your project: SVG is nice because it's vector-based (i.e., scales easily) and even has DOM integration, so you can bind event handlers to specific elements of your visualization. But, it's a bit slower than canvas and WebGL. Those two are fairly low-level, based on drawing loops (so you tell them to clean and then draw all graphical elements yourself basically) and lack the DOM-support. But they're fast! So, pick your poison.
</section>



# SVG vs Canvas
<table>
<tr><td></td><td><emph>few objects</emph></td><td><emph>many objects</emph></td></tr>
<tr><td><emph>small area</emph></td><td>SVG/Canvas</td><td>Canvas</td></tr>
<tr><td><emph>large area</emph></td><td>SVG</td><td>probably Canvas, but seriously: you're screwed</td></tr>
</table>



# OECD Better-Life Index
<iframe src="http://oecdbetterlifeindex.org"></iframe>



# Optimizing Canvas performance
* redraw only if necessary
* redraw only as little as possible
* make the canvas small
* transparency is a problem



# Optimizing animations
* use requestAnimationFrame instead of setTimeout
* precalculate as much as possible
* do precalculations: in the Better-Life index, all animation states for petals and flowers are pre-calculated before playing them back



# CSS3 animations
<iframe src="http://www.w3schools.com/css/tryit.asp?filename=trycss3_animation1" class="full"></iframe>



# More info on OECD BLI tech:
<iframe src="http://do.minik.us/blog/oecd-bli-tech" class="full"></iframe>



# Chrome DevTools - timeline
<iframe src="https://developer.chrome.com/devtools/docs/timeline" class="full"></iframe>



# Chrome DevTools - timeline
<a href="perfdemo.html" target="_blank">-> demo</a>

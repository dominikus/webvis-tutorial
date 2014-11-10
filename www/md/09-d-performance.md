# Performance

<section data-background="">
<h2>"The Unseen Experience: Putting Detail Into The Web" - Kevin Sweeney @ push.conference 2013</h2>
<iframe src="//player.vimeo.com/video/81767870?byline=0&amp;portrait=0" class="full" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</section>



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



# Chrome DevTools - timeline
<iframe src="https://developer.chrome.com/devtools/docs/timeline" class="full"></iframe>



# Chrome DevTools - timeline
## demo
<a href="perfdemo.html"></a>



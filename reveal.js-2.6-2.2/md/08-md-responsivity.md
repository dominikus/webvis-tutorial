<section data-background="" id="responsivity">
<h1>Responsivity</h1>
<iframe style="width: 800px; float: right; height: 700px;" src="http://oecdregionalwellbeing.org/region.html#DE9"></iframe>
<iframe style="width: 400px; height: 700px; float: left;" src="http://oecdregionalwellbeing.org/region.html#DE9"></iframe>
</section>



<section>
<h1>Why?</h1>
<iframe src="//www.slideshare.net/slideshow/embed_code/40841467" width="1280" height="600" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/a16z/mobile-is-eating-the-world-40841467" title="Mobile Is Eating the World" target="_blank">Mobile Is Eating the World</a> </strong> from <strong><a href="//www.slideshare.net/a16z" target="_blank">a16z</a></strong> </div>
</section>



<section>
<img class="full-height" src="assets/responsivity/go-away.jpg"></img>
Note:
... and you don't want your users ending up like that.
</section>



<section data-background="assets/responsivity/email_link.png">
# Email fallback
Note:
If you know that your vis isn't perfect on mobile but you don't have time to do it right: let your users email themselves a link!
</section>



<section data-background="assets/responsivity/differences.png">
# Desktop vs Mobile
<h2>Touch</h2>
<h2>Screen size/format</h2>
<p class="attribution">
<a href="http://thenounproject.com/term/mouse/890/">Mouse designed by Camila Bertoco from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/hand/5591/">Hand designed by Naomi Atkinson from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/smartphone/1023/">Smartphone designed by George Agpoon from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/computer/2721/">Computer designed by Edward Boatman from the Noun Project</a>
</p>

Note:
The two main differences between desktop and mobile websites are, (1) interaction happens via touch instead of a mouse, with the regrettable loss of hovering. and (2) the different and varying screen sizes and formats. Desktops/laptops are usually relatively low-res, 16:10 displays in landscape, while mobile devices have high-resolution, portrait screens. This changes information layout and density.
</section>



<img src="assets/responsivity/nyt1_age_political.png" class="triple"></img>
<img src="assets/responsivity/nyt2_ferguson.png" class="triple"></img>
<img src="assets/responsivity/nyt3_rent.png" class="triple"></img>

Note:
Nevertheless, this doesn't prevent creating great interactive visualizations for these devices. Here are several examples from the New York Times that does a tremendous job in building web-based, responsive visualizations. But there are Other teams to look out for, such as the Washington Post, Zeit Online or the Guardian.



<section data-background="">

<iframe class="full" src="http://mobilev.is"></iframe>

Note:
If you're interested in more examples of mobile datavis, check out these two websites: MobileVis by Bocoup is one of these collections...
</section>



<section data-background="">
<iframe class="full" src="http://mobileinfovis.com"></iframe>

Note:
.. another one is Mobile Infovis by Sebastian Sadowski (you see the pattern?). Both, great collections, wonderful inspirations and ever-growing.
</section>


<!-- <section data-background="" class="large"> -->
<!-- ^ doesn't work with the markdown -->
# mouse -> touch
```javascript
mousedown
mousemove
mouseup
```
<p></p>
```
$("element").on(
   "mousedown",
   foo_func
);
```
Note:
So, when it comes to implementation, what's the main difference between desktop and touch?
Internally, events change from "mouse something" to slightly different "touch something" events. So, if your event handler reads "on mousedown" etc. you have to change it...



# mouse -> touch
```
touchstart
touchmove
touchend
```
<p></p>
```
$("element").on(
   "touchstart",
   foo_func_touch
);
```
Note:
... but the touch versions are pretty similar. But of course, if you don't change it, it won't do much on mobile devices. If you're using d3: most d3.js functions do that automatically, handling even multi-touch, which is nice.



# mouse, touch -> pointer?
<iframe style="width: 75%; float: right; height: 700px;" src="http://caniuse.com/#feat=pointer"></iframe>
<img src="http://www.w3.org/TR/pointerevents/pointer.png"></img>

Note:
might change soon into device-agnostic 'pointer'-events, but so far only supported in internet explorer...



# screen size?
<img class="triple" src="assets/responsivity/tiny_block.png"></img>
<img class="triple" src="assets/responsivity/tiny_block2.png"></img>
<img class="triple" src="assets/responsivity/tiny_block3.png"></img>


Note:
What's not so nice is scaling: d3.js leaves all scaling issues to the developer, which means that your visualization becomes tiny on a small screen.



<section data-background="">
<h1>Bootstrap</h1>
<iframe class="full" src="http://getbootstrap.com"></iframe>
</section>



<section data-background="">
<h1>Bootstrap grid</h1>
<iframe class="full" src="http://getbootstrap.com/examples/grid/"></iframe>
</section>



<section data-background="">
<h1>Bootstrap grid</h1>
<iframe class="full" src="http://getbootstrap.com/css/#grid"></iframe>
</section>



<section data-background="assets/responsivity/oecd-rwb-boxes2.png">

Note:
We've used bootstrap for the layout and as you can see here, every on-screen element is kept inside its own little box. Depending on whether we have a desktop, tablet or smartphone, the layout changes and most elements become bigger, especially on smartphones (to make them easier to hit with your finger).
</section>



<section class="large">

# Media queries
```css
@media (max-width: 600px) {
  .facet_sidebar {
    display: none;
  }
}
```
</pre>

Note:
TODO: media queries
</section>




<section class="chapter">
<h1>Responsive Web Design - Details</h1>
</section>



<section class="large">
<h1>Debounce when redrawing</h1>
```javascript
var resizeVis = _.debounce(
  app.views.mainView.render,
  RESIZE_REFRESH_RATE
);

$(window).on("resize", resizeVis)
```
```

debounce
call: .. .  .   ... ... .. ......    ...
exec:                                   (break)*

throttle
call: .. .  .   ... ... .. ......    ...
exec: (break)*(break)*(break)*(break)*(break)*

```

Note:
Here's a couple of details that are very useful when creating responsive visualizations. First, drawing a visualization is usually quite intense and you don't wanna kill your browser tab just because you decide to redraw the whole thing every time the user changes the screen size. That's when something like 'debounce' or 'throttle' comes in really handy. I usually use the underscore version, but there are other implementations available. 'Debounce' is pretty cool: you throw in a function (render in our case) and it makes sure that the function is only executed if a certain time has passed since its last execution. Which means that in this example here, render is called at most every RESIZE_REFRESH_RATE milliseconds.
You can see that effect on oecdregionalwellbeing.org, too. If you resize the window it takes a short moment for all the flower visualizations to redraw.
</section>



<section class="large">
## meta viewports
```
<html>
<head>
   <meta name="viewport"
      content="width=device-width,
                  initial-scale=1"
```
```
              ..."user-scalable=no"
```

Note:
How the website is scaled initially especially on mobile browsers depends on your viewport-settings in the corresponding meta-tag. Usually you wanna have width equals device-width (that means the width of the page fully fills the device's width) and your initial scale being 1 (that means that the webpage isn't zoomed in or out initially). Sometimes it might even be useful to prevent people from being able to zoom the website altogether. Then you have to set "user-scalable" to "no".
</section>



<section class="large">
## disable scrolling
```javascript
document.ontouchstart =
	function(e) {
		e.preventDefault();
	}
```
Note:
If your visualization is "fullscreen" on the mobile device, you probably want to disable the scrolling effects on touch devices, so they don't collide with your vis interaction.
</section>



<section class="large">
## SVG viewports and viewboxes
```
svg {
   viewBox: 0 0 380 200;
   preserveAspectRatio: xMidYMin meet;
}
```

<svg width="1280" height="512" style="viewBox:0 0 666 400; margin-top: 20px;">

<g class="fragment">
   <rect x="25" y="5" width="420" height="240" style="stroke-width:2px;stroke:white;fill:none">
   </rect>
   <rect x="45" y="25" width="380" height="200" style="stroke-width:20px;stroke:#f05f00;fill:white">
   </rect>
</g>

<g class="fragment">
   <rect x="525" y="5" width="733" height="240" style="stroke-width:2px;stroke:white;fill:none">
   </rect>
   <rect x="701" y="25" width="380" height="200" style="stroke-width:20px;stroke:#f05f00;fill:white">
   </rect>
</g>

</svg>

Note:
One last detail is about using the browser's internal scaling capabilities for your responsive visualization. Most d3 visualizations are drawn in an SVG (scalable vector graphics) element, which is nice, because, well, it's a vector drawing, so it's easy to scale. You can tell the browser independent from the actual width and height of the SVG element, its viewport, what dimensions its internal coordinate system is supposed to have. That happens in the "viewBox" style: We define an internal coordinate system from 0,0 to 500,250. (->slide)
In this case, the SVG element fits the window perfectly, but what happens when the window becomes larger or smaller? That's what the second style, "preserveAspectRatio" is for. The second parameter, "meet" in our case, defines that the SVG's viewBox should show everything without cutting anything off. The first parameter defines how the viewBox is aligned with regard to its surroundings. So when we say "xMidYMin", that means that the horizontal center of the viewBox becomes aligned with the horizontal center of the viewport and the vertical minima become aligned as well. (-> slide)
So if the viewport is much wider than the viewbox, the viewbox is horizontally centered - a rare sight in web development and its gives you responsiveness for free.
</section>




<section data-background="assets/responsivity/phone_hand.png" class="light">
# Mobile first

Note:
But let's dive into more details about mobile datavis. What happens when you actually do 'mobile first' design and start from a mobile device instead of the desktop? This opens up all kinds of new possibilities.
</section>



<section data-background="assets/responsivity/fountain_texting2.gif">
# Data first

Note:
First, this is your user! They're in the middle of something and they're not in the mood for any fancy UI shenanigans. They want the data as quickly as possible. So, think about what people want from your visualization and design for that.
The interaction context is central here and, fortunately, we can even get parts of that from the new HTML5 APIs.
</section>



<section class="large">
# Geolocation
```javascript
navigator.geolocation.getCurrentPosition(
   function(position){
      console.log(
         position.coords.latitude +
         "," + position.coords.longitude
      );
   }
);
```

Note:
One of those is the geolocation framework that returns the user's current position. And, as you can see, it's really trivial: just call the getCurrentPosition method, give it a callback, and you're all set.
</section>


<h2 class="bottom">OECD Regional Well-Being</h2>
<h3 class="bottom">http://oecdregionalwellbeing.org</h3>
<img class="triple" src="assets/responsivity/oecd-rwb-geo1.png"></img>
<img class="triple" src="assets/responsivity/oecd-rwb-geo2.png"></img>
<img class="triple" src="assets/responsivity/oecd-rwb-geo3.png"></img>

Note:
We used the geolocation API for regional well-being. When you open up the website for the first time, the browser asks you for your location. The visualization then starts with your current region selected which makes for a great entry point. You don't have to find it in a list or anything, it's just there.



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



<section data-background="assets/responsivity/tap_size_apple.png">
<h1>Interaction</h1>
<h2>Fat fingers</h2>

<h2 class="attribution">"https://developer.apple.com/library/ios/documentation/userexperience/conceptual/mobilehig/LayoutandAppearance.html"</h2>

<aside class="notes">
The main difficulty with designing mobile visualizations is the interaction-part. You no longer have a nice, minimal cursor with fine grained controls but only fat fingers that overlap your screen. Here's just one example from Apple's guidelines, but all smartphone companies recommend a certain minimum size for interactive on-screen elements.
</aside>
</section>



<section data-background="">
<iframe class="full" src="http://selfiecity.net/selfiexploratory"></iframe>

Note:
Sometimes interactive elements work just the way they should. In the selfieexploratory, for example, elements are always big enough (or put it another way: interaction can be fuzzy enough), so we didn't need any adjustments.
</section>



# Interaction hacks

Note:
But what to do if it's not that easy? One thing we're often using is creating invisible elements for interaction.



<section data-background="assets/responsivity/scatterplot_touch.png">
# Interaction hacks
## Invisible touch areas
```
opacity: 0;
z-index: 99999;
```

Note:
One weird trick is creating invisible touch-enabled areas. Basically, set "opacity" to 0, so they're no longer visible but still interactive (just add a "touch"-event listener). Then, make sure that they're right on top your small but interactive element and do the right thing when the touch event lands.
</section>



<section data-background="assets/responsivity/linechart_touch.png">
# Interaction hacks
## Invisible touch areas II
```
opacity: 0;
z-index: 99999;
```

Note:
Usually, you would use circular elements for certain parts of the graph. But it can also be useful to use different shapes: In this example you could map rectangles over the chart, so it no longer matters what part of the chart is touched.
</section>



# Tooltips
![](assets/responsivity/tooltips1.png)

Note:
Which brings us to the main problem of data vis on mobile devices: Hovering and tooltips! When you focus on it you notice how omnipresent the tooltip is for visualizations - it's the go-to solution for showing details-on-demand. This becomes harder on mobile as we don't have hovering. Mobile Safari emulates this behavior on a regular website (i.e., one with mouse events) by having the first touch becoming a "mouseover" and the next on the same element a "mousedown".



<section data-background="assets/responsivity/always_tooltip.png">
# Tooltips
## Always-on
```
position: fixed;
```

Note:
One better solution is to just show the tooltip always. Hook it up to the relevant on-screen element (here, the little arrow) and change it accordingly. Or pick a suitable part of the layout and put it there, maybe just with position:fixed on-top of everything at the bottom.
</section>



<section data-background="assets/responsivity/oecd_tooltips.png">
# Tooltips
## Tap for details, tap tooltip for select
Note:
A pattern that you often have in infovis is hovering for details and clicking for selection. This, of course, breaks on mobile, as there is no hover. Something that we've used for OECD Regional Well-Being is tapping for details and tapping on the tooltip for selection. Tapping somewhere on the background hides the tooltip again. Note also, that the tooltips always appears horizontally centered. Doesn't make much sense to change the placement on such a narrow screen.
</section>



<section data-background="assets/responsivity/d3_multitouch.png" class="light">
# Multi-touch/Gestural interactions

Note:
What's cool is, you can also do multi-touch or gestural interactions on mobile. You basically keep track of all the "touchstarts" on an element and then decide what to do about it. But frameworks can help you. d3.js comes with a couple of parts that handle multi-touch automatically (in this case, the d3.behavior.zoom and d3.behavior.drag).
</section>



<section data-background="assets/responsivity/quo_multitouch.png">
<h2 class="bottom">QuoJS</h2>
<h3 class="bottom">http://quojs.tapquo.com/</h3>
Note:
And when you want to be more fancy about it, you can use a dedicated interaction library like QuoJS or hammer.js, that even detect gestures. So now you can handle pinch and rotate, swipe, long presses and so on. Really cool.
</section>



# HTML5 motion/orientation detection
```
window.addEventListener(
   "deviceorientation",
   function(orientation){
      console.log(orientation.alpha +
      "," + orientation.beta +
      "," + orientation.gamma
      );
   },
   true
);
```

Note:
Apart from touches, you can get even more sensor data, e.g., from the orientation and motion sensors that are built into the smartphone. And it's just as simple as the geolocation API: this code here listens for changes in the orientation of the smartphone and plots it out. Orientation comes with three values, alpha, beta and gamma for the three axes.



<a href="bluemarble.html">-> Demo</a>
<iframe class="full" src="bluemarble.html" style="background: white; width: 320px"></iframe>
Note:
Here's a demo that uses this API. It lets you rotate a little globe based on the movements of your device. Give it a try. And while 3D is somewhat of a four-letter-word in visualization, this device orientation stuff might actually help with it...



<iframe id="ytplayer" type="text/html" width="1280" height="800"
  src="http://www.youtube.com/embed/tZ1EJoY8HCk"
  frameborder="0"/>

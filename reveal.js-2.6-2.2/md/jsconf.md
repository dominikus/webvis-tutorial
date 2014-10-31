<section data-background="assets/Minard.png">
      <aside class="notes">
   So, let's start. I guess most of you know data visualizations or have seen them. The basic idea is to turn complex data sets into visual representations. If they're done right, you can easily spot patterns and understand the underlying data.
   This one's a pretty famous (and old) one, depicting Napoleon's march to Moscow. You can see the course of the army, its (shrinking) size and even the temperature down at the bottom. So, lots and lots of information in an easily digestible (and even beautiful!) graphic.
      </aside>
</section>



<section data-background="assets/iphone_small_multiples.png">
<h1><i>Mobile</i> data vis?</h1>

<aside class="notes">
   Which makes it the perfect tool for portable devices! Think of all the data that you're producing and have to do something with while on-the-go. Visualization spares you from working with the raw numbers and gives you a quick overview to find what's important.

And with displays becoming even smaller, visualization becomes even more relevant. It can show you what's relevant or interesting to you without forcing you through long rows of numbers. So, how do we go about building those things?
</aside>
</section>



<section data-background="assets/smartphones.png">
<h1>Welcome to the zoo</h1>

Note:
As you all know, while they might all look the same, there's various mobile platforms available. While Apple started the whole thing, by now you also have to support Android, maybe Windows Phone, and even more exotic flavors such as Black Berry or Bada. And developing for multiple of those is a pain - everything's different, porting code is a mess, etc.
</section>



<!--# The web to the rescue-->
<img src="assets/nyt1_age_political.png"></img>
<img src="assets/nyt2_ferguson.png"></img>
<img src="assets/nyt3_rent.png"></img>

Note:
So thank god there's web development. The mobile web has come so far in the last years, that it's actually viable to develop full-blown applications for mobile devices no less just using web technologies. Especially news organizations were very keen to get their interactives to mobile platforms and have and continue to create great examples. Here's two from the New York Times who are, arguably, one of the best data journalism teams out there.



# Today:
<h2 class="fragment">Responsive datavis</h2>
<h2 class="fragment">Mobile first</h2>
<h2 class="fragment">Solving interaction</h2>

Note:
So today I'll try to give you a quick crash course in developing data visualizations for mobile devices using the web (and in 20 minutes no less). First, a quick overview, then I'll talk a little bit longer about Responsive Web-Design which already solves a lot of the issues of mobile data visualizations. However, having a "mobile first" approach to design lets you focus on the strengths of the mobile device, doing much more interesting stuff. Interaction is also a big issue on those tiny displays and I'll discuss the problems and chances when it comes to interaction with datavis.



<section data-background="assets/mobilevis.png">
<h2 class="bottom">[http://mobilev.is/](http://mobilev.is/)</h2>

Note:
If you're interested in more examples of mobile datavis, check out these two websites: MobileVis by Bocoup is one of these collections...
</section>



<section data-background="assets/mobileinfovis.png">
<h2 class="bottom">[http://mobileinfovis.com/](http://mobileinfovis.com/)</h2>

Note:
.. another one is Mobile Infovis by Sebastian Sadowski (you see the pattern?). Both, great collections, wonderful inspirations and ever-growing.
</section>



# Desktop vs Mobile
<div class="fragment">
<h2>Touch</h2>
<img class="minimal" style="height: 300px; margin-right: 300px;" src="assets/mouse.svg"></img>
<img class="minimal" style="height: 300px;" src="assets/hand.svg"></img>
</div>

<div class="fragment">
<h2>Screen size/format</h2>
<img class="minimal" style="height: 300px; margin-right: 100px;" src="assets/screen.svg"></img>
<img class="minimal" style="height: 300px;" src="assets/phone.svg"></img>
</div>

<div class="fragment">
<p class="attribution">
<a href="http://thenounproject.com/term/mouse/890/">Mouse designed by Camila Bertoco from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/hand/5591/">Hand designed by Naomi Atkinson from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/smartphone/1023/">Smartphone designed by George Agpoon from the Noun Project</a>,&nbsp;
<a href="http://thenounproject.com/term/computer/2721/">Computer designed by Edward Boatman from the Noun Project</a>
</p>
</div>

Note:
The two main differences between desktop and mobile websites are, (1) interaction happens via touch instead of a mouse, with the regrettable loss of hovering. We'll talk about that in more detail a little later. and (2) the different and varying screen sizes and formats. Desktops/laptops are usually relatively low-res, 16:10 displays in landscape, while mobile devices have high-resolution, portrait screens. This changes information layout and density. and



<!--# d3.js-->
<section data-background="assets/d3logo.png">
<h2 class="bottom">[http://d3js.org](http://d3js.org)</h2>

Note:
One of the most common libraries for doing web-based data visualization is d3.js which stands for data-driven documents (ask audience: who here has heard of d3? used d3? wow, nice). I can only recommend it! It's being developed mostly by Mike Bostock, who is working at the New York Times (remember, the guys from before), which gives them something of an unfair advantage but oh well.
</section>



<section data-background="assets/blocks_mbostock.png">
<h2 class="bottom">[http://bl.ocks.org](http://bl.ocks.org)</h2>

Note:
Reasons for the popularity of d3.js are its (very) active and on-going development, the large community and especially the wealth of examples out there that you can pick apart for your own projects. So on bl.ocks.org, for example, you can find hundreds and hundreds of examples. And what's really cool is: They usually also work on mobile devices!
</section>



# mouse -> touch
```javascript
mousedown
mousemove
mouseup
```
```
$("element").on(
   "mousedown",
   foo_func
);
```
Note:
Well, at least they get the 'Touch'-part right. Internally, events change from "mouse something" to slightly different "touch something" events. So, if your event handler reads "on mousedown" etc. you have to change it...



# mouse -> touch
```
touchstart
touchmove
touchend
```
```
$("element").on(
   "touchstart",
   foo_func_touch
);
```
Note:
... but the touch versions are pretty similar. But of course, if you don't change it, it won't do much on mobile devices. Most d3.js functions do that automatically, handling even multi-touch, which is nice.



# screen size?
![](assets/tiny_block.png)
![](assets/tiny_block2.png)
![](assets/tiny_block3.png)

Note:
What's not so nice is scaling: d3.js leaves all scaling issues to the developer, which means that your visualization becomes tiny on a small screen.



# Responsive web vis
Note:
So, what do you do when your website needs to work across devices? Right, responsive web design. And we can apply the same principles to visualizations, naturally.



# RWD frameworks
<img src="assets/rwd_framework1.png" width="45%"/>
<img src="assets/rwd_framework2.png" width="45%"/>

Note:
To save you a lot of work, it's usually easiest to just use a responsive framework such as bootstrap or foundation and treat your charts and graphs as one of your grid elements.



# RWD grids
<img src="assets/grid1.png" width="50%"/>
<img src="assets/grid2.png" width="30%"/>
<img src="assets/grid3.png" width="10%"/>

Note:
You define a certain width for your visualization and it just becomes another box that is automatically re-aligned when the screen size changes. Very useful.



<section data-background="assets/oecd-rwb-back.png">
<h2 class="bottom">OECD Regional Well-Being</h2>
<h3 class="bottom"><a href="http://oecdregionalwellbeing.org" target="_blank">http://oecdregionalwellbeing.org</a></h3>

<p class="bottom">
With <a href="http://stefaner.eu">Moritz Stefaner</a>.
</p>

Note:
Here's one recent example from my own work that I did together with my collaborator Moritz Stefaner. OECD Regional Well-Being is a project that shows results from the OECD's study on well-being across a couple of hundred regions world-wide. The idea is that you start with your own home region, explore 8 dimensions such as safety, job market and education from there and navigate across other regions. At the top, you see a map and a visualization of the current region's values. Underneath it is a list of 4 similar regions. Below that, there are 8 detail visualizations with three little charts each, for each of the dimensions.
One of the requirements for the project was to have the whole page work across devices and as we didn't have the resources to develop for each form factor separately, it ended up being responsive.
</section>




<section data-background="assets/oecd-rwb-boxes2.png">
<h2 class="bottom">OECD Regional Well-Being</h2>
<h3 class="bottom">http://oecdregionalwellbeing.org</h3>

<p class="bottom">
With <a href="http://stefaner.eu">Moritz Stefaner</a>.
</p>

Note:
We've used bootstrap for the layout and as you can see here, every on-screen element is kept inside its own little box. Depending on whether we have a desktop, tablet or smartphone, the layout changes and most elements become bigger, especially on smartphones (to make them easier to hit with your finger).

TODO: Highlight desktop, tablet, phone
</section>



# RWD details
## Debounce when redrawing
```
   var resizeVis = _.debounce(
      app.views.mainView.render,
      RESIZE_REFRESH_RATE
   );

   $(window).on("resize", resizeVis)
```

Note:
Here's a couple of details that are very useful when creating responsive visualizations. First, drawing a visualization is usually quite intense and you don't wanna kill your browser tab just because you decide to redraw the whole thing every time the user changes the screen size. That's when something like 'debounce' or 'throttle' comes in really handy. I usually use the underscore version, but there are other implementations available. 'Debounce' is pretty cool: you throw in a function (render in our case) and it makes sure that the function is only executed if a certain time has passed since its last execution. Which means that in this example here, render is called at most every RESIZE_REFRESH_RATE milliseconds.
You can see that effect on oecdregionalwellbeing.org, too. If you resize the window it takes a short moment for all the flower visualizations to redraw.



# RWD details
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



# RWD details
## SVG viewports and viewboxes
```
svg {
   viewBox: 0 0 500 250;
   preserveAspectRatio: xMidYMin meet;
}
```
<svg width="1920" height="768" style="background:white;viewBox:0 0 1000 400;">

<g class="fragment">
   <rect x="25" y="5" width="630" height="360" style="stroke-width:5px;stroke:black;fill:none">
   </rect>
   <rect x="40" y="20" width="600" height="330" style="stroke-width:20px;stroke:#f05f00;fill:white">
   </rect>
</g>

<g class="fragment">
   <rect x="725" y="5" width="1100" height="360" style="stroke-width:5px;stroke:black;fill:none">
   </rect>
   <rect x="980" y="20" width="600" height="330" style="stroke-width:20px;stroke:#f05f00;fill:white">
   </rect>
</g>

</svg>

Note:
One last detail is about using the browser's internal scaling capabilities for your responsive visualization. Most d3 visualizations are drawn in an SVG (scalable vector graphics) element, which is nice, because, well, it's a vector drawing, so it's easy to scale. You can tell the browser independent from the actual width and height of the SVG element, its viewport, what dimensions its internal coordinate system is supposed to have. That happens in the "viewBox" style: We define an internal coordinate system from 0,0 to 500,250. (->slide)
In this case, the SVG element fits the window perfectly, but what happens when the window becomes larger or smaller? That's what the second style, "preserveAspectRatio" is for. The second parameter, "meet" in our case, defines that the SVG's viewBox should show everything without cutting anything off. The first parameter defines how the viewBox is aligned with regard to its surroundings. So when we say "xMidYMin", that means that the horizontal center of the viewBox becomes aligned with the horizontal center of the viewport and the vertical minima become aligned as well. (-> slide)
So if the viewport is much wider than the viewbox, the viewbox is horizontally centered - a rare sight in web development and its gives you responsiveness for free.



<section data-background="assets/phone_hand.png">
# Mobile first

Note:
But let's dive into more details about mobile datavis. What happens when you actually do 'mobile first' design and start from a mobile device instead of the desktop? This opens up all kinds of new possibilities.
</section>



<section data-background="assets/fountain_texting.gif">
# Data first

Note:
First, this is your user! They're in the middle of something and they're not in the mood for any fancy UI shenanigans. They want the data as quickly as possible. So, think about what people want from your visualization and design for that.
The interaction context is central here and, fortunately, we can even get parts of that from the new HTML5 APIs.
</section>



# Geolocation
```
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



<h2 class="bottom">OECD Regional Well-Being</h2>
<h3 class="bottom">http://oecdregionalwellbeing.org</h3>
![](assets/oecd-rwb-geo1.png)
![](assets/oecd-rwb-geo2.png)
![](assets/oecd-rwb-geo3.png)

Note:
We used the geolocation API for regional well-being. When you open up the website for the first time, the browser asks you for your location. The visualization then starts with your current region selected which makes for a great entry point. You don't have to find it in a list or anything, it's just there.



# Graphics technologies
<div class="fragment">
<h2>SVG</h2>

<ul>
<li class="pro">vector-based &nbsp;&nbsp;&nbsp;&#x2295;</li>
<li class="pro">DOM integration &nbsp;&nbsp;&nbsp;&#x2295;</li>
<li class="con">slow(er) &nbsp;&nbsp;&nbsp;&#x2296;</li>
</ul>
</div>

<div class="fragment">
<h2>Canvas</h2>

<ul>
<li class="pro">fast &nbsp;&nbsp;&nbsp;&#x2295;</li>
<li class="con">low-level &nbsp;&nbsp;&nbsp;&#x2299;</li>
<li class="con">no DOM &nbsp;&nbsp;&nbsp;&#x2296;</li>
</ul>
</div>

<div class="fragment">

<h2>WebGL</h2>

<ul>
<li class="pro">faster &nbsp;&nbsp;&nbsp;&#x2295;</li>
<li class="pro">3D &nbsp;&nbsp;&nbsp;&#x2295;</li>
<li class="con">low-level &nbsp;&nbsp;&nbsp;&#x2299;</li>
<li class="con">no DOM &nbsp;&nbsp;&nbsp;&#x2296;</li>
</ul>
</div>

Note:
Another aspect when developing for mobile is performance. Phones and tablets are just slower than your usual laptop. So it makes sense to pick the right graphics technology for your project: SVG is nice because it's vector-based (i.e., scales easily) and even has DOM integration, so you can bind event handlers to specific elements of your visualization. But, it's a bit slower than canvas and WebGL. Those two are fairly low-level, based on drawing loops (so you tell them to clean and then draw all graphical elements yourself basically) and lack the DOM-support. But they're fast! So, pick your poison.



<section data-background="assets/tap_size_apple.png">
<h1>Interaction</h1>
<h2>Fat fingers</h2>

<h3 class="bottom"><a href="https://developer.apple.com/library/ios/documentation/userexperience/conceptual/mobilehig/LayoutandAppearance.html">>Apple Human Interface Guidelines</a></h3>

<aside class="notes">
The main difficulty with designing mobile visualizations is the interaction-part. You no longer have a nice, minimal cursor with fine grained controls but only fat fingers that overlap your screen. Here's just one example from Apple's guidelines, but all smartphone companies recommend a certain minimum size for interactive on-screen elements.
</aside>
</section>



<section data-background="assets/selfiexploratory.png">
<h2 class="bottom">selfiecity: selfiexploratory</h2>
<h3 class="bottom">http://selfiecity.net/selfiexploratory</h3>
<p class="bottom">With Lev Manovich, Moritz Stefaner, et al.</p>

<aside class="notes">
Sometimes, you can avoid the fat finger problem altogether. Selfiecity was a project I did together with Lev Manovich, Moritz Stefaner, Daniel Goddemeyer and several other amazing people. We looked at the differences in selfie-taking practices across cities world-wide. Part of that is the 'Selfiexploratory', where you can explore our dataset, filter based on head orientation, glasses, smile, city, age, etc. Basically you have your filters at the top and the results at the bottom.
And this worked out-of-the-box on tablets, because all interactive elements are easily big enough to be reliably hit even with fat fingers. But what to do when you wanna show high resolution visualizations that are still interactive?
</aside>
</section>



<section data-background="assets/scatterplot_touch.png">
# Interaction hacks
## Invisible touch areas
```
opacity: 0;
z-index: 99999;
```

Note:
One weird trick is creating invisible touch-enabled areas. Basically, set "opacity" to 0, so they're no longer visible but still interactive (just add a "touch"-event listener). Then, make sure that they're right on top your small but interactive element and do the right thing when the touch event lands.
</section>



<section data-background="assets/linechart_touch.png">
# Interaction hacks
## Invisible touch areas ii
```
opacity: 0;
z-index: 99999;
```

Note:
Usually, you would use circular elements for certain parts of the graph. But it can also be useful to use different shapes: In this example you could map rectangles over the chart, so it no longer matters what part of the chart is touched.
</section>



# Tooltips
![](assets/tooltips1.png)

Note:
Which brings us to the main problem of data vis on mobile devices: Hovering and tooltips! When you focus on it you notice how omnipresent the tooltip is for visualizations - it's the go-to solution for showing details-on-demand. This becomes harder on mobile as we don't have hovering. Mobile Safari emulates this behavior on a regular website (i.e., one with mouse events) by having the first touch becoming a "mouseover" and the next on the same element a "mousedown".



<section data-background="assets/always_tooltip.png">
# Tooltips
## Always-on
```
position: fixed;
```

Note:
One better solution is to just show the tooltip always. Hook it up to the relevant on-screen element (here, the little arrow) and change it accordingly. Or pick a suitable part of the layout and put it there, maybe just with position:fixed on-top of everything at the bottom.
</section>




<section data-background="assets/d3_multitouch.png">
# Multi-touch/Gestural interactions

Note:
What's cool is, you can also do multi-touch or gestural interactions on mobile. You basically keep track of all the "touchstarts" on an element and then decide what to do about it. But frameworks can help you. d3.js comes with a couple of parts that handle multi-touch automatically (in this case, the d3.behavior.zoom and d3.behavior.drag).
</section>



<section data-background="assets/quo_multitouch.png">
<h2 class="bottom">QuoJS</h2>
<h3 class="bottom">http://quojs.tapquo.com/</h3>
Note:
And when you want to be more fancy about it, you can use a dedicated interaction library like QuoJS or hammer.js, that even detect gestures. So now you can handle pinch and rotate, swipe, long presses and so on. Really cool.
</section>



<section><video src="assets/touchwave_interactions.mov" data-autoplay></video>
<h2 class="bottom">TouchWave</h2>
<h3 class="bottom">D. Baur, B. Lee, S. Carpendale</h3>

Note:
When you want to be really really mobile-only, just treat your graph like a piece of dough and let people deform it using their fingers. That's what we did with this research project here, TouchWave, where we took a streamgraph and defined several multi-touch interactions that let you stretch and deform it as you wanted. This was back in 2012 and native to get the right speed. But it might work on the web by now!
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



<video src="assets/bluemarble.mp4" data-autoplay loop style="height:1080px; padding-right:1000px"></video>
<h2 class="bottom">Deviceorientation Demo</h2>
<h3 class="bottom">http://dominikus.github.io/bluemarble</h3>

<aside class="notes">
Here's a demo that uses this API. It lets you rotate a little globe based on the movements of your device. Give it a try. And while 3D is somewhat of a four-letter-word in visualization, this device orientation stuff might actually help with it...
</aside>



# Thank you!
<h2 class="bottom">Dominikus Baur</h2>
<h3 class="bottom"><a href="http://do.minik.us">http://do.minik.us</a><br/><a href="http://twitter.com/dominikus">@dominikus</a>
</h3>

<h2 class="leftlinks">
**OECD Regional Well-Being**<br/><br/>
**selfiecity**<br/><br/>
**Orientation demo**<br/>
</h2>

<h3 class="leftlinks">
http://oecdregionalwellbeing.org<br/><br/>
http://selfiecity.net<br/><br/>
http://dominikus.github.io/bluemarble
</h3>



# BACKUP



# Today:
* mobile data vis? (overview)
* responsive visualizations
   * what to take from general RWD
   * basics: meta viewport, lock zoom
   * bootstrap
   * library support, e.g., chartist
   * SVG viewport trick
* Responsive is good but often not enough!
* What's important when thinking about mobile?
   * Display
      * SVG, Canvas, WebGL?
      * Available screen space (how to re-organize elements)
   * Context
      * (example: woman walks into fountain)
      * Data first!
      * Get context from HTML5 libraries (example: location in OECD Regional Well-Being)
   * Interaction
      * Fat fingers, element sizes (example: Selfiecity on tablet)
      * tipp: invisible interaction elements
      * Hover + tooltips
      * Multi-touch
         * Libraries (QUOJS, HammerJS)
         * Fluid interactions (example: TouchWave)
      * Sensors
         * Gyros/Accelerometers
         * Compass (example: )
	  *
* Debugging on Mobile
   * Chrome emulation
   * Remote debugging

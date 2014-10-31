<section data-background="assets/kitten.gif">
# Everything except the chart
### [Dominikus Baur](http://do.minik.us)
### [Moritz Stefaner](http://moritz.stefaner.eu)

Note:
Hello visweek!
</section>



<section data-background="assets/about_me_projects.png">
# Dominikus Baur

<p class="short">
<!--**Freelance data visualization**<br/><br/>
**PhD** (visualizing music listening histories)<br/><br/>
**Latest**:<br/>
visits (http://v.isits.in), <br/>
selfiecity (http://selfiecity.net)
</p>-->

<h3 class="bottom">http://do.minik.us<br/><a href="http://twitter.com/dominikus">@dominikus</a></h3>

Note:
I'm Dominikus Baur and I do data visualizations and mobile interaction design here in Munich. One of the challenges that I find most interesting is how to get visualizations to mobile devices, so tablets or even smartphones.
</section>



<section data-background="assets/woman_smartphone.jpg">

<p class="attribution">
<a href="https://www.flickr.com/photos/chrislaboule/15041056055">Flickr: Christian Hornick</a>
</p>

Note:
This is a tough one because of the differences between laptops or other, lets call them "keyboard-computers", and smartphones. Phones have small, portrait high-resolution displays. They're also operated using those pesky fat fingers and not a discrete, indirect cursor.
</section>



<section data-background="assets/fountain_texting2.gif">

Note:
But the main difference are your users, who are on-the-go, in the middle of something else and are not in the mood for any UI shenanigans. They wanna get something done, they have a clear task and they want the data.
</section>



<section data-background="assets/background.png">
<h1 class="center">Data first!</h1>

Note:
So, give them the data! That's my central mantra for any project: how to put the data first. This can be tough, because sometimes it means letting go of all the nice ideas that you might have about UI or interface. But mobile visualization means designing for data, first and foremost.
</section>



<section>

Note:
Ok, to be a little bit more specific I want to give you an example. One of the most successful visualizations of them all:
</section>



<section data-background="assets/mvv-netz.jpg">

Note:
... transit maps. You've probably encountered this one when you came here by public transport and there are others, such as ...
</section>



<section data-background="assets/newyork_subway.jpg">

Note:
... New York's subway map ...
</section>



<section data-background="assets/london_tube.jpg">

Note:
... or the one that started it all, the London tube map. Where you can ...
</section>



<section data-background="assets/animals_underground.jpg">
<p class="attribution">
<a href="http://www.animalsontheunderground.com/">http://www.animalsontheunderground.com</a>
</p>

Note:
... even find little animals if you look closely!
</section>



<section data-background="assets/mvv-netz.jpg">

Note:
Anyway. This is Munich's transit map and they're about to get a free design consulting. Because if you open up their homepage on a phone...
</section>



<section data-background="assets/mvv-iphone-1.png">

Note:
... this is what you get! And if you manage to find the transit map ...
</section>



<section data-background="assets/mvv-iphone-2.png">

Note:
...It's just the poster-sized map squeezed down to a smartphone display. How can we make that better?
</section>



<section data-background="assets/maps_spectrum.jpg">

Note:
A little bit of background about train maps: They basically fall on a spectrum between geographically acurate and purely diagrammatic. So a geographic one is just a map with stations on it and MVV's current one falls kind of into the middle. Still has some geographic aspects in it, but also some abstractions to improve readability.
This gives us some freedom in how to approach it, make it better on mobile.
</section>



<section data-background="assets/background.png">

<h1 class="impact center">1. Vertical is the new black.</h1>

Note:
The first aspect is about ergonomics. The most natural navigation on a phone is vertical scrolling, simply because you have to optimize for one-handed interaction and this movement (show thumb movement) is easiest for our thumbs. It's much much harder to do controlled scrolling along two dimensions using your thumb. So, when starting to design for mobile...

</section>



<section data-background="assets/illustrator_widescreen.png">

Note:
... make sure that your canvas doesn't look like this ...
</section>



<section data-background="assets/illustrator_narrow.png">

Note:
... but more like this. Design for vertical with as much space as you like. If your one scrollable lane isn't enough for your content or you want to further organize your data simply expand it: ...
</section>



<section data-background="assets/illustrator_lanes.png">

Note:
... Add more dedicated "lanes" that people can access by swiping left or right. Such discrete horizontal scrolling using a swipe works pretty well.
</section>



<section data-background="assets/map_update.png">

Note:
As a quick static draft, I've rotated the whole map by 90 degrees (so West becomes Up, East becomes Down) and straightened out the train lines.
</section>



<section data-background="assets/map_update2.png">

Note:
We can then organize the suburban trains in the center, sorted from South to North which becomes Left to Right and open up additional "lanes" left and right:
</section>



<section data-background="assets/map_update3.png">

Note:
The next suburban train lanes are special, as they cross the subway lines at certain stations. ...
</section>



<section data-background="assets/map_update4.png">

Note:
... and even further out we have the subway lines. This gives us a nice information architecture: In the central lane the "pure" suburban trains, the middle lanes hold suburban trains with subway crossings and the outer lanes are for subway trains. Much better access for people just learning the map than having everything mashed in one.
</section>



<section data-background="assets/map_phone.png">

Note:
And this is what it might look like on a phone. Easily readable even on the go and equally easy to navigate.
</section>



<section data-background="assets/background.png">
<h1 class="impact center">2. Start smart!</h1>

Note:
Second: whenever people open your visualization, try to give them with the data they need - start smart.
</section>



<section data-background="assets/gephi_screenshot.jpg">
<p class="attribution">
<a href="http://gephi.github.io/">Gephi</a>
</p>

Note:
It's cool if they have all the buttons in the world to customize your interface but they're probably not in the mood. Think back to the fountain. Data first.
</section>



<section data-background="assets/map_phone.png">
# Context?

Note:
So try to set up the visualization so that people get what they need. Ask yourself what situation your users are in, what's their context. In our case, they're probably standing at a station, wondering what trains are leaving where.
</section>



<section data-background="assets/station_focus.jpg">

Note:
How to start smart? Get the current coordinates from the phone (you can even do that with a web app) and center on the nearest station at launch. Trivial and so much better than forcing people to first scroll there.
</section>



<section data-background="assets/ausgeblendet.png">

Note:
To start even smarter, try to use as much context as possible. You can, for example, also get the current time and hide trains that aren't leaving anymore. In Munich, certain train lines have a very different schedule late at night or on weekends, so just hide those trains that aren't even going.
</section>



<section data-background="assets/background.png">
<h1 class="impact center">3. Interaction is everything.</h1>

Note:
Finally, all your smart layout and use of context can only get you so far. You can't read your user's mind. So, for data visualization in general, but especially on mobile devices, helpful interaction is king.
</section>



<section data-background="assets/warp_warp.png">

Note:
We've already made navigation convenient using our vertical lanes. And we can add little niceties to that, letting go of the strict lane-metaphor. Swiping right on the left-most lane should take you to the right-most lane and vice versa. Similarly, scrolling to the very top (the airport station on the S1 line) and scrolling further up should take you to the very bottom of the map (the airport station on the S8 line) and so on. Quick shortcuts.
</section>



<section data-background="assets/phone_search.png">

Note:
Also, make use of the machine's capabilities whenever possible. We probably want a direct station search, so people can type, for example, the name of their destination and having the map directly fly to it.
</section>



<section data-background="assets/next_trains.png">

Note:
In true details-on-demand fashion, tapping on a station or line should provide more infos, a tooltip showing, for example, the trains currently leaving or a link to a geographic map of the station.
</section>



<section data-background="assets/labels_ondemand.png">

Note:
Also, placing labels is difficult and visually messy, so we could just show them in an area above the user's finger on-demand.
</section>



<section data-background="assets/squished_together.png">

Note:
Finally, as the map is digital, we can squeeze and cut it in whichever way we like. It would probably be helpful to both show the current station as well as the target station. There's basically no limits to what you can do.
</section>



<section data-background="assets/woman_texting.jpg">
# Thank you!
<h3 class="bottom">http://do.minik.us<br/><a href="http://twitter.com/dominikus">@dominikus</a></h3>
Note:
Ok, that's it, thank you so much, and in case there's anyone from the MVV in the audience: Yes! You _can_ hire me! Thank you :)
</section>

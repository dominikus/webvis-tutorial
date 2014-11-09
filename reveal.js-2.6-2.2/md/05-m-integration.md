<section data-background="" class="chapter" id="integration">
<h1 >Integration</h1>
</section>



<section data-background="" class="">
<h1>Findability</h1>

<pre class="html"><code>
&lt;html>
	&lt;head>
		&lt;style type="text/css">&lt;/style>
	&lt;/head>
	&lt;body>
		&lt;script src="main.js">&lt;/script>
	&lt;/body>
&lt;/html>

</code>
</pre>

</section>



<section data-background="" class="">
<h1>Findability</h1>

<pre class="html"><code>
&lt;html>
	&lt;head>
		&lt;title>Visualizing something&lt;/title>
		&lt;meta name="description" content="An interactive visualization of ...">
		&lt;style type="text/css">&lt;/style>
	&lt;/head>
	&lt;body>
		&lt;h1 style="visibility: hidden;">Title of page&lt;/h1>
		&lt;p style="visibility: hidden;">Intro text&lt;/p>
		&lt;img style="visibility: hidden;" src="hero.png" />
		&lt;script src="main.js">&lt;/script>
	&lt;/body>
&lt;/html>

</code>
</pre>

</section>




<section data-background="" class="large">
<h1>Sharing of invidividual views</h1>
<h2>Requires deeplinking</h2>
<pre><code>
# start page
//domain.com/

# custom entry point
//domain.com/#australia
</code></pre>
</section>



<section>

<iframe style="height: 500px !important;" src="//oecdregionalwellbeing.org"></iframe>
<h3>Three modes of sharing: Home page, specific region, snippet level</h3>

<h3>What people share: http://twitter.com/search?q=oecdrwb&src=typd</h3>


</section>



<section data-background="" class="">
<h1>Snippet sharing</h1>

<img src="assets/integration/sharing.png">
<br><br>
<pre>
```
$('p.tweetable', el).on "mouseover", ()->
	text = $(@).attr("data-tweet-text") || $(@).text()
	text = 'Did you know? ' + text + ' How about your region?'
	openSharingPopup(text)
```
</pre>

</section>




<section class="">
<h1>Sentence level sharing at the guardian</h1>
<!-- <a href="https://twitter.com/wblau/status/529713139961827329/photo/1" data-preview-link>test</a> -->
<img class="full-width" src="https://pbs.twimg.com/media/B1nrSy6IIAAasnZ.png">

</section>



<section class="">
<h1>Meta tag generator</h1>
<iframe class="full" src="http://www.metataggenerator.org/open-graph-meta-tags/"></iframe>

</section>



<section data-background="">
http://www.pinterest.com/selfiecity/selfiecity/
<br>
<iframe class="full" src="http://selfiecity.net"></iframe>
</section>





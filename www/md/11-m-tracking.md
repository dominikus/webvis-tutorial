<section class="chapter">
	<h1>Tracking</h1>

</section>



<section data-background="assets/tracking/tracking-01.png">
&nbsp;

</section>



<section data-background="assets/tracking/tracking-02.png">
&nbsp;

</section>



<section data-background="assets/tracking/tracking-03.png">
&nbsp;

</section>



<section data-background="assets/tracking/tracking-04.png">
&nbsp;

</section>



<section data-background="assets/tracking/tracking-05.png">

&nbsp;
</section>



<section>
<h1>Google Analytics example</h1>

<pre class="coffeescript"><code>
if not newRegion?
	# invalid region - go back to start page
	track('invalidRegionHash', path)
	window.location.href = 'index.html'
	return

window.document.title = newRegion.get("label") + "  |  OECD Regional Well-Being"

track('changeRegion', path)

# ga tracking function
track = (ev, p1, p2) ->
	try
		if p2?
			ga('send', 'event', ev, p1 + ' ' + p2)
		else
			ga('send', 'event', ev, p1)
	catch e
		""
</code></pre>

</section>



<section>
	# A/B testing
	<iframe src="http://www.smashingmagazine.com/2010/06/24/the-ultimate-guide-to-a-b-testing/"></iframe>

</section>



<section>
	<iframe src="http://piwik.org"></iframe>

</section>

# -------------------

class App extends Backbone.Router
	views: {}
	models: {}

	routes:
		'*path': 'pageChange'

	initialize: ()->
		@views.titleBar = new TitleBar()
		Backbone.history.start()

	pageChange: (path)->
		console.log "page change", path

# -------------------

app = new App()

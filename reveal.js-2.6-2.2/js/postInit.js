Reveal.addEventListener('ready', function(event) {
	var drawChart = function(target, titles){
		var data = [1050,1340,1400,1550, 937];
		var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
		var horizontal = d3.scale.ordinal().domain(days).rangePoints([50,650]);
		var vertical = d3.scale.linear().domain([0,1500]).range([550,50]);
		var svg = d3.select(target).append("svg").attr("width", "800px").attr("height", "600px").style("background", "white");
		var chart = svg.selectAll(".bar").data(data);
		var chartEnter = chart.enter().append("rect")
			.classed("bar", true)
			.attr("x", function(d,i){ return horizontal(days[i]);})
			.attr("y", vertical)
			.attr("width", "80px")
			.attr("height", function(d){ return 550 - vertical(d);})
			.style("fill", "lightblue")
			.style("stroke", "black");

		if(titles){
			chartEnter.append("title").text(function(d,i){
				return days[i]+": " + d + " calories ";
			});
		}

		var xAxis = d3.svg.axis().scale(horizontal).orient("bottom");
		var yAxis = d3.svg.axis().scale(vertical).orient("left");

		svg.append("g").attr("class", "axis").attr("transform", "translate(0,550)").call(xAxis);
		svg.append("g").attr("class", "axis").attr("transform", "translate(50,0)").call(yAxis);
	};

	drawChart("#screen-reader-chart", false);
	drawChart("#screen-reader-chart2", true);


	// niceties
	$( 'p:empty' ).remove();

	$("section").each(function(i,slide){
		if($(slide).hasClass("stack")){
			return;
		};
		var container = $("<div class='iframe-link-container'></div>").prependTo($(slide));
		$("iframe", $(slide)).each(function(i,x){
				var el = $(x);
				var link = el.attr("src") || el.attr("data-src");
				$("<a target='_blank' class='iframe-link' href='"+link+"''>"+link+"</a>").appendTo(container);
			});
		});

	console.log("done initing.");
} );

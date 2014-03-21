function dynamicBubbles() {

var width = 960;
var height = 500;

// construct SVG container
var chart = d3.select("#dynD3").append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(50, 50)");

// define our pack
var pack = d3.layout.pack()
    .size([width, height - 50])
    .padding(10);
}

// get data from MVC controller
$.ajax({
    type: "GET",
    async: true,
    cache: false,
    url: "/stats",
    data: { },
    success: function (data) {

        // asign new data to existing layout
        var node = chart.select(".node")
            .data(pack.nodes(data), function (d) { return d.name });

        // access brand new data
        node.enter().append("g")
                .classed("node", true)
                .attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })
            .append("circle")
                .attr("fill", function (d) { return d.children ? "#fff" : "steelblue" })
                .attr("stroke", function (d) { return d.children ? "#fff" : "#ADADAD" })
                .attr("stroke-width", "1")
                .transition()
                .attr("r", function (d) {return d.r});

        node.transition()
            .duration(2000)
            .attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; });


        node.select("circle")
            .transition()
            .duration(2000)
            .attr("r", function (d) { return d.r; });

        node.append("text")
            .text(function (d) { return d.name; });

    }
});

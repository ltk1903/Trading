var App = (function () {

  App.dashboard = function( opts ){
    'use strict'

  	var options = {};
  	var defaults = {
  		introTour: true
  	};

  	//Extend default conf
  	$.extend( options, defaults, opts );

    /*Skycons*/
      var skycons = new Skycons({"color": "#FFFFFF"});
      skycons.add($("#sun-icon")[0], Skycons.PARTLY_CLOUDY_DAY);
      skycons.play();

    /*Sparklines*/
      $(".spk1").sparkline([2,4,3,6,7,5,8,9,4,2,6,8,8,9,10], { type: 'bar', width: '80px', barColor: '#4A8CF7'});
      $(".spk2").sparkline([4,6,7,7,4,3,2,1,4,4 ,5,6,5], { type: 'discrete', width: '80', lineColor: '#4A8CF7',thresholdValue: 4,thresholdColor: '#ff0000'});
      $(".spk3").sparkline([5,6,7,9,9,5,3,2,2,4,6,7], {
        type: 'line',
        lineColor: '#258FEC',
        fillColor: '#4A8CF7',
        spotColor: false,
        width: '80px',
        minSpotColor: false,
        maxSpotColor: false,  
        highlightSpotColor: '#1e7ac6',
        highlightLineColor: '#1e7ac6'
      });

    /*Dashboard Charts*/
      if (!jQuery.plot) {
        return;
      }

      var data = [];
      var totalPoints = 250;
      // random data generator for plot charts

      function getRandomData() {
        if (data.length > 0) data = data.slice(1);
        // do a random walk
        while (data.length < totalPoints) {
        var prev = data.length > 0 ? data[data.length - 1] : 50;
        var y = prev + Math.random() * 10 - 5;
        if (y < 0) y = 0;
        if (y > 100) y = 100;
        data.push(y);
        }
        // zip the generated y values with the x values
        var res = [];
        for (var i = 0; i < data.length; ++i) res.push([i, data[i]])
        return res;
      }

      function showTooltip(x, y, contents) {
        $("<div id='tooltip'>" + contents + "</div>").css({
          position: "absolute",
          display: "none",
          top: y + 5,
          left: x + 5,
          border: "1px solid #000",
          padding: "5px",
          'color':'#fff',
          'border-radius':'2px',
          'font-size':'11px',
          "background-color": "#000",
          opacity: 0.80
        }).appendTo("body").fadeIn(200);
      } 

      function randValue() {
        return (Math.floor(Math.random() * (1 + 50 - 20))) + 10;
      }

      var pageviews = [
        [1, randValue()],
        [2, randValue()],
        [3, 2 + randValue()],
        [4, 3 + randValue()],
        [5, 5 + randValue()],
        [6, 10 + randValue()],
        [7, 15 + randValue()],
        [8, 20 + randValue()],
        [9, 25 + randValue()],
        [10, 30 + randValue()],
        [11, 35 + randValue()],
        [12, 25 + randValue()],
        [13, 15 + randValue()],
        [14, 20 + randValue()],
        [15, 45 + randValue()],
        [16, 50 + randValue()],
        [17, 65 + randValue()],
        [18, 70 + randValue()],
        [19, 85 + randValue()],
        [20, 80 + randValue()],
        [21, 75 + randValue()],
        [22, 80 + randValue()],
        [23, 75 + randValue()]
      ];

      var visitors = [
        [1, randValue() - 5],
        [2, randValue() - 5],
        [3, randValue() - 5],
        [4, 6 + randValue()],
        [5, 5 + randValue()],
        [6, 20 + randValue()],
        [7, 25 + randValue()],
        [8, 36 + randValue()],
        [9, 26 + randValue()],
        [10, 38 + randValue()],
        [11, 39 + randValue()],
        [12, 50 + randValue()],
        [13, 51 + randValue()],
        [14, 12 + randValue()],
        [15, 13 + randValue()],
        [16, 14 + randValue()],
        [17, 15 + randValue()],
        [18, 15 + randValue()],
        [19, 16 + randValue()],
        [20, 17 + randValue()],
        [21, 18 + randValue()],
        [22, 19 + randValue()],
        [23, 20 + randValue()],
        [24, 21 + randValue()],
        [25, 14 + randValue()],
        [26, 24 + randValue()],
        [27, 25 + randValue()],
        [28, 26 + randValue()],
        [29, 27 + randValue()],
        [30, 31 + randValue()]
      ];

      if ($('#site_statistics').size() != 0) {
        $('#site_statistics_loading').hide();
        $('#site_statistics_content').show();
        var plot_statistics = $.plot($("#site_statistics"), [{
          data: pageviews,
          label: "Sales"
        }
        ], {
          series: {
            lines: {
              show: true,
              lineWidth: 2, 
              fill: true,
              fillColor: {
                colors: [{
                  opacity: 0.2
                }, {
                  opacity: 0.01
                }
                ]
              } 
            },
            points: {
              show: true
            },
            shadowSize: 2
          },
          legend:{
            show: false
          },
          grid: {
          labelMargin: 10,
             axisMargin: 500,
            hoverable: true,
            clickable: true,
            tickColor: "rgba(255,255,255,0.22)",
            borderWidth: 0
          },
          colors: ["#FFFFFF", "#4A8CF7", "#52e136"],
          xaxis: {
            ticks: 11,
            tickDecimals: 0
          },
          yaxis: {
            ticks: 5,
            tickDecimals: 0
          }
        });
        
        var plot_statistics2 = $.plot($("#site_statistics2"), [{
          data: pageviews,
          label: "Unique Visits"
        }, {
          data: visitors,
          label: "Page Views"
        }
        ], {
          series: {
            bars: {
              show: true,
              barWidth: 0.7,
              lineWidth: 1,
              fill: true,
              hoverable: true,
              fillColor: {
                colors: [{
                  opacity: 0.85
                }, {
                  opacity: 0.85
                }
                ]
              } 
            },
            shadowSize: 2
          },
          legend:{
            show: false
          },
          grid: {
          labelMargin: 10,
             axisMargin: 500,
            hoverable: true,
            clickable: true,
            tickColor: "rgba(255,255,255,0.22)",
            borderWidth: 0
          },
          colors: ["#e67653", "#FFFFFF", "#52e136"],
          xaxis: {
            ticks: 11,
            tickDecimals: 0
          },
          yaxis: {
            ticks: 6,
            tickDecimals: 0
          }
        });
        
        /*Pie Chart*/
        var data = [
        { label: "Google", data: 50},
        { label: "Dribbble", data: 7},
        { label: "Twitter", data: 8},
        { label: "Youtube", data: 9},
        { label: "Microsoft", data: 14},
        { label: "Apple", data: 13},
        { label: "Amazon", data: 10},
        { label: "Facebook", data: 5}
        ]; 

        $.plot('#piec', data, {
          series: {
            pie: {
              show: true,
              innerRadius: 0.27,
              shadow:{
                top: 5,
                left: 15,
                alpha:0.3
              },
              stroke:{
                width:0
              },
              label: {
                  show: true,
                  formatter: function (label, series) {
                      return '<div style="font-size:12px;text-align:center;padding:2px;color:#333;">' + label + '</div>';
                  }
              },
              highlight:{
                opacity: 0.08
              }
            }
          },
          grid: {
            hoverable: true,
            clickable: true
          },
          colors: ["#5793f3", "#dd4d79", "#bd3b47","#dd4444","#fd9c35","#fec42c","#d4df5a","#5578c2"],
          legend: {
            show: false
          }
        });
        
        /*COM Chart*/
        var data_com = [
          [1, randValue() - 5],
          [2, randValue() - 5],
          [3, randValue() - 5],
          [4, 6 + randValue()],
          [5, 6 + randValue()],
          [6, 6 + randValue()],
          [7, 5 + randValue()],
          [8, 3 + randValue()],
          [9, 2 + randValue()]
        ];
         var names = [
                      "Alpha",
                      "Beta",
                      "Gamma",
                      "Delta",
                      "Epsilon",
                      "Zeta",
                      "Eta",
                      "Theta"
                  ];
            
        var plot_statistics = $.plot($("#com_stats"), [{
          data: data_com, showLabels: true, labels: data_com, labelPlacement: "below", canvasRender: true, cColor: "#FFFFFF" 
        }
        ], {
          series: {
            lines: {
              show: true,
              lineWidth: 2, 
              fill: true,
              fillColor: {
                colors: [{
                  opacity: 0.25
                }, {
                  opacity: 0.25
                }
                ]
              } 
            },
            points: {
              show: true
            },
            shadowSize: 2
          },
          legend:{
            show: false
          },
          grid: {
            show:false,
            margin: 5,
            labelMargin: 10,
             axisMargin: 10,
            hoverable: true,
            clickable: true,
            tickColor: "rgba(255,255,255,0.22)",
            borderWidth: 0
          },
          colors: ["#50ACFE"],
          xaxis: {
            autoscaleMargin: 0.04,
            ticks: 11,
            tickDecimals: 0
          },
          yaxis: {
            autoscaleMargin: 0.2,
            ticks: 5,
            tickDecimals: 0
          }
        });
        
        /*Bar charts widget*/
          var data3 = [
          [1, randValue()],
          [2, randValue()],
          [3, 2 + randValue()],
          [4, 3 + randValue()],
          [5, 5 + randValue()],
          [6, 10 + randValue()],
          [7, 15 + randValue()],
          [8, 20 + randValue()],
          [9, 20 + randValue()],
          [10, 20 + randValue()],
          [11, 20 + randValue()],
          [12, 20 + randValue()],
          [13, 20 + randValue()],
          [14, 20 + randValue()],
          [15, 20 + randValue()],
          [16, 75 + randValue()]
          ];

        var plot_statistics2 = $.plot($("#com2_stats"), [{
          data: data3,
          label: "Unique Visits"
        }
        ], {
          series: {
            bars: {
              show: true,
              barWidth: 0.7,
              lineWidth: 0,
              fill: true,
              fillColor: {
                colors: [{
                  opacity: 0.8
                }, {
                  opacity: 0.8
                }
                ]
              },
              hoverable: true
            },
            shadowSize: 2
          },
          legend:{
            show: false
          },
          grid: {
            show: true,
            labelMargin: 10,
             axisMargin: 500,
            hoverable: true,
            clickable: true,
            tickColor: "rgba(0,0,0,0.1)",
            borderWidth: 0,
            margin: {
              left: -20
            }
          },
          colors: ["#FD6A5E", "#FFFFFF", "#52e136"],
          xaxis: {
            font:{
              color: "rgba(0,0,0,0.6)",
              lineHeight: '0',
              size: '5px'
            },
            ticks: 11,
            tickDecimals: 0
          },
          yaxis: {
            font:{
              lineHeight: '0',
              size: '5px',
              color: "rgba(255,255,255,0)"
            },
            ticks: 6,
            tickDecimals: 0
          }
        });
        
        
        var previousPoint = null;
        $("#site_statistics").bind("plothover", function (event, pos, item) {
        
          var str = "(" + pos.x.toFixed(2) + ", " + pos.y.toFixed(2) + ")";

          if (item) {
            if (previousPoint != item.dataIndex) {
              previousPoint = item.dataIndex;
              $("#tooltip").remove();
              var x = item.datapoint[0].toFixed(2),
              y = item.datapoint[1].toFixed(2);
              showTooltip(item.pageX, item.pageY,
              item.series.label + " of " + x + " = " + y);
            }
          } else {
            $("#tooltip").remove();
            previousPoint = null;
          }
        }); 
        
        $("#site_statistics2").bind("plothover", function (event, pos, item) {
        
          var str = "(" + pos.x.toFixed(2) + ", " + pos.y.toFixed(2) + ")";

          if (item) {
            if (previousPoint != item.dataIndex) {
              previousPoint = item.dataIndex;
              $("#tooltip").remove();
              var x = item.datapoint[0].toFixed(2),
              y = item.datapoint[1].toFixed(2);
              showTooltip(item.pageX, item.pageY,
              item.series.label + " of " + x + " = " + y);
            }
          } else {
            $("#tooltip").remove();
            previousPoint = null;
          }
        }); 
      }

    /*Jquery Easy Pie Chart*/
      $('.epie-chart').easyPieChart({
        lineWidth: 7,
        animate: { duration: 600, enabled: true },
        size: 102,
        scaleLength: 6,
        onStep: function(f, t, val){//Update current value while animation
          var height = $("canvas", this.el).height();
          $("span", this.el).html(parseInt(val) + "%").css({"line-height": height + "px"});
        }
      });

    /*Chat Comments*/
      $(".chat-in form").submit(function(e){

        var d = new Date();
        var time = d.getHours() + ":" + d.getMinutes();
        var inp = $("input[type='text']", this);
        var msg = inp.val();
        var img = 'images/avatar1_50.jpg';
          
        inp.val("");
        
        var tpl = $('<div class="chat-conv" style="display:none;">' +
                '<img title="" data-toggle="tooltip" src="'+ img +'" class="c-avatar ttip" data-original-title="">' +
                '<div class="c-bubble">' +
                  '<div class="msg">'+ msg +'</div>' +
                  '<div><small class="date">'+ time +'</small></div>' +
                  '<span></span>' +
                '</div>' +
              '</div>');
              
        $(this).parents(".chat-wi").find(".chat-content").css("transition", "all 1s ease");
        $(this).parents(".chat-wi").find(".chat-content").append(tpl);
        
        tpl.slideDown();
        e.preventDefault();
      });

    /*IntroJs*/
      if( options.introTour ){
      	introJs().setOption('showBullets', false).start();
      }

    /*Datepicker*/
      if (typeof jQuery.ui != 'undefined') {
        $( ".ui-datepicker" ).datepicker();
      }
  };

  return App;
})(App || {});

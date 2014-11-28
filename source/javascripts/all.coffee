//= require_tree ./lib
//= require_tree .

graph = new Graph(window.map)

$from = document.getElementById('from')
$to = document.getElementById('to')
$form = document.getElementById('form')
$result = document.getElementById('result')

prettify = (path) ->
  result = ""
  for stop_id, index in path
    stop = stops[stop_id]
    if route = routes[stop.route]
      unless stop.route == stops[path[index-1]].route == stops[path[index+1]].route
        result += "<div><div class='route' style='background-color: #" + route.color + "'>" + route.short_name + "</div><div class='stop'>" + stop.parent + '</div></div>'
  result

$form.onsubmit = (e) ->
  e.preventDefault()
  path = graph.findShortestPath($from.value, $to.value)
  $result.innerHTML = prettify(path)

strs = Object.keys(stops).sort()
$('#from, #to').typeahead {},
  name: 'stops'
  source: (q, cb) ->
    matches = []
    substrRegex = new RegExp "^#{removeDiacritics(q)}", 'i'
    $.each strs, (i, str) ->
      if substrRegex.test removeDiacritics(str)
        matches.push { value: str }
    cb(matches)

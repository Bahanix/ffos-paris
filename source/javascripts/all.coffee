//= require_tree ./lib
//= require_tree .

graph = new Graph(window.map)

$from = document.getElementById('from')
$to = document.getElementById('to')
$form = document.getElementById('form')
$result = document.getElementById('result')

prettify = (path) ->
  for stop_id, index in path
    stop = window.stops[stop_id]
    route = window.routes[stop.route]
    if stop.parent_station
      stop = window.stops[stop.parent_station]
    if route
      path[index] = "<div><div class='route' style='background-color: #" + route.color + "'>" + route.short_name + "</div><div class='stop'>" + stop.name + '</div></div>'
    else
      path[index] = ""
  path

$form.onsubmit = (e) ->
  e.preventDefault()
  path = graph.findShortestPath(window.dict[$from.value], window.dict[$to.value])
  path.shift()
  path.pop()
  $result.innerHTML = prettify(path).join('')

//= require_tree ./lib
//= require_tree .

graph = new Graph(window.map)

$from = document.getElementById('from')
$to = document.getElementById('to')
$form = document.getElementById('form')
$result = document.getElementById('result')

iconify = (array) ->
  for string, index in array
    array[index] = string + string

$form.onsubmit = (e) ->
  e.preventDefault()
  path = graph.findShortestPath($from.value, $to.value)
  path.shift()
  path.pop()
  $result.innerHTML = '<p>' + iconify(path).join('</p><p>') + '</p>'

//= require_tree ./lib
//= require_tree .

graph = new Graph(window.map)

$from = document.getElementById('from')
$to = document.getElementById('to')
$form = document.getElementById('form')
$result = document.getElementById('result')

iconify = (array) ->
  for string, index in array
    string = string.replace(/[ ]bis /, "b ") + "</span>"
    oldString = string
    array[index] = string.
      replace(/^M([0-9]+b?)/, "<span class='metro symbole'>Metro</span><span class='metro ligne$1'>Ligne $1</span><span class='name'>").
      replace(/^([A-F])[0-9]* /, "<span class='rer symbole'>RER</span><span class='rer ligne$1'>Ligne $1</span><span class='name'>").
      replace(/^([G-S])[0-9]* /, "<span class='transilien symbole'>Transilien</span><span class='transilien ligne$1'>Ligne $1</span><span class='name'>").
      replace(/^T([0-9]+b?) /, "<span class='tram symbole'>Tram</span><span class='tram ligne$1'>Ligne $1</span><span class='name'>")
    array[index] = "" if oldString == array[index]
  array

$form.onsubmit = (e) ->
  e.preventDefault()
  path = graph.findShortestPath($from.value, $to.value)
  path.shift()
  path.pop()
  $result.innerHTML = '<p>' + iconify(path).join('</p><p>') + '</p>'

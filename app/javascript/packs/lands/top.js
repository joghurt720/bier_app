let link_east = document.getElementById("link_to_east");
let link_west = document.getElementById("link_to_west");
let link_south = document.getElementById("link_to_south");
let link_north = document.getElementById("link_to_north");

let image_map = document.getElementById("image_map");
let image_east = document.getElementById("image_east");
let image_west = document.getElementById("image_west");
let image_south = document.getElementById("image_south");
let image_north = document.getElementById("image_north");



link_east.addEventListener("mouseenter", function() {
  image_map.style.display = 'none'
  image_east.style.display = 'block'
});

link_east.addEventListener("mouseout", function() {
  image_east.style.display = 'none'
  image_map.style.display = 'block'
});

link_west.addEventListener("mouseenter", function() {
  image_map.style.display = 'none'
  image_west.style.display = 'block'
});

link_west.addEventListener("mouseout", function() {
  image_west.style.display = 'none'
  image_map.style.display = 'block'
});

link_south.addEventListener("mouseenter", function() {
  image_map.style.display = 'none'
  image_south.style.display = 'block'
});

link_south.addEventListener("mouseout", function() {
  image_south.style.display = 'none'
  image_map.style.display = 'block'
});

link_north.addEventListener("mouseenter", function() {
  image_map.style.display = 'none'
  image_north.style.display = 'block'
});

link_north.addEventListener("mouseout", function() {
  image_north.style.display = 'none'
  image_map.style.display = 'block'
});
var cellSize = 40;
var fontSize = 20;

$(document).ready(function(){
  $('td').each(function(){
    var ch = $('span', this);
    var width = Number(ch.css('width').slice(0, -2));
    var height = Number(ch.css('height').slice(0, -2));

    //if (width == 0) $(this).css('background-color', 'grey');

    if (cellSize < width || cellSize < height) {
      ch.css('font-size', fontSize * cellSize / (1 + (width < height ? height : width)) + 'pt');
      width = Number(ch.css('width').slice(0, -2));
      height = Number(ch.css('height').slice(0, -2));
      if (cellSize < width || cellSize < height) {
        $(this).css('background-color', 'red');
        console.log(ch);
        console.log({width:width, height:height});
      }
    }
  });
});
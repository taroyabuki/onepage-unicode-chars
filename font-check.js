var cellSize = 40;
var fontSize = 16;

$(document).ready(function(){
  $('td').each(function(){
    var ch = $('span', this);
    var width = Number(ch.css('width').slice(0, -2));
    var height = Number(ch.css('height').slice(0, -2));

    //blank check
    //if (width == 0) $(this).css('background-color', 'grey');

    //bitmap check (font size should be 4pt.)
    /*
    if (width > 10) {
      $(this).css('background-color', 'red');
      ch.css('font-size', fontSize + 'pt');
    }
    */

    if (cellSize < width || cellSize < height) {
      ch.css('font-size', Math.floor(fontSize * cellSize / (1 + (width < height ? height : width))) + 'pt');
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
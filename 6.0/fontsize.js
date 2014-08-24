var cellSize = 40;
var fontSize = 35;

var check = 0;
var result = new Object();

$(document).ready(function() {
  $('td').each(function() {
    var ch = $('div', this);
    var width = Number(ch.css('width').slice(0, -2));
    var height = Number(ch.css('height').slice(0, -2));
    var size = width < height ? height : width;

    //blank check
    //if (width == 0) $(this).css('background-color', 'grey');

    //bitmap check (font size should be 4pt.)
    /*
    if (width > 10) {
      $(this).css('background-color', 'red');
      ch.css('font-size', fontSize + 'pt');
    }
    */
    var newFontSize = fontSize;
    if (cellSize - 1 < size) {
      newFontSize = Math.floor(fontSize * (cellSize - 1) / size);
      //ch.css('font-size', newFontSize + 'px');
      /*
      width = Number(ch.css('width').slice(0, -2));
      height = Number(ch.css('height').slice(0, -2));
      size = width < height ? height : width;
      if (cellSize - 1 < size) {
        $(this).css('background-color', 'red');
        console.log(ch);
        console.log({width:width, height:height});
      }
      */
    } else check++;
    result[this.id] = newFontSize;
  });
  console.log(check);
  $('#result').val(JSON.stringify(result));
});
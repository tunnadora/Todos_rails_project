$(document).ready(function(){

  var count = 0;
  var images = ["http://localhost:3000/assets/back_imgs/book1.jpg","http://localhost:3000/assets/back_imgs/book2.jpg","http://localhost:3000/assets/back_imgs/book3.jpg","http://localhost:3000/assets/back_imgs/book4.jpg","http://localhost:3000/assets/back_imgs/book5.jpg"];
  var image = $(".fader");


  image.css("background-image","url("+images[count]+")");
  image.css("background-position","center");
  image.css("background-repeat","no-repeat");
  image.css("background-size","100%");
  



  setInterval(function(){
    image.fadeOut(500, function(){
      image.css("background-image","url("+images[count++]+")");
      image.fadeIn(500);
    
    
    });

    if(count == images.length)
    {
      count = 0;
    }
  },5000);

});
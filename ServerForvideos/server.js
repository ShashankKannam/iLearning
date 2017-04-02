var express = require('express');
var bodyParser = require('body-Parser');
var app = express();

app.all('/*', function(req, res, next){
  res.header("Access-Control-Allow-Access", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [{id:1,
                 title:"1. Intro to iOS Programming",
                 provider:"Stanford",
                 description:"Lecture 1: Introduction to iOS 10, Xcode 8 and Swift 3",
                 iframe:'<div class="container"><iframe class="video" src="https://www.youtube.com/embed/ilQ-tq772VI?list=PLPA-ayBrweUz32NSgNZdl0_QISw-f12Ai" frameborder="0" allowfullscreen></iframe>',
                 thumbnail:"https://pbs.twimg.com/profile_images/520246535632592896/N2cIW5h2.png"},
              {
                id:2,
                                 title:"2. Intro to iOS Programming",
                                 provider:"Stanford",
                                 description:"Lecture 1: Introduction to iOS 10, Xcode 8 and Swift 3",
                                iframe:'<div class="container"><iframe class="video" src="https://www.youtube.com/embed/ilQ-tq772VI?list=PLPA-ayBrweUz32NSgNZdl0_QISw-f12Ai" frameborder="0" allowfullscreen></iframe>',
                                thumbnail:"https://pbs.twimg.com/profile_images/520246535632592896/N2cIW5h2.png"},
                             {
                               id:3,
                                                title:"3. Intro to iOS Programming",
                                                provider:"Stanford",
                                                description:"Lecture 1: Introduction to iOS 10, Xcode 8 and Swift 3",
                                                iframe:'<div class="container"><iframe class="video" src="https://www.youtube.com/embed/ilQ-tq772VI?list=PLPA-ayBrweUz32NSgNZdl0_QISw-f12Ai" frameborder="0" allowfullscreen></iframe>',
                                               thumbnail:"https://pbs.twimg.com/profile_images/520246535632592896/N2cIW5h2.png"}
                ];


var comments = [{
  username:"Abhra",
  comment:"Thanks for sharing this very helpful video."
}];

app.post('/comments', function(req,res){
  var comment = req.body;
if (comment){
  if (comment.username && comment.comment){
    comments.push(comment);
  } else {
    console.log(comments)
    res.send("You posted invalid data.");
  }
} else {
      res.send("You post has no body.");
}
    console.log(comments);
    res.send("Your comment is succesfully posted.");
});


app.get('/tutorials', function(req,res){
  console.log("GET from Server");
  res.send(tutorials);
})

app.listen(5050);

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http,{path: '/jdr-chat/socket.io'});
var ent = require('ent');
var linkify = require('linkifyjs');
var linkifyHtml = require('linkifyjs/html');

app.use('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket,pseudo){

  socket.on('nouveau_client', function(pseudo) {
        pseudo = ent.encode(pseudo);
        socket.pseudo = pseudo;
        io.emit('nouveau_client', pseudo);
    });

  socket.on('chat message', function(msg){
    msg = ent.encode(msg);
    msg = linkifyHtml(msg)
    //io.emit('chat message', msg);
    io.emit('chat message', {pseudo:socket.pseudo,msg:msg});

  });
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});

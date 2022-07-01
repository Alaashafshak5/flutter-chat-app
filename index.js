const express = require('express')
const app = express();
var bodyParser = require('body-parser')
const http = require('http').createServer(app)
const mongoose = require("mongoose");
const multer = require('multer')
const path = require('path')
app.use(express.static('public'));

require("dotenv").config();
app.use(bodyParser.urlencoded({ extended: true }))
app.get('/', (req, res) => {
    res.send("Node Server is running. Yay!!")
})
app.use(bodyParser.json())
app.use(function (req, res, next) {
    res.header("Content-Type", 'application/json');
    res.header("Access-Control-Allow-Origin", "*");
    next();
});
mongoose.connect(
    process.env.MONGODB_URL,
    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }
);

const messageSchema = new mongoose.Schema({
    message: String
});

const Message = mongoose.model('Message', messageSchema);

const io = require('socket.io');
const socketio = io(http)

app.get('/get-messages', (req, res) => {
    Message.find({}, (err, found) => {
        if (!err) {
            return res.send(found);

        }
        else {
            console.log(err);
            return res.send("Some error occured!")
        }
    })
});
var filename;
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads')
    },

    filename: function (req, file, cb) {
        filename = file.originalname;
        cb(null,  file.originalname)
    }
});

var upload = multer({ storage: storage })
// console.log(upload)
app.post("/upload", upload.single('myFile'), async (req, res, next) => {
    console.log('hiiiiiiiiiiiiiiiiiiii')
    const file = req.file; 
    console.log('file', file)
    if (!file) {
        const error = new Error('Please upload a file')
        error.httpStatusCode = 400
        return next("hey error")
    }
    res.json('Image Uploaded ')
})

socketio.on("connection", (userSocket) => {
    console.log('xxxxx')
    userSocket.on("send_message", (data) => {
        const json = JSON.parse(data)
        // console.log(json.message)
        if (json.message.indexOf('PlatformFile') < 0) {
            // console.log('hi')
            // console.log(json.message)
            var msg = new Message({
                message: json.message
            });
        } else {
            // let file = json.message;
            console.log(filename)
            var msg = new Message({
                message: filename
            });
        }
        msg.save().then(() => console.log("Message saved successfully"));
        userSocket.broadcast.emit("receive_message", data)
    })
})

http.listen(5000)
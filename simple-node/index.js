const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, {
    "Content-type": "text/html",
  });
  res.end("<h1>Hello World from OpenShift NodeJS App</h1>");
});

server.listen(8000, () => {
  console.log("Listening to requests on Port 8000");
});

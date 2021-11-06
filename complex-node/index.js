const http = require("http");
const url = require("url");

const server = http.createServer(async (req, res) => {
  const { pathname } = url.parse(req.url);

  if (pathname === "/health") {
    res.writeHead(200, {
      "Content-type": "text/html",
    });

    res.end("<h1>Application is Up and Running</h1>");
  } else if (pathname === "/unhealthy") {
    res.writeHead(404, {
      "Content-type": "text/html",
    });

    res.end("<h1>Page Not Found</h1>");
  } else {
    res.writeHead(200, {
      "Content-type": "text/html",
    });
    res.end(
      `<h1>Hello World from OpenShift NodeJS App in POD NAME: ${process.env.HOSTNAME} from ${env.MY_VARIABLE}</h1>`
    );
  }
});

server.listen(8080, () => {
  console.log("Listening to requests on Port 8080");
});

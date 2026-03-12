const http = require('http');
const server = http.createServer((req, res) => {
  res.end('Hello from Docker Multi-Stage!\n');
});
server.listen(3000, () => console.log('Running on port 3000'));

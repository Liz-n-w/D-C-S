const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from a containerized app! CI/CD pipeline is working!');
});

app.get('/health', (req, res) => {
  res.status(200).send('Application is healthy');
});

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
});
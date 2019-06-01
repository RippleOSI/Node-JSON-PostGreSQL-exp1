const express = require('express');
const bodyParser = require('body-parser');
const db = require('./queries');
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true
  })
);

app.get('/headings', db.getAllHeadings);
app.post('/headings', db.postHeadings);
app.get('/headings/:patientId', db.getHeadingByPatientId);
app.get('/headings/search/:search', db.headingSearch);



app.listen(port, () => {
  console.log(`App running on port ${port}.`)
});

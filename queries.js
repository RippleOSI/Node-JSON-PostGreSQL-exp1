const Pool = require('pg').Pool;
const dotenv = require('dotenv');
dotenv.config();
const pool = new Pool({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});

const getAllHeadings = (request, response) => {
  pool.query('SELECT * FROM headings', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
};

const postHeadings = (request, response) => {
  const { patientId, heading, data } = request.body;
  const date = new Date().toISOString().slice(0, 10);
  const json = JSON.stringify(data);
  pool.query('INSERT INTO headings (patientId, heading, data, created_at) VALUES ($1, $2, $3, $4)',
    [patientId, heading, json, date],
    (error) => {
    if (error) {
      throw error
    }
    
    response.status(201).send(`User added new ${heading} heading`)
  })
};

const getHeadingByPatientId = (request, response) => {
  const patientId = request.params.patientId;
  pool.query('SELECT * FROM headings WHERE patientId = $1', [patientId], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
};

const headingSearch = (request, response) => {
  const search = request.params.search;
  
  pool.query(`SELECT * FROM headings WHERE heading LIKE '${search}%'`, (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
};



module.exports = {
  getAllHeadings,
  postHeadings,
  getHeadingByPatientId,
  headingSearch
};

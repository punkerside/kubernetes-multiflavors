const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json(
      {
          "method": "get"
      }
  );
})

app.post('/', (req, res) => {
  res.json(
      {
        "method": "post"
      }
  );
})

app.listen(3000, ()=>{
  console.log(`Server listening on port 3000`);
});
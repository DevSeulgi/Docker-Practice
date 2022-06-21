const express = require('express');
const app = express();
app.get('/',(req,res)=>{
  res.send('코오롱 글로벌에서의 첫 스터디입니다✨')
});
app.listen(8080, ()=>console.log('Server is running 🤖'));

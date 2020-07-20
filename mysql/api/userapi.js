var models = require('../db') // 引入db配置
var express = require('express') // express框架
var router = express.Router()
var mysql = require('mysql')
var $sql = require('../sqlMap') // sql语句

var conn = mysql.createConnection(models.mysql)
conn.connect()

var jsonWrite = function (res, ret) {
  if (typeof ret === 'undefined') {
    res.json({
      code: '1',
      msg: '操作失败'
    })
  } else {
    res.json(ret)
  }
}

// 查询列表接口，
// get接口，这里配置的/getlist,使用的时候就是 /home/getlist
// 回看index.js 中 app.use('/home', homeApi) ，就懂了

router.get('/getlist', (req, res) => {
  var sql = $sql.home.search
  var parms = req.query
  console.log(parms)
  conn.query(sql, function (err, result) {
    if (err) {
      console.log(err)
    }
    if (result) {
      console.log(result)
      res.send(result)
    }
  })
})

// 新增列表
// router.post('/addlist', (req, res) => {
//   var sql = $sql.home.add
//   var parms = req.body
//   console.log(parms)
//   conn.query(sql, [parms.title, parms.num], function (err, result) {
//     if (err) {
//       console.log(err)
//     }
//     if (result) {
//       jsonWrite(res, result)
//     }
//   })
// })

//添加
router.post('/add',(req,res) => {
    var sql = $sql.home.add
    var param =req.body;
    console.log(param);
    conn.query(sql, [param.name, param.password], function (err, result) {
        if (err) {
          console.log(err)
        }
        if (result) {
          jsonWrite(res, result)
        }
      })
})

router.get('/musiclist', (req, res) => {
    var sql = $sql.home.music_search
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.get('/album', (req, res) => {
    var sql = $sql.home.alob
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.get('/ranking', (req, res) => {
    var sql = $sql.home.ranking
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.get('/all', (req, res) => {
    var sql = $sql.home.all
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.get('/new', (req, res) => {
    var sql = $sql.home.new
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.get('/more', (req, res) => {
    var sql = $sql.home.more
    var parms = req.query
    console.log(parms)
    conn.query(sql, function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        console.log(result)
        res.send(result)
      }
    })
  })

  router.post('/login',(req,res) => {
    var sql = $sql.home.login
    var param =req.body;
    console.log(param);
    conn.query(sql, [param.name, param.password], function (err, result) {
        if (err) {
          console.log(err)
        }
        if (result) {
          
          res.send(result)
        }
      })
})

router.post('/coll',(req,res) => {
  var sql = $sql.home.coll
  var param =req.body;
  console.log(param);
  conn.query(sql, [param.id,param.name, param.artname], function (err, result) {
      if (err) {
        console.log(err)
      }
      if (result) {
        
        res.send(result)
      }
    })
})

router.get('/collsearch', (req, res) => {
  var sql = $sql.home.coll_search
  var parms = req.query
  console.log(parms)
  conn.query(sql, function (err, result) {
    if (err) {
      console.log(err)
    }
    if (result) {
      console.log(result)
      res.send(result)
    }
  })
})
module.exports = router


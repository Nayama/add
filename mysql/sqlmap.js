var sqlMap = {
  // home
  home: {
    search: 'select * from user',
    add: 'insert into user(name,password) values (?,?)',
    music_search:'select * from url',
    alob:'select * from album',
    ranking:'select * from mv_ranking',
    all:'select * from mv_all',
    new:'select * from mv_new',
    more:'select * from more',
    login:'select name,password from user WHERE name = ? and password =?',
    coll:'insert into coll_list(id,name,artname) values (?,?,?)',
    coll_search:'select * from coll_list'
  },
  other:{
  	delete:'', // delete sql语句
  	post: '',
  	get: ''
  }
}
module.exports = sqlMap

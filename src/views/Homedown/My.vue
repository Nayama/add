<template>
  <div>
    <van-cell-group>
      <van-cell
        v-for="(item,index) in mycollect"
        :key="index"
        :title="item.title"
        :icon="item.icon"
        is-link
        url
      ></van-cell>
    <van-cell title='我的收藏' icon='like-o' is-link @click='coll'></van-cell>
    </van-cell-group>
      <div class="login" @click="login" v-show="show">
        <van-button type="danger" style="width:100%;height:100%;">登陆</van-button>
      </div>
    </div>

</template>

<script>
import { mycollect } from "../../data/mycollect.js";
const axios = require('axios')
export default {
  name: "my",
  data() {
    return {
      mycollect: [],
      show:false
    };
  },
  created() {
    this.mycollect = mycollect;
    var sta = localStorage.getItem('sta');
    console.log(sta);
    if(sta == 1){
      this.show = false
    }else{
      this.show = true
    }
  },
  methods: {
    login() {
      axios.defaults.baseURL = '/api';
      axios.get('/home/getlist',{
      }).then((response) => {console.log(response);
      console.log(response.data[0]);
      });
      this.$router.push("login");

      // var mysqls = require('mysql');

      // var connection = mysqls.createConnection({
      //   host:'localhost',
      //   user:'root',
      //   password:'011237',
      //   database:'music',
      //   port:'3306'
      // });
      // var values = [
      //   ['13531658838','011237','NULL'],
      //   ['15976735955','012356','NULL'],
      // ];
      // var sqls = 'INSERT INTO user(`name`,`password`,`url`) VALUES ?';
      // connection.query(sqls,[values],function(err, rows, fields){
      //    if(err){
      //           console.log('INSERT ERROR - ', err.message);
      //           return;
      //       }
      //       console.log("INSERT SUCCESS");
      // })

    },
    coll(){
      var sta = localStorage.getItem('sta');
      if(sta == 1){ 
      console.log('meiyou')
      this.$router.push('coll')
      }else{
        this.$toast({                          
            forbidClick: true,
            message: '你还没有登录'
            })
      }
    }
  }
};
</script>

<style lang="less" scoped>
.login {
  width: 4rem;
  height: 3rem;
  margin: 7rem auto;
}
</style>
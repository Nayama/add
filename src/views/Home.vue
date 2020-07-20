<template>
  <div class="home">
      <!-- <van-tabs >
        <van-tab v-for='(item,index) in upside' :key='index' :title='item.title'>{{item.title}}</van-tab>
      </van-tabs> -->
      <!-- <van-tabs>
        <van-tab title='1'></van-tab>
      </van-tabs> -->
      
        
          <!-- <div v-for='(item,index) in upside' :key='index' :class=clas>
            <router-link :to='item.type' >{{item.title}}</router-link>
          </div> -->
      
      <!-- <router-link to='/my'>My</router-link> |
      <router-link to='/find'>find</router-link> |
      <router-link to='/mv'>mv</router-link> |
      <router-link to='/video'>video</router-link> -->

      <van-row gutter='1' class='row'>
        <van-col span='4'>
          <div class='icon'> 
            <van-icon name='apps-o' color='#fff' size='1.4rem' @click='showpopup'/>
          </div>
        </van-col>
        <van-col span='16'>
          <van-row gutter='2'>
            <van-col v-for='(item,index) in upside' :key='index' span='6' class='col'>
                <router-link :to='item.type'>{{item.title}}</router-link>
            </van-col>
          </van-row>
          
        </van-col>
        <van-col span='4'>
          <div class='search' @click='search'>
            <van-icon name="search" color='#fff' size='1.4rem' />
          </div>
        </van-col>
      </van-row>
      <van-popup v-model='show' position='left' :style="{width:'80%',height:'100%'}" >
        <div class='up'>
          <div class='img'>
            <img src=''>
          </div>
          <div class='login' @click='logins'>
            {{logtext}}
          </div>
        </div>
        <div class='side'>
          <van-cell-group style='background-color:transparent'>
            <van-cell v-for='(item,index) in login' :key='index' :title='item.title' :icon='item.icon' style='background-color:transparent;color:#fff'/>
          </van-cell-group>
          <van-cell title='创作者中心' icon=' iconfont games-chuangzaoli' size='large' style='background-color:transparent;color:#fff'/>
          <van-cell-group style='background-color:transparent'>
            <van-cell v-for='(item,index) in creation' :key='index' :title='item.title' :icon='item.icon' style='background-color:transparent;color:#fff'/>
          </van-cell-group>
        </div>
        <div class='down'>
          <van-row>
            <van-col span='8'>
              <van-cell title='夜间' icon=' iconfont games-yejian' style='background-color:transparent;color:#fff'/>
            </van-col>
            <van-col span='8'>
              <van-cell title='设置' icon='setting-o' style='background-color:transparent;color:#fff'/>
            </van-col>
            <van-col span='8' @click='exit'>
              <van-cell title='退出' icon=' iconfont games-tuichu' style='background-color:transparent;color:#fff'/>
            </van-col>
          </van-row>
        </div>
        <div class='back'></div>
      </van-popup>
      <router-view/>
  </div>
</template>
<script>
  import {upside} from '../data/upside.js'
  import { login } from '../data/login.js'
  import { creation } from '../data/login.js'

export default {
  name: 'home',
  data(){
    return{
      active:0,
      upside:[],
      clas:'clas',
      show:false,
      opt:false,
      login:[],
      creation:[],
      logtext:'登录'
    }
  },
  created(){
    this.upside = upside;
    this.login = login;
    this.creation = creation;
    var sta = localStorage.getItem('sta');
    var phone = localStorage.getItem('phone');
    console.log(phone);
    if(sta == 1){
      this.logtext = phone;
    }
  },
  methods:{
    showpopup(){
      this.show = true;
    },
    logins(){
      // console.log('登陆');
      this.$router.push('login');
    },
    search(){
      this.$router.push('search')
    },
    exit(){
      localStorage.removeItem('sta');
      localStorage.removeItem('phone');
      location.reload();
    }
  }
}
</script>
<style scoped lang='less'>
  .home{
    height:100%;
  }
  .row{
    background-Color:#000;
    position:sticky;
    top:0;
  }
 .col{
   height:3rem;
   line-height:3rem;
    text-align:center;
    color:#fff;
  }
  .col{
    >a{
      color:#fff;
    }
  }
  .icon,.search{
    width:1.4rem;
    height:1.4rem;
    position:relative;
    left:0;
    top:0;
    right:0;
    bottom:0;
    margin:.8rem auto;
  }
  
  .up{
    width:100%;
    height:3rem;
    padding:1rem 0;
    font-size:1rem;
    text-align:center;
    line-height:3rem;
    color:#fff;
    >div{
      float:left;
    }
  }
  .img{
    width:3rem;
    height:3rem;
    border-radius:1.5rem;
    overflow: hidden;
    background-Color:#fff;
    margin-left:1rem;
    margin-right:1rem;
  }
  .side{
    height:calc(~'100% - 5rem - 3rem');
    overflow-y: auto;
  }
  .down{
    height:3rem;
    position:sticky;
    bottom: 0;
    left:0;
  }
  .back{
    width:100%;
    height:100%;
    background-image: url('../imgs/图 1669.jpeg');
    background-size:cover;
    position:absolute;
    top:0;
    left:0;
    filter:blur(1px);
    z-index: -1; 
  }
</style>
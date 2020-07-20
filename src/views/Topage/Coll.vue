<template>
    <div class='box'>
        <van-nav-bar title='收藏' left-text='返回' left-arrow @click-left="onClickLeft()" fixed style='height:3rem' class='nav-bar'/>
        <div class='kog'></div>
        <div class='list'>
          <van-cell-group>
            <van-cell v-for="(item,index) in res"
            :key="index"
            :title="item.name" :label="item.artname" />
          </van-cell-group>
        </div>
    </div>
</template>

<script>
const axios = require('axios')
    export default {
        data(){
            return{
                res:[]
            }
        },
        created(){
            axios.defaults.baseURL = '/api';
            this.show = true
            axios.get('/home/collsearch',{
                // limit:30
           })
            .then(result =>{
                console.log(result);
                this.res = result.data;
                this.show = false
            })
            
        },
        methods:{
            onClickLeft(){
                // console.log('点击');
                this.$router.push('find');
            },    
        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:calc(~'100% - 3rem');
        position:relative;
    }
    .kog{
      height:3rem;
    }
    
    // .name{
    //     font-size:.5rem;
    //     text-overflow: -o-ellipsis-lastline;
    //     overflow: hidden;
    //     text-overflow: ellipsis;
    //     display: -webkit-box;
    //     -webkit-line-clamp: 2;
    //     -webkit-box-orient: vertical;
    // }
    // .loading{
    //     position:absolute;
    //     top:50%;
    //     left:50%;
    //     transform: translate(-50%, -50%);
    // }
    // .row{
    //     height:100%;
    //     overflow-y: auto;
    // }
</style>
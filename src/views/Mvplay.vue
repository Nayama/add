<template>
    <div class='box'>
        <div class='back'></div>
        <van-nav-bar
            title="MV"
            left-text="返回"
            left-arrow
            @click-left="onClickLeft"
            class='nav-bar'
        />
        <div class='title'>
            <div class='tag'>
                <van-tag type='danger' class='van-tag'>MV</van-tag>
            </div>
            <span>{{title}}</span>
        </div>
        <div class='time'>
            <div>
                发布时间 ： {{result.publishTime}}
            </div>
            <div>
                时长 : {{time}}
            </div>
        </div>
        <div class='video'>
            <video :src='url' controls autoplay width='100%' height='100%'/>
        </div>
        <div class='content'>
            
            <div class='select'>
                <div class='pic' style="width:15%;text-decoration:none">画面 : </div>
                <div v-for='(item,index) in mv' :key='index' class='pix'>
                    <button @click='pix(item)'>{{item.text}}</button>
                </div>
            </div>
            <div class='bewrite'>
                描述 ： {{result.desc}}
            </div>
            
        </div>
    </div>
</template>

<script>
const axios = require('axios')
import { mv } from '../data/mv'
    export default {
        name:'mvplay',
        data(){
            return{
                url:this.$route.params.url,
                title:this.$route.params.title,
                id:this.$route.params.id,
                result:'',
                time:'',
                mv:'',
            }
        },
        created(){
            this.mv = mv;
            // console.log(this.mv)
            if(this.id == undefined){
                let ids = localStorage.getItem('data');
                ids = JSON.parse(ids)
                // console.log(ids.id)
                this.id = ids.id;
                this.title = ids.name;

                let dataUrl = localStorage.getItem('dataUrl');
                dataUrl = JSON.parse(dataUrl);
                this.url = dataUrl;
            }
            axios.get('http://www.arthurdon.top:3000/mv/detail',{
            params:{
                mvid:this.id
            }
            })
            .then(result =>{
                // console.log(result);
                this.result = result.data.data;
                let s = parseInt(this.result.duration/1000);
                let second = parseInt(s%60);
                let minute = parseInt(s/60);

                if(second<10){
                    second = '0'+ second;
                }
                if(minute<10){
                    minute = '0'+ minute;
                }
                this.time = minute + ':' +second;
                // console.log(this.time);
            })
        },
        methods:{
            onClickLeft(){
                this.$router.push('mv')
            },
            pix(item){
                // console.log(item)
                // console.log(this.result.brs[item.data])
                this.url = this.result.brs[item.data]
            }
        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:100%;
        position:relative;
    }
    .back{
        width:100%;
        height:100%;
        position:absolute;
        top:0;
        left:0;
        background-image:url('../imgs/图 1669.jpeg');
        background-size:cover;
        z-index:-1;
        filter: blur(2px); 
        }
    .nav-bar{
        background-color:#000;
        >div{
            color:#fff;
            >span{
                color:#fff;
            }
            >i{
                color:#fff;
            }
        }
    }
    .video{
        width:100%;
        height:13.25rem;
    }
    .content{
        height:calc(~'100% - 13.25rem - 3rem');
        overflow-y: auto;
    }
    .title{
        padding: .5rem 1rem;
        overflow: hidden;
        >.tag{
            float:left;
        }
        >span{
            color:#fff;
            font-size:1.2rem;
            font-weight: 500;
            margin-left:2.5rem;
            text-overflow: -o-ellipsis-lastline;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
    }
    .time{
        color:#fff;
        font-size:.8rem;
        padding:.5rem 0;
        overflow: hidden;
        >div{
            float:left;
            margin: 0 1rem;
        }
    }
    .select{
        overflow: hidden;
        >.pix{
            float:left;
            line-height:2rem;
            text-decoration: underline;
            margin: 0 .5rem;
            >button{
                text-align: center;
                color:#fff;
                background-Color:transparent;
                line-height:1rem;
                font-size:.8rem;
                border:1px #fff solid;
            }
        }
        >.pic{
            width:10%;
            float:left;
            color:#fff;
            line-height:2rem;
            text-align: center;
            text-decoration: underline;
            margin: 0 .5rem;
        }
    }
    


    .bewrite{
        padding: 0 1rem;
        color:#fff;
        font-size:.8rem;
        text-overflow: -o-ellipsis-lastline;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }
</style>
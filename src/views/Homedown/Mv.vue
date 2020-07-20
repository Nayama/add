<template>
    <div class='box'>
        <!-- <div v-for='(item,index) in this.result' :key='index' class='mv'>
            <div class='img'>
                <img :src='item.cover'/>
            </div>
            <span>{{item.name}}</span>
        </div> -->
        <van-tabs >
            <van-tab v-for="(item,index) in this.mv" :key='index' :title="item.title">
                <div v-for="(items,indexs) in item.datas" :key='indexs' class='mv'>
                    <div class='name'>
                        <span>{{items.name}}</span>
                    </div>
                    <div class='tip'>
                        <Span>{{items.briefDesc}} ( by {{items.artistName}} )</span>
                    </div>
                    <div class='img'>
                        <img :src='items.cover'/>
                    </div>
                    <div class='btn' @click = 'onclick(items)'>
                        <button>
                            <van-icon name='play-circle-o' />
                            <span>播放</span>
                        </button>
                    </div>
                </div>
            </van-tab>
            <!-- <van-tab title="排行榜">
                <div v-for="(item,index) in this.ranking" :key='index' class='mv'>
                    <div class='img'>
                        <img :src='item.cover'/>
                    </div>
                    <span>{{item.name}}</span>
                </div>
            </van-tab>
            <van-tab title="全部">
                <div v-for="(item,index) in this.all" :key='index' class='mv'>
                    <div class='img'>
                        <img :src='item.cover'/>
                    </div>
                    <span>{{item.name}}</span>
                </div>
            </van-tab> -->
        </van-tabs>
        <van-loading type='spinner' color='#1989fa' class='loading' v-show="show"/>
    </div>
</template>

<script>
import { mvs } from '../../data/mvlist.js'
const axios = require('axios')
    export default {
        name:'mv',
        data(){
            return{
                mv:[],
                all:'',
                alllimit:30,
                newlimit:30,
                news:'',
                ranking:'',
                rankinglimit:30,
                show:false,
                url:'',
            }
        },
        created(){
            this.show = true
            this.mv = mvs;
            axios.defaults.baseURL = '/api';
            // console.log(mvs)
            // console.log(this.mv)
            axios.get('/home/all',{
                // params:{
                //     limit:this.alllimit
                // }
            })
            .then(result =>{
                
                this.all = result.data;
                this.mv[2]['datas'] = this.all
                // console.log(this.all);
                this.show = false
            })

            axios.get('/home/ranking',{
                // params:{
                //     limit:this.rankinglimit
                // }
            })
            .then(result =>{
                // console.log(result);
                this.ranking = result.data
                this.mv[1]['datas'] = this.ranking
                this.show = false
            })

            axios.get('/home/new',{
                // params:{
                //     limit:this.newlimit
                // }
            })
            .then(result =>{
                // console.log(result);
                this.news = result.data;
                this.mv[0]['datas'] = this.news
                this.show = false
            })
        },
        methods:{
            onclick(items){
                // console.log('视频')
                let mv = items.id
                axios.get('http://www.arthurdon.top:3000/mv/url',{
                    params:{
                        id:mv
                    }
                })
                .then(result =>{
                    // console.log(result)
                    this.url = result.data.data.url
                    let data = items;
                    data = JSON.stringify(data);
                    localStorage.setItem('data',data);
                    let dataUrl = this.url;
                    dataUrl = JSON.stringify(dataUrl);
                    localStorage.setItem('dataUrl',dataUrl)
                    // console.log(this.url)
                    this.$router.push({
                        name:'mvplay',
                        params:{
                            url:this.url,
                            title:items.name,
                            id:items.id
                    }
                })
                })
                // console.log(items);       
                }
        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:calc(~'100% - 3rem');
        overflow-y: auto;
        position: relative;
    }
    .mv{
        overflow: hidden;
        text-align: center;
        border-bottom:.01rem solid rgb(196, 196, 196);
        margin:1rem 0;
        position: relative;
    }
    .img{
        width:80%;
        margin: .5rem auto;
        >img{
            width:100%;
        }
    }
    .loading{
        position: absolute;
        left:50%;
        top:50%;
        transform: translate(-50%, -50%);
    }
    .name{
        width:80%;
        text-align: left;
        >span{
            display:block;
            width:80%;
            margin-left:2rem;
            font-size:1.2rem;
            font-weight: 600;
            text-overflow: -o-ellipsis-lastline;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
    }
    .tip{
        width:80%;
        text-align:left;
        >span{
            display: block;
            width:80%;
            margin-left:2rem;
            font-size:.6rem;
            color:rgb(100, 100, 100);
            text-overflow: -o-ellipsis-lastline;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
    }
    .btn{
        overflow: hidden;
        position: absolute;
        right:0;
        top:0;
        margin-right:2rem;
        >button{
            display: block;
            line-height: 2rem;
            border: none;
            float:right;
            margin-right:.5rem;
            background-color:rgba(99, 115, 185, 0.904);
            color:#fff;
            font-size:.8rem;
            >span{
                padding: 0 .2rem;
            }
        }
    }
</style>
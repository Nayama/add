<template>
    <div class='box'>
        <audio ref="audio" :src='url' autoplay/>
        <div class='input'>
            <div class='inp'>
                <input type='text' v-model='name' placeholder="请输入关键词">
            </div>
            <div class='btn'>
                <button @click='onclick(name)'>搜索</button>
            </div>
        </div>
        <div class='back'></div>
        <div class='list'>
            <van-cell-group style="background-Color:transparent">
                <van-cell v-for='(item,index) in this.result' :key='index' :title="item.name"  :label="item.artists[0].name" style="background-Color:transparent;color:#fff" @click='play(item)'>
                    <van-icon :name='item.icons'  slot='right-icon' style='line-height:inherit;' size='1.4rem'/>
                </van-cell>
            </van-cell-group>
        </div>
        <div class='loading' v-show='show'>
            <van-loading type="spinner" color="#1989fa" />
        </div>
    </div>
</template>

<script>
const axios = require('axios')
    export default {
        name:'seaarch',
        data(){
            return{
                name:'',
                result:'',
                namearr:'',
                show:false,
                url:''
            }
        },
        methods:{
            onclick(name){
                if(this.name == ''){
                    return;
                }
                // console.log(name);
                this.result = [];
                this.show = true;
                axios.get('http://www.arthurdon.top:3000/search',{
                    params:{
                        keywords:name,
                    }
                })
                .then(result => {
                    this.show = false;
                    // console.log(result);
                    this.result = result.data.result.songs;
                    let icons = 'play-circle-o';
                    for(let i=0;i<this.result.length;i++){
                        this.result[i]['icons'] = icons;
                    }
                })

                this.name = '';
            },
            play(item){
                // console.log('播放');
                // console.log(item);
                let id = item.id;
                axios.get('http://www.arthurdon.top:3000/song/url',{
                    params:{
                        id:id
                    }
                })
                .then(result =>{
                    // console.log('result ==>',result)
                    this.url = result.data.data[0].url;
                    // console.log(this.url)
                    // console.log(this.$refs.audio.paused)
                    if(this.$refs.audio.paused == true){
                        this.$refs.audio.play();
                        item.icons = 'pause-circle-o'
                    }else{
                        this.$refs.audio.pause();
                        item.icons = 'play-circle-o'
                    }
                })
            }
        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:calc(~'100% - 3rem');
        width:100%;
        overflow: hidden;
        position: relative;
    }
    .loading{
        position: absolute;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
    }
    .back{
        width:100%;
        height:100%;
        background-image:url('../../imgs/图 1669.jpeg');
        background-size:cover;
        position:absolute;
        left:0;
        top:0;
        z-index:-1;
        filter: blur(2px);
    }
    .input{
        width:80%;
        height:2rem;
        border:1px solid rgb(255, 255, 255);
        border-radius:2rem;
        overflow: hidden;
        margin:.5rem auto;
        >div{
            float:left;
        }
    }
    .inp{
        width:80%;
        height:100%;
        >input{
            width:100%;
            height:100%;
            border:none;
            padding:0;
            padding-left:1rem;
            color:#fff;
            font-size:.8rem;
            background:transparent;
        }
    }
    .btn{
        width:20%;
        height:100%;
        >button{
            width:100%;
            height:100%;
            padding:0;
            margin:0;
            border:none;
            color:#fff;
            font-size:.8rem;
            background:transparent;
        }
    }
    .list{
        width:100%;
        height:calc(~'100% - 3rem - 2px');
        background:transparent;
        overflow-y: auto;
        
    }
</style>
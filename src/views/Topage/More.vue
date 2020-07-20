<template>
    <div class='box'>
        <van-nav-bar title='更多' left-text='返回' left-arrow @click-left="onClickLeft()" fixed style='height:3rem' class='nav-bar'/>
        
        <van-grid :border="false" :column-num="3" :gutter='12'  class='onlist'>
                <van-grid-item v-for='(item,index) in result' :key='index' @click='onclick(index)' >
                    <van-image :src="item.picurl" />
                    <p class='name'>{{item.name}}</p>
                </van-grid-item>
            </van-grid>
        <van-loading type="spinner"  v-show='show' class='loading' color='#1989fa'/>
        
    </div>
</template>

<script>
const axios = require('axios')
    export default {
        data(){
            return{
                result:[],
                show:false,
                arr:[]
            }
        },
        created(){
            axios.defaults.baseURL = '/api';
            this.show = true
            axios.get('/home/more',{
                // limit:30
           })
            .then(result =>{
                console.log(result);
                this.result = result.data;
                this.show = false
            })
            
        },
        methods:{
            onClickLeft(){
                // console.log('点击');
                this.$router.push('find');
            },
             onclick(index){
                this.arr = this.result[index];
                // console.log(this.arr);
                this.$router.push({
                    name:'detal',
                    params:{
                        arr:this.arr
                    }
                });
            }       
        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:calc(~'100% - 3rem');
        position:relative;
    }
    .name{
        font-size:.5rem;
        text-overflow: -o-ellipsis-lastline;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .loading{
        position:absolute;
        top:50%;
        left:50%;
        transform: translate(-50%, -50%);
    }
    .row{
        height:100%;
        overflow-y: auto;
    }
</style>
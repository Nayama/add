<template>
    <div class='box'>
        <van-nav-bar
            title="注册"
            left-text="返回"
            left-arrow
            @click-left="onClickLeft"
            class='nav-bar'
        />

        <div class='login'>
            <div class='back'>
            </div>
            <div class='img'>
                <img src=''/>
            </div>
            <div class='user'>
                 <van-row style="line-height:3rem;border-bottom:.05rem solid #fff">
                     <van-col span='6' style="text-align:center;color:#fff">手机号码 : </van-col>
                     <van-col span='16'>
                         <input type='text' class='input'  v-model="arr" placeholder='请输入手机号码' @input='input(arr)'  maxlength='11'/>
                     </van-col>
                     <van-col span='2'>
                         <van-icon :name='icons' color='#fff' @click='check(arr)'/>
                     </van-col>
                 </van-row>
                 <div class='acctop' v-show='acctop'>
                     请输入正确的手机号码
                 </div>
            </div>
            <div class='password'>
                 <van-row style="line-height:3rem;border-bottom:.05rem solid #fff">
                     <van-col span='6' style="text-align:center;color:#fff">密 码 : </van-col>
                     <van-col span='16'>
                         <input :type='text' class='input' v-model="ary" placeholder='请输入密码(最大为12位)' @input='oninput(ary)' maxlength='12'/>
                     </van-col>
                     <van-col span='2'>
                         <van-icon :name='passicon' color='#fff' @click='eye(ary)'/>
                     </van-col>
                 </van-row>
                 <div class='passtop' v-show='passtop'>
                     请输入正确的密码格式
                 </div>
            </div>
            <div class='verif'>
                <van-row style="line-height:3rem;border-bottom:.05rem solid #fff;height:3rem">
                    <van-col span='6' style="text-align:center;color:#fff">验证码 : </van-col>
                    <van-col span='10'>
                        <input type='text' class='input' v-model="verfs" placeholder='请输入验证码' @input='verf(verfs)' maxlength="4"/>
                    </van-col>
                    <van-col span='8'>
                        <div class='verfbtn'>
                            <button @click='verfbtn' :disabled='isable'>{{verfes}}</button>
                        </div>
                    </van-col>
                </van-row>
                <div class='verftop' v-show='verftop'>
                     验证码错误
                 </div>
            </div>
            <div class='regi'>
                <div class='center'>
                    已有账号？
                    <router-link to='login' style="color:#fff;font-size:.8rem;text-decoration:underline">登陆</router-link>
                </div>
            </div>
            <div class='btn'>
                <van-button :loading='isloading' loading-text='注册中' @click='btn(arr,ary,verfs)'>注册</van-button>
            </div>
        </div>
    </div>
</template>

<script>
const axios = require('axios')
    export default {
        name:'login',
        data(){
            return{
                icons:'question-o',
                passicon:'eye-o',
                text:'password',
                arr:'',
                ary:'',
                isloading:false,
                passtop:false,
                acctop:false,
                verftop:false,
                verfs:'',
                verfes:'获取验证码',
                nums:'',
                jsonp:[],
                isable:false,
                time:''
            }
        },
        methods:{
            onClickLeft(){
                this.$router.push('login');
            },
            eye(ary){
                if(this.passicon == 'closed-eye'){
                    this.passicon = 'eye-o'
                    this.text = 'password'
                }else{
                    this.passicon = 'closed-eye'
                    this.text = 'text'
                }
                // console.log(ary)

            },
            check(arr){
                // console.log(arr)
            },
            btn(arr,ary,verfs){
                // console.log(arr,ary);
                if(arr == ''&&ary == ''&& verfs == ''){
                    const toast = this.$toast({
                        icon:'warning-o',
                        duration: 0, // 持续展示 toast
                        forbidClick: true,
                        message: '手机号码,密码和验证码不能为空'
                    });
                    let second = 3;
                    const timer = setInterval(() => {
                        second--;
                        if (!second) {
                            clearInterval(timer);
                            // 手动清除 Toast
                            this.$toast.clear();
                        }
                    }, 1000);
                    }else if(arr == ''){
                        const toast = this.$toast({
                            icon:'warning-o',
                            duration: 0, // 持续展示 toast
                            forbidClick: true,
                            message: '手机号码不能为空'
                        });
                        let second = 3;
                        const timer = setInterval(() => {
                            second--;
                            if (!second) {
                                clearInterval(timer);
                                // 手动清除 Toast
                                this.$toast.clear();
                            }
                        }, 1000);
                    }else if(ary == ''){
                        const toast = this.$toast({
                            icon:'warning-o',
                            duration: 0, // 持续展示 toast
                            forbidClick: true,
                            message: '密码不能为空'
                        });
                        let second = 3;
                        const timer = setInterval(() => {
                            second--;
                            if (!second) {
                                clearInterval(timer);
                                // 手动清除 Toast
                                this.$toast.clear();
                            }
                        }, 1000);
                    }else if(verfs == ''){
                        const toast = this.$toast({
                            icon:'warning-o',
                            duration: 0, // 持续展示 toast
                            forbidClick: true,
                            message: '验证码不能为空'
                        });
                        let second = 3;
                        const timer = setInterval(() => {
                            second--;
                            if (!second) {
                                clearInterval(timer);
                                // 手动清除 Toast
                                this.$toast.clear();
                            }
                        }, 1000);
                    }else{
                        if(this.passtop == true ||this.acctop == true){
                            this.$toast('账号或密码格式错误')
                            return ;
                        }
                        if(this.verftop == true){
                            this.$toast('验证码格式错误')
                            return;
                        }
                        if(this.verfs !== this.nums){
                            this.$toast('验证码错误')
                            return;
                        }


                        this.isloading = true;
                        let second = 3;
                         let timer = setInterval(() => {
                            second--;
                            if (!second) {
                                clearInterval(timer);
                                this.$toast.clear();
                                this.isloading = false ;
                                this.$toast({
                                    icon:'passed',
                                    forbidClick: true,
                                    message: '注册成功',
                                })
                                console.log(this.arr,this.ary);
                                axios.defaults.baseURL = '/api';
                                axios.post('/home/add',{
                                        name:this.arr,
                                        password:this.ary
                                    }).then((response) => {console.log(response);
                                    }); 
                                this.arr = '';
                                this.ary = '';
                                this.verfs = '';
                                clearInterval(this.time);
                                this.isable = false;
                                this.verfes = '获取验证码'
                            }
                        }, 1000);
                            
                            // axios.post('/home/add',{
                            //     name:''
                            //     }).then((response) => {console.log(response);
                            //     console.log(response.data[0]);
                            //     });  
                        // let json={
                        //     arr:arr,
                        //     ary:ary
                        // };
                        // let arl = localStorage.getItem('id');
                        // arl = JSON.parse(arl);
                        // for(let i=0;i<arl.length;i++){
                        //     // console.log(arl[i]);
                        // }
                        // this.jsonp.push(json);
                        // // console.log(json);
                        // let jsonp = JSON.stringify(this.jsonp);
                        // localStorage.setItem('id',jsonp)
                    }
                      
            },
            input(arr){
                // console.log(arr)
                this.acctop = true;
                let reg = /^1[358]\d{9}$/;
                if(reg.test(arr) == true){
                    // console.log('arr')
                    this.acctop = false
                }
                if(arr == ''){
                    this.acctop = false
                }
            },
            oninput(ary){
                // console.log(ary)
                this.passtop = true;
                let reg = /^\w{5,12}/;
                if(reg.test(ary) == true){
                    // console.log('ary')
                    this.passtop = false
                }
                if(ary == ''){
                    this.passtop = false
                }
            },
            verf(verfs){
                // console.log(verfs);
                this.verftop = true;
                let reg = /\d{4}$/;
                if(reg.test(verfs) == true){
                    this.verftop = false;
                };
                if(verfs == ''){
                    this.verftop = false;
                }
            },
            verfbtn(){

                this.isable = true
                let second = 60;
                this.time = setInterval(() => {
                    this.verfes = second;
                    second--;
                    if(second<1){
                        clearInterval(this.time);
                        this.verfes = '获取验证码';
                        this.isable = false;
                    }
                },1000)
                let nums = '';
                for(let i = 0;i<4;i++){
                    let num=parseInt(Math.random()*9);
                    num = String(num);
                    nums = nums + num;
                }
                this.nums = nums;
                console.log(this.nums);
                // if(this.verfs == ''){
                //         clearInterval(time);
                //         this.isable = false;
                //         this.verfes = '获取验证码'
                //     }
            }

        }
    }
</script>

<style lang="less" scoped>
    .box{
        height:100%;
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
    .login{
        height:calc(~'100% - 46px');
        position:relative;
        overflow: hidden;
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
    .img{
        width:5rem;
        height:5rem;
        border-radius:5rem;
        // float:left;
        margin:4rem auto 0;
        background:#fff;
        box-shadow:0px 0px 3px 5px rgba(161, 155, 155, 0.671);
    }
    .user{
        width:80%;
        height:4.5rem;
        margin:.3rem auto;
        >.acctop{
            height:1rem;
            width:80%;
            margin:.5rem auto;
            line-height:1rem;
            text-align:center;
            color:rgb(255, 77, 77);
            font-size:.8rem;
        }
    }
    .input{
        border:0;
        padding:0;
        background-Color:transparent;
        color:#Fff;
        padding-left:.5rem;
    }
    .password{
        width:80%;
        height:4.5rem;
        margin:.3rem auto;
        >.passtop{
            height:1rem;
            width:80%;
            margin:.5rem auto;
            line-height:1rem;
            text-align:center;
            color:rgb(255, 77, 77);
            font-size:.8rem;
        }
    }
    .regi{
        width:100%;
        margin:.3rem 0;
        overflow: hidden;
        >.center{
            color:rgb(139, 132, 132);
            float:right;
            margin-right:2.5rem;
            
        }
    }
    .btn{
        width:60%;
        height:3rem;
        line-height: 3rem;
        margin:1rem auto;
        border-radius:3rem;
        overflow: hidden;
        >button{
            width:100%;
            padding:0;
            margin:0;
            border:0;
            background-Color:rgba(75, 102, 224, 0.76);
        }
    }
    .verif{
        width:80%;
        height:5rem;
        margin:.3rem auto;
    }
    .verfbtn{
        height:2rem;
        border-radius:.5rem;
        overflow:hidden;
        margin:.5rem 0;
        >button{
            display: block;
            height:100%;
            width:100%;
            line-height:2rem;
            border:none;
            padding:0;
            margin:0;
            background-color:rgb(58, 138, 204);
            color:#fff;
            font-size:.8rem;
        }
    }
    .verftop{
            height:1rem;
            width:80%;
            margin:.5rem auto;
            line-height:1rem;
            text-align:center;
            color:rgb(255, 77, 77);
            font-size:.8rem;
        }
</style>
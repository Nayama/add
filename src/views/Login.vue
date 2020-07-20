<template>
    <div class='box'>
        <van-nav-bar
            title="登陆"
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
            <div class='regi'>
                <div class='topassword'>
                    <router-link to='loginse' style="color:#fff;font-size:.8rem;text-decoration:underline">忘记密码</router-link>
                </div>
                <div class='tologins'>
                    没有账号？
                    <router-link to='loginse' style="color:#fff;font-size:.8rem;text-decoration:underline">立即注册</router-link>
                </div>
            </div>
            <div class='btn'>
                <van-button @click='btn(arr,ary)' :loading='isloading' loading-text='登陆中'>登陆</van-button>
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
                numa:[],
                st:'0'
            }
            
        },
        methods:{
            onClickLeft(){
                this.$router.push('find');
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
            btn(arr,ary){
                // console.log(arr,ary);
                if(arr == ''&ary == ''){
                const toast = this.$toast({
                    icon:'warning-o',
                    duration: 0, // 持续展示 toast
                    forbidClick: true,
                    message: '手机号码和密码不能为空'
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
                }else{
                    this.isloading = true;
                    // let second = 3;
                    //     const timer = setInterval(() => {
                    //     second--;
                    //     if (!second) {
                    //         clearInterval(timer);
                    //         this.$toast.clear();
                    //         this.isloading = false ;
                    //     }
                    // }, 1000);
                };
                let phone = arr;
                let password = ary;
                if(phone == ''|| password == ''){
                    return;
                }
                // console.log(phone,password)
                axios.defaults.baseURL = '/api';
                axios.get('/home/getlist',{
                    // params:{
                    //     name:phone,
                    //     password:password
                    // }
                })
                .then(result =>{
                    console.log(result);
                    console.log(phone,password);
                    
                     var inq = new Array();
                     var pas = new Array();
                     for(var i=0;i<result.data.length;i++){
                         var pas = new Array();
                         pas.name = result.data[i].name;
                         pas.password = result.data[i].password;
                         inq.push(pas);
                     }
                     
                     for(var i = 0;i<inq.length;i++){
                         if(inq[i].name == phone){
                             console.log('匹配')
                         }
                         if(inq[i].password == password){
                             console.log('密码匹配')
                             this.$toast.clear();
                             this.isloading = false ;
                             this.$toast({
                                        icon:'passed',
                                        forbidClick: true,
                                        message: '登陆成功'
                                    })
                                    this.st = 1;
                                    var st = this.st;
                                    localStorage.setItem('sta','1');
                                    localStorage.setItem('phone',phone);
                                    this.$router.push({
                                        name: "my",
                                        params: {
                                        arr:st
                                        }
                                    });
                                    console.log(st);
                                    this.$router.push("my");
                                    
                         }
                         else{
                            this.$toast.clear();
                            this.isloading = false ;
                            this.$toast({
                                        icon:'passed',
                                        forbidClick: true,
                                        message: '账号密码错误'
                                    })
                                    
                         }
                     }
                     console.log("成功");
                    // clearInterval(timer);
                    this.st = 1;
                })
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
    }
    .input{
        border:0;
        padding:0;
        background-Color:transparent;
        color:#Fff;
        padding-left:.5rem;
    }
    .acctop{
         height:1rem;
        width:80%;
        margin:.5rem auto;
        line-height:1rem;
        text-align:center;
        color:rgb(255, 77, 77);
        font-size:.8rem;
    }
    .password{
        width:80%;
        height:5rem;
        margin:.3rem auto;
        >input{
            border:0;
            padding:0;
            background-Color:transparent;
            color:#Fff;
        }
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
        >.tologins{
            color:rgb(139, 132, 132);
            float:right;
            margin-right:2.5rem;
            
        }
        >.topassword{
            color:rgb(139, 132, 132);
            float:left;
            margin-left:2.5rem;
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
</style>
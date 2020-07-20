<template>
  <div id="box">
    <audio :src="musicsrc.url" ref="audios" autoplay></audio>
    <van-nav-bar
      :title="arr.name"
      left-text="返回"
      left-arrow
      @click-left="onClickLeft()"
      fixed
      style="height:3rem"
      class="nav-bar"
    />
    <div class="loading" v-show="show">
      <van-loading type="spinner" color="#1989fa" />
    </div>

    <div class="box">
      <div class="img">
        <img :src="arr.picurl" />
        <div class="tag">
          <van-tag type="danger">歌单</van-tag>
          <div class="icon">
            <van-icon name="service-o" color="#fff" />
            <span>{{listen}}</span>
          </div>
        </div>
      </div>
      <div class="text">
        <div class="title">{{arr.name}}</div>
        <div class="tags">
          标签 :
          <van-tag
            plain
            v-for="(item,index) in tag "
            :key="index"
            style="margin:.5rem .1rem"
            color="#ff0000"
          >{{item}}</van-tag>
        </div>
        <div class="intro">
          简介 :
          {{intro}}
        </div>
      </div>
      <div class="back" :style="{backgroundImage:'url('+img+')'}"></div>
    </div>
    <div class="music">
      <div class="music-list">歌曲列表</div>
      <div class="music-detal">
        <van-cell-group style="background:transparent">
          <van-cell
            v-for="(item,index) in music"
            :key="index"
            :title="item.al.name"
            :label="item.ar[0].name"
            @click="play(item,index)"
            style="background:transparent;color:#fff"
          >
            <!-- <van-icon
              name="add-o"
              slot="right-icon"
              style="line-height:inherit;"
              size="1.4rem"
              margin-right='.1rem'
            /> -->
             <van-icon
              name="add-o"
              slot="right-icon"
              style="line-height:inherit;"
              size="1.4rem"
              @click="add(index)"
            />
            <van-icon
              :name="item.icons"
              slot="right-icon"
              style="line-height:inherit;"
              size="1.4rem"
            />
          </van-cell>
        </van-cell-group>
      </div>
    </div>
    <div class="backs"></div>
  </div>
</template>

<script>
const axios = require("axios");
export default {
  name: "detal",
  data() {
    return {
      arr: [],
      ary: this.$route.params.arr,

      detalbut: [],
      num: 0,
      playnum: 0,
      listen: 0,
      img: "",
      tag: [],
      intro: " ",
      show: false,
      music: [],
      musicsrc: {
        url: " "
      },
      lat: {}
    };
  },
  created() {
    this.show = true;
    if (this.ary !== undefined) {
      this.arr = this.ary;
      
      this.img = this.ary.picurl;
      // this.tag = this.ary.data.playlist.tags
    } else {
      let arm = localStorage.getItem("arr");
      arm = JSON.parse(arm);
      this.arr = arm;
      this.img = arm.picurl;
    }

    // console.log(this.arr)

    axios
      .get("http://www.arthurdon.top:3000/playlist/detail", {
        params: {
          id: this.arr.id
        }
      })
      .then(result => {
        this.tag = result.data.playlist.tags;
        // console.log(result);
        this.intro = result.data.playlist.description;
        this.show = false;
        this.music = result.data.playlist.tracks;

        let icons = "play-circle-o";
        for (let i = 0; i < this.music.length; i++) {
          this.music[i]["icons"] = icons;
        }
        console.log(this.music);
      });
  },
  methods: {
    onClickLeft() {
      // console.log('点击');
      this.$router.push("find");
    },
    play(item, index) {
      // console.log(item);
      let ids = item.id;
      axios
        .get("http://www.arthurdon.top:3000/song/url", {
          params: {
            id: ids
          }
        })
        .then(result => {
          console.log(result);

          // console.log(this.musicsrc.url)
          if (result.data.data[0].url == null) {
            this.musicsrc.url =
              "https://music.163.com/song/media/outer/url?id=" + ids + ".mp3";
            return;
          }
          this.musicsrc.url = result.data.data[0].url;
          console.log(this.$refs.audios.paused);

          // if (this.$refs.audios.paused == true) {
          //   // for (let i = 0; i < this.music.length; i++) {
          //   //   this.music[i].icons = "play-circle-o";
          //   // }
          //   this.music[index].icons = "pause-circle-o";
          //   this.$refs.audios.play();
          // } else {
          //   for(let i = 0;i<this.music.length;i++){
          //       this.music[i].icons = 'play-circle-o'
          //   }
          //   // this.music[index].icons = "play-circle-o";
          //   this.$refs.audios.pause();
          // }
          // console.log(item.icons)
          // console.log(this.music)
          if(this.$refs.audios.paused == false){
            for(var i=0;i < this.music.length;i++){
              this.music[i].icons = "play-circle-o";
            }
            this.$refs.audios.pause();
          }else{
            for(var i=0;i < this.music.length;i++){
              this.music[i].icons = "play-circle-o";
            }
            this.$refs.audios.play();
            this.music[index].icons = "pause-circle-o";
          }
        });
    },
    add(index){
      console.log(index);
      console.log(this.music);
      var name = this.music[index].name;
      var id = this.music[index].id;
      var artname = this.music[index].ar[0].name;
      console.log(name,id,artname);
      axios.defaults.baseURL = '/api';
       axios.post('/home/coll',{
         id:id,
         name:name,
         artname:artname
        }).then((response) => {console.log(response);
        }); 
    }
  }
};
</script>

<style lang="less" scoped>
#box {
  height: 100%;
  position: relative;
}
.box {
  overflow: hidden;
  // background-Color:rgba(0,0,0,.1rem);
  background-size: cover;
  position: relative;
}
.nav-bar {
  background-color: #000;
  > div {
    color: #fff;
    > span {
      color: #fff;
    }
    > i {
      color: #fff;
    }
  }
}
.loading {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.img {
  width: 10rem;
  height: 10rem;
  float: left;
  margin: 0.5rem;
  position: relative;
  > img {
    width: 100%;
    height: 100%;
  }
}
.tag {
  width: 100%;
  height: 1.5rem;
  background-color: rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 0;
  left: 0;
  > div {
    line-height: 1.5rem;
    float: right;
    margin-right: 0.5rem;
    > span {
      margin: 0 0.5rem;
      color: #fff;
    }
  }
}
.text {
  width: calc(~"100% - 10rem - 1rem - 1rem");
  float: left;
  padding: 1.4rem 0.5rem;
}
.back {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background-size: cover;
  z-index: -1;
  filter: blur(10px);
}
.title {
  font-size: 1rem;
  color: rgb(170, 25, 25);
}
.tags {
  color: rgb(170, 25, 25);
  font-size: 0.8rem;
}
.intro {
  color: rgb(170, 25, 25);
  font-size: 0.8rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
.music {
  height: calc(~"100% - 3rem - 11rem");
}
.music-list {
  height: 1rem;
  line-height: 1rem;
  text-align: left;
  padding: 1rem;
  background-color: rgba(218, 218, 218, 0.5);
  font-size: 0.8rem;
  color: rgb(248, 248, 248);
}
.music-detal {
  height: calc(~"100% - 2rem");
  overflow-y: auto;
  background: transparent;
}
.backs {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  background-image: url("../../imgs/图 1669.jpeg");
  background-size: cover;
  z-index: -2;
  filter: blur(2px);
}
</style>
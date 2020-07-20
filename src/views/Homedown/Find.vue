<template>
  <div class="box">
    <div class="swipe">
      <van-swipe :autoplay="3000" style="height:7.7rem">
        <van-swipe-item v-for="(image, index) in findswipe" :key="index">
          <img v-lazy="image" class="img" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="grid">
      <van-grid :gutter="5" :column-num="5" :border="false">
        <van-grid-item
          v-for="(item,value) in grid"
          :key="value"
          :icon="item.icon"
          :text="item.text"
          style="margin-bottom:.1rem;"
          @click="onlist(item)"
        />
      </van-grid>
    </div>
    <div class="music-list">
      <div class="more">
        <div class="recom">推荐歌单</div>
        <div class="arrow" @click="onmore">
          <!-- <div>
                        更多
                    </div>
          <van-icon name='arrow' size='1rem' class='icon'/>-->
          <van-cell title="更多" is-link to="more" />
        </div>
      </div>
      <van-grid :border="false" :column-num="3" :gutter="12" class="onlist">
        <van-grid-item v-for="(item,index) in result" :key="index" @click="onclick(index)">
          <van-image :src="item.picurl" />
          <p class="name">{{item.name}}</p>
        </van-grid-item>
      </van-grid>
    </div>
    <!-- <div class="play"></div> -->
    <div class="show" v-show="show">
      <van-loading type="spinner" color="#1989fa" />
    </div>
    <!-- <div class='back'></div> -->
  </div>
</template>

<script>
import { findswipe } from "../../data/findswipe";
import { grid } from "../../data/findswipe";
const axios = require("axios");

export default {
  data() {
    return {
      findswipe: [],
      grid: [],
      result: [],
      arr: [],
      show: false
    };
  },
  created() {
    this.show = true;
    this.findswipe = findswipe;
    this.grid = grid;

    // this.axios({
    //     method:'GET',
    //     url:'http://www.arthurdon.top:3000/personalized?limit=6'
    //     // data:{
    //     //     limit:30
    //     // }
    // })
    axios.defaults.baseURL = '/api';
    axios
      .get("/home/album", {
        // params: {
        //   limit: 9
        // }
      })
      .then(result => {
        console.log("result = >",result);
        this.result = result.data;
        result = JSON.stringify(result);
        localStorage.setItem("result", result);
        this.show = false;
      });
  },
  methods: {
    onmore() {
      this.$router.push("more");
    },
    onclick(index) {
      this.arr = this.result[index];
      let arm = this.arr;
      arm = JSON.stringify(arm);
      localStorage.setItem("arr", arm);
      this.$router.push({
        name: "detal",
        params: {
          arr: this.arr
        }
      });
    },
    onlist(item) {
      this.$router.push(item.to);
    }
  }
};
</script>

<style lang="less" scoped>
.box {
  height: e("calc(100% - 3rem)");
  // height:619px;

  // background: #000;
}
.swipe {
  width: 20rem;
  height: 7.7rem;
  margin: 0 auto;
  padding: 0.1rem 0;
  border-radius: 0.7rem;
  overflow: hidden;
}
.img {
  width: 100%;
  height: 100%;
}
.grid {
  margin: 0.5rem 0;
  border-bottom: 0.002rem solid #000;
}
.more {
  overflow: hidden;
}
.recom {
  float: left;
  height: 2rem;
  line-height: 2rem;
  text-align: center;
  margin-left: 1rem;
}
.icon {
  margin-top: 0.55rem;
}
.arrow {
  float: right;
  height: 2rem;
  text-align: center;
  line-height: 2rem;
  margin-right: 1rem;
  > div {
    float: left;
    padding: 0.2rem;
  }
}
.music-list {
  height: e("calc(100% - 7.7rem - .3rem - 84px - 1rem - .002rem)");
  overflow-y: auto;
}
.name {
  font-size: 0.5rem;
  text-overflow: -o-ellipsis-lastline;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
.play {
  width: 100%;
  height: 4rem;
  background-color: rgba(0, 0, 0, 0.5);
}
.show {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
// .back{
//     width:100%;
//     height:100%;
//     background-image: url('../../imgs/图 1669.jpeg');
//     background-size:cover;
//     position:absolute;
//     top:0;
//     left:0;
//     filter:blur(3px);
//     z-index: -1;
// }
</style>
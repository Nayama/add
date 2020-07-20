import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Router from 'vue-router'
// import '../src/imgs/icon.css'
import {
  Cell,
  CellGroup,
  Tab,
  Tabs,
  Row,
  Col,
  Icon,
  Popup,
  Sidebar,
  SidebarItem,
  Swipe,
  SwipeItem,
  Lazyload,
  Grid,
  GridItem,
  Image,
  NavBar,
  Loading,
  Tag,
  Button,
  Field,
  Toast,
  DropdownMenu,
  DropdownItem,
  Dialog
} from 'vant'

Vue
  .use(Cell)
  .use(CellGroup)
  .use(Tab)
  .use(Tabs)
  .use(Col)
  .use(Row)
  .use(Icon)
  .use(Popup)
  .use(Sidebar)
  .use(SidebarItem)
  .use(Swipe)
  .use(SwipeItem)
  .use(Lazyload)
  .use(Grid)
  .use(GridItem)
  .use(Image)
  .use(NavBar)
  .use(Loading)
  .use(Tag)
  .use(Button)
  .use(Field)
  .use(Toast)
  .use(DropdownItem)
  .use(DropdownMenu)
  .use(Dialog)

const originalPush = Router.prototype.push
Vue.config.productionTip = false
Vue.use(VueAxios, axios)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
Router.prototype.push = function push(location) {

  return originalPush.call(this, location).catch(err => err)

}
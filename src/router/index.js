import Vue from 'vue'
import VueRouter from 'vue-router'
import { routes } from '../router/routers'
// import { routerscomponent } from '../router/routerscomponent'

Vue.use(VueRouter)

// const routes = [
//   {

//   }
// ]
const router = new VueRouter({
  routes
})

export default router
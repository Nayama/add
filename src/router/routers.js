import { routesComponent } from '../router/routerscomponent.js'

export const routes = [
  {
    path: '/home',
    name: 'home',
    component: routesComponent.homes,
    children: [
      {
        path: '/my',
        name: 'my',
        component: routesComponent.mys
      },
      {
        path: '/find',
        name: 'find',
        component: routesComponent.finds
      },
      {
        path: '/mv',
        name: 'mv',
        component: routesComponent.mvs
      },
      {
        path: '/videos',
        name: 'videos',
        component: routesComponent.vidoes
      },
      {
        path: '/more',
        name: 'more',
        component: routesComponent.mores
      },
      {
        path: '/detal',
        name: 'detal',
        component: routesComponent.detals
      },
      {
        path: '/day',
        name: 'day',
        component: routesComponent.days
      },
      {
        path: '/tv',
        name: 'tv',
        component: routesComponent.tvs
      },
      {
        path: '/songlist',
        name: 'songlist',
        component: routesComponent.songlists
      },
      {
        path: '/radio',
        name: 'radio',
        component: routesComponent.radios
      },
      {
        path: '/ranking',
        name: 'ranking',
        component: routesComponent.rankings
      },
      {
        path: '/search',
        name: 'search',
        component: routesComponent.searchs
      }
    ],
  },
  {
    path: '/login',
    name: 'login',
    component: routesComponent.logins
  },
  {
    path: '/loginse',
    name: 'loginse',
    component: routesComponent.loginses
  },
  {
    path: '/mvplay',
    name: 'mvplay',
    component: routesComponent.mvplays
  },
  {
    path: '/coll',
    name: 'coll',
    component: routesComponent.coll
  },
  {
    path: '*',
    redirect: { name: 'find' }
  }

]
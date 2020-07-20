class roucomponent {
  constructor() {

  };
  homes() {
    return import('../views/Home.vue')
  }
  mys() {
    return import('../views/Homedown/My.vue')
  };
  finds() {
    return import('../views/Homedown/Find.vue')
  };
  mvs() {
    return import('../views/Homedown/Mv.vue')
  };
  vidoes() {
    return import('../views/Homedown/Vidoes.vue')
  };
  mores() {
    return import('../views/Topage/More.vue')
  };
  detals() {
    return import('../views/Topage/Detal.vue')
  };
  // days() {
  //   return import('../views/Topage/Day.vue')
  // };
  // songlists() {
  //   return import('../views/Topage/Songlist.vue')
  // }
  // radios() {
  //   return import('../views/Topage/Radio.vue')
  // }
  // tvs() {
  //   return import('../views/Topage/Tv.vue')
  // }
  // rankings() {
  //   return import('../views/Topage/Ranking.vue')
  // }
  logins() {
    return import('../views/Login.vue')
  }
  loginses() {
    return import('../views/Loginse.vue')
  }
  searchs() {
    return import('../views/Topage/Search.vue')
  }
  mvplays() {
    return import('../views/Mvplay.vue')
  }
  coll() {
    return import('../views/Topage/Coll.vue')
  }
}
export const routesComponent = new roucomponent();
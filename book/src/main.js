import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

var axios = require('axios')
axios.defaults.baseURL = 'http://localhost:8443/api'
Vue.prototype.$axios = axios
Vue.config.productionTip = false

Vue.use(ElementUI)

router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    if (store.state.user.username) {
      next()
    } else {
      next({
        path: 'login',
        query: {redirect: to.fullPath}
      })
    }
  } else {
    next()
  }
  /* console.log('上一个页面：', from)
  console.log('下一个页面：', to)
  let userToken = localStorage.getItem('userToken')
  let role = localStorage.getItem('role')
  if (to.meta.requireAuth) { // 1)判断该路由是否需要登录权限
    if (userToken) { // 2)判断本地是否存在token,有说明登录过
      if (to.meta.roles.length !== 0) {
        // 下一个页面的rules是否与当前token相等
        for (let i = 0; i < to.meta.roles.length; i++) {
          if (role === to.meta.roles[i]) {
            next() // 角色匹配已登录，正常进入to.meta.roles[i]的页面
            break
          } else if (i === to.meta.roles.length - 1) {
            next({path: '/login'})
          }
        }
      } else {
        next()
      }
    } else {
      next({path: '/login'})
    }
  } else {
    next()
  }*.
  /* 如果本地存在token,则不允许直接跳转到登录页面 */
  /* if (to.fullPath === '/login') {
    if (userToken) {
      next({path: from.fullPath})
    } else {
      next()
    }
  } */
}
)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App),
  router,
  store,
  components: { App },
  template: '<App/>'
})

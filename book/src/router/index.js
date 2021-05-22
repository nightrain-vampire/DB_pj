import Vue from 'vue'
import Router from 'vue-router'
import AppIndex from '../components/home/AppIndex'
import Login from '../components/Login'
import Home from '../components/Home'
import ServiceIndex from '../components/services/ServiceIndex'
import AdminIndex from '../components/admin/AdminIndex'
import borrow from '../components/services/borrow'
Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/home',
      name: 'Home',
      component: Home,
      redirect: '/index',
      children: [
        {
          path: '/index',
          name: 'AppIndex',
          component: AppIndex,
          meta: {
            requireAuth: true
          }
        },
        {
          path: '/services',
          name: 'Services',
          component: ServiceIndex,
          meta: {
            requireAuth: true
          }
        },
        {
          path: '/admin',
          name: 'Admin',
          component: AdminIndex,
          meta: {
            requireAuth: true
          }
        }
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/services',
      name: 'Services',
      component: ServiceIndex,
      redirect: '/services',
      children: [
        {
          path: '/borrow',
          name: 'borrow',
          component: borrow,
          meta: {
            requireAuth: true
          }
        }
      ]
    }
  ]
})

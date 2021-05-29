<template>
  <div>
    <el-menu
      :default-active="path"
      router
      mode="horizontal"
      background-color="#c6e2ff"
      text-color="#222"
      active-text-color="red"
      style="min-width: 1300px;">
      <el-menu-item class="text_eff" v-for="(item,i) in navList" :key="i" :index="item.name">
        {{ item.navItem }}
      </el-menu-item>
      <span style="position: absolute;padding-top: 20px;right: 43%;font-size: 20px;font-weight: bold">图书管理系统</span>
    </el-menu>
  </div>
</template>

<script>
  export default {
    name: 'NavMenu',
    data () {
      return {
        navList: [
          {name: '/jotter', navItem: '公告栏'},
          {name: '/library', navItem: '图书馆'},
          {name: '/login', navItem: '管理中心'},
          {name: '/commentBoard', navItem: '留言板'},
          {name: '/seat',navItem: '阅览室'}
        ],
        path: ''
      }
    },
    mounted: function () {
      // 获得第一级路由，以设置导航栏高亮
      var x = this.$route.path.indexOf('/', 1)
      if (x !== -1) {
        this.path = this.$route.path.substring(0, x)
      } else {
        this.path = this.$route.path
      }
    },
    computed: {
      hoverBackground () {
        return '#ffd04b'
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
  a{
    text-decoration: none;
  }
  .text_eff{
    font-size: large;
    -webkit-transition:.2s;
    transition:.2s;
  }
  .text_eff:hover{
    font-size: larger;
    font-weight: bold;
    padding: 5px;
  }

  span {
    pointer-events: none;
  }

</style>

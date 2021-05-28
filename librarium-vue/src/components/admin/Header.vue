<template>
  <el-card class="admin-header">
    <a href="/">
      <img src="../../assets/img/icon/logo.png" alt="" width="90px" style="float: left;margin-top: -10px;margin-left: -10px">
    </a>
    <span style="font-size: 32px;font-weight: bold;position:absolute;left: 100px">后台管理</span>
    <el-tooltip class="item" effect="dark" content="点击退出" placement="bottom-start">
      <el-badge is-dot class="item">
        <i class="el-icon-switch-button" @click="logout" style="font-size: 40px;float: right"></i>
      </el-badge>
    </el-tooltip>
    <el-tooltip class="item" effect="dark" content="修改密码" placement="bottom-start">
      <el-badge is-dot class="item">
        <i class="el-icon-s-tools" @click="myopen" style="font-size: 40px;float: right"></i>
      </el-badge>
    </el-tooltip>
    <el-breadcrumb class="text_eff"  separator="          ">
    <el-breadcrumb-item :to="{ path: '/jotter'}">公告栏</el-breadcrumb-item>
    <el-breadcrumb-item :to="{ path: '/library'}">图书馆</el-breadcrumb-item>
    <el-breadcrumb-item :to="{ path: '/admin/dashboard'}" replace>管理中心</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/commentBoard'}">留言板</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: ''}"></el-breadcrumb-item>
  </el-breadcrumb>
    <!--<i class="el-icon-switch-button" v-on:click="logout" style="font-size: 40px;float: right"></i>-->
  </el-card>
</template>

<script>
  import {createRouter} from '../../router'

  export default {
    name: 'Header',
    methods: {
      logout () {
        var _this = this
        this.$axios.get('/logout').then(resp => {
          if (resp && resp.data.code === 200) {
            _this.$store.commit('logout')
            _this.$router.replace('/library')
            // 清空路由，防止路由重复加载
            const newRouter = createRouter()
            _this.$router.matcher = newRouter.matcher
          }
        }).catch(failResponse => {})
      },
      myopen () {
        this.$prompt('请输入新密码', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
        }).then(({value})=>{
          const username = this.$store.state.username;
          const password = value;
          this.$axios.put(`/user/editpassword/${username}/${password}`).then(resp => {
            if(resp && resp.data.code === 200){
              this.$message({
                type: 'success',
                message: '密码修改成功'
              });
              this.logout()
            }
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '取消输入'
          })
        })
      }
    }
  }
</script>

<style scoped>
  .admin-header {
    height: 80px;
    opacity: 0.85;
    line-height: 40px;
    min-width: 900px;
  }
   .item {
     margin-top: 10px;
     margin-right: 40px;
     float: right;
     cursor: pointer;
     outline: 0;
   }
  .text_eff {
    margin-top: 10px;
    margin-left: 300px;
    font-size: large;
    -webkit-transition:.2s;
    transition:.2s;
  }
  .text_eff:hover {
    font-size: larger;
    font-weight: bold;
    padding: 5px;
  }
</style>

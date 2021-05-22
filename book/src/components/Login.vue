<template>
  <div>
  <el-form :rules="rules" ref="form" :model="loginForm" class="login-container" label-position="left"
           label-width="0px">
    <h3 class="login_title">系统登录</h3>
    <el-form-item prop="username">
      <el-input type="text" v-model="loginForm.username"
                auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" v-model="loginForm.password"
                auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item prop="role">
      <el-select v-model="loginForm.role" placeholder="请选择登录身份" style="width:100%">
        <el-option label="系统管理员" value="systemmanager"></el-option>
        <el-option label="图书管理员" value="bookmanager"></el-option>
        <el-option label="普通读者" value="reader"></el-option>
        <el-option label="游客" value="visitor"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item prop="code">
      <el-input type="text" auto-complete="false" v-model="loginForm.code" placeholder="点击图片更换验证码"></el-input>
      <img :src="captchaUrl">
      <el-checkbox v-model="checked" class="LoginRemember">记住我</el-checkbox>
    </el-form-item>
    <el-form-item style="width: 100%">
      <el-button type="primary" style="width: 100%;background: #505458;border: none" v-on:click="login">登录</el-button>
    </el-form-item>
  </el-form>
  </div>
</template>

<script>

export default {
  name: 'Login',
  data () {
    return {
      captchaUrl: '',
      loginForm: {
        username: 'admin',
        password: '123',
        role: '',
        code: ''
      },
      checked: true,
      // 校验规则
      // prop中的属性才会和校验规则对应上
      // rule前面加: 否则无法绑定
      rules: {
        username: [{required: true, message: '请输入用户名', trigger: 'blur'}],
        password: [{required: true, message: '请输入密码', trigger: 'blur'}],
        role: [{required: true, message: '请选择身份', trigger: 'blur'}],
        code: [{required: true, message: '请输入验证码', trigger: 'blur'}]
      },
      responseResult: []
    }
  },
  methods: {
    submitLogin () {
      // refs后面的表单名字是ref后面的。比如本文有ref=“form”
      this.$refs.form.validate((valid) => {
        if (valid) {
          alert('submit!')
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    login () {
      var _this = this
      console.log(this.$store.state)
      this.$axios
        .post('/login', {
          username: this.loginForm.username,
          password: this.loginForm.password,
          role: this.loginForm.role
        })
        .then(successResponse => {
          if (successResponse.data.code === 200) {
            // var data = this.loginForm
            _this.$store.commit('login', _this.loginForm)
            var path = this.$route.query.redirect
            this.$router.replace({path: path === '/' || path === undefined ? '/index' : path})
          }
        })
        .catch(failResponse => {
        })
    }
  }
}
</script>

<style>
.login-container {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
.login_title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
.LoginRemember{
  text-align: left;
  position: relative;
}
</style>

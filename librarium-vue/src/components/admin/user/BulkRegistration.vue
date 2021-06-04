<template>
  <div style="text-align: left">
    <el-button class="add-button el-icon-document-add" type="success" @click="dialogFormVisible = true">批量添加用户</el-button>
    <el-dialog
      title="添加用户"
      :visible.sync="dialogFormVisible"
      @close="clear"
      width="25%">
      <el-form ref="loginFormRef" :model="loginForm" :rules="rules" label-position="left"
               label-width="0px">
        <el-form-item prop="username">
          <el-input type="text" v-model="loginForm.username"
                    auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" v-model="loginForm.password"
                    auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="text" v-model="loginForm.name"
                    auto-complete="off" placeholder="真实姓名"></el-input>
        </el-form-item>
        <el-form-item prop="phone">
          <el-input type="text" v-model="loginForm.phone"
                    auto-complete="off" placeholder="电话号码"></el-input>
        </el-form-item>
        <el-form-item prop="email">
          <el-input type="text" v-model="loginForm.email"
                    auto-complete="off" placeholder="E-Mail"></el-input>
        </el-form-item>
        <el-form-item style="width: 100%">
          <el-button type="primary" style="width: 40%;border: none; margin-left: 80px" v-on:click="register" class="el-icon-plus">添加</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
    export default {
        name: 'BulkRegistration',
      data () {
        var checkEmail = (rule, value, callback) => {
          // 验证邮箱的正则表达式
          const regEmail = /^([A-Za-z0-9_\-.])+@([A-Za-z0-9_\-.])+\.([A-Za-z]{2,4})$/
          if (regEmail.test(value)) {
            callback()
          } else {
            callback(new Error('请输入合法的邮箱'))
          }
        }
        // 验证手机号的校验规则
        var checkMobile = (rule, value, callback) => {
          // 验证手机号的正则表达式
          const regMobile = /^1[0-9]{10}$/
          if (regMobile.test(value)) {
            callback()
          } else callback(new Error('请输入合法的手机号'))
        }
        return {
          dialogFormVisible: false,
          rules: {
            username: [{required: true, message: '用户名不能为空', trigger: 'blur'}],
            password: [{required: true, message: '密码不能为空', trigger: 'blur'}],
            email: [
              {message: '请输入邮箱', trigger: 'blur'},
              {validator: checkEmail, trigger: 'blur'}
            ],
            phone: [
              {message: '请输入手机号', trigger: 'blur'},
              {validator: checkMobile, trigger: 'blur'}
            ]
          },
          loginForm: {
            username: '',
            password: '',
            name: '',
            phone: '',
            email: ''
          }
        }
      },
      methods: {
        clear () {
          this.loginForm = {
            username: '',
            password: '',
            name: '',
            phone: '',
            email: ''
          }
        },
        register () {
          var _this = this
          this.$refs.loginFormRef.validate(async valid=>{
            if(!valid)
              return;
            this.$axios
              .post('/register', {
                username: this.loginForm.username,
                password: this.loginForm.password,
                name: this.loginForm.name,
                phone: this.loginForm.phone,
                email: this.loginForm.email
              })
              .then(resp => {
                if (resp.data.code === 200) {
                  this.$alert('注册成功', '提示', {
                    confirmButtonText: '确定'
                  })
                  this.clear()
                  this.$emit('onSubmit')
                } else {
                  this.$alert(resp.data.message, '提示', {
                    confirmButtonText: '确定'
                  })
                }
              })
              .catch(failResponse => {})
          })
        }
      }
    }
</script>

<style scoped>
  .add-button {
    margin: 18px 0 0 10px;
  }
</style>

<template>
  <el-form ref="ruleForm" :model="ruleForm" label-width="80px">
    <el-form-item label="姓名">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="密码" prop="pass">
        <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
      </el-form-item>
    </el-form>
    <el-form-item label="电话">
      <el-input v-model="ruleForm.phone"></el-input>
    </el-form-item>
    <el-form-item label="邮箱">
      <el-input v-model="ruleForm.email"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit('ruleForm')">确认修改</el-button>
      <el-button @click="cancel('ruleForm')">取消</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  data () {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        if (this.ruleForm.checkPass !== '') {
          this.$refs.ruleForm.validateField('checkPass')
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.ruleForm.pass) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      ruleForm: {
        name: '',
        password: '',
        checkPass: '',
        phone: '',
        email: ''
      },
      rules: {
        password: [
          { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    onSubmit (ruleForm) {
      this.$refs[ruleForm].validate((valid) => {
        if (valid) {
          alert('修改成功!')
        } else {
          console.log('修改失败!!')
          return false
        }
      })
    },
    cancel (ruleForm) {
      this.$refs[ruleForm].resetFields()
    }
  }
}
</script>

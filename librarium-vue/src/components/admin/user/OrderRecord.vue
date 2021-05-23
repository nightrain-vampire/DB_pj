<template>
  <div>
    <!--<el-dialog
      title="修改用户信息"
      :visible.sync="dialogFormVisible">
      <el-form v-model="selectedUser" style="text-align: left" ref="dataForm">
        <el-form-item label="用户名" label-width="120px" prop="username">
          <label>{{selectedUser.username}}</label>
        </el-form-item>
        <el-form-item label="真实姓名" label-width="120px" prop="name">
          <el-input v-model="selectedUser.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" label-width="120px" prop="phone">
          <el-input v-model="selectedUser.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" label-width="120px" prop="email">
          <el-input v-model="selectedUser.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" label-width="120px" prop="password">
          <el-button type="warning"
                     @click="resetPassword(selectedUser.username)"
                     class="el-icon-check">重置密码</el-button>
        </el-form-item>
        <el-form-item label="角色分配" label-width="120px" prop="roles">
          <el-checkbox-group v-model="selectedRolesIds">
            <el-checkbox v-for="(role,i) in roles" :key="i" :label="role.id">{{role.nameZh}}</el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false" class="el-icon-close" type="warning">取 消</el-button>
        <el-button type="primary" @click="onSubmit(selectedUser)" class="el-icon-check" >确 定</el-button>
      </div>
    </el-dialog>-->
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>用户管理</el-breadcrumb-item>
        <el-breadcrumb-item>借阅记录</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <!--<bulk-registration @onSubmit="listUsers()"></bulk-registration>-->
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="borrowed.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
        stripe
        :default-sort = "{prop: 'id', order: 'ascending'}"
        style="width: 100%"
        :header-cell-style="styles"
        :cell-style="styles"
        :max-height="tableHeight">
        <el-table-column
          type="selection"
          width="45">
        </el-table-column>
        <el-table-column
          prop="id"
          label="id"
          sortable
          width="50">
        </el-table-column>
        <el-table-column
          prop="name"
          label="用户名"
          width="120">
        </el-table-column>
        <el-table-column
          prop="title"
          label="图书名称"
          width="120">
        </el-table-column>
        <el-table-column
          prop="time"
          label="借阅日期"
          sortable
          fit>
        </el-table-column>
        <el-table-column>
        <template slot="header" slot-scope="scope">
          <el-input
            v-model="search"
            size="mini"
            placeholder="输入用户名搜索"/>
        </template>
          <template slot-scope="scope">
            <el-button
              @click="returnByAdmin(scope.row)"
              type="danger"
              size="mini"
              class="el-icon-delete">
              强制归还
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div style="margin: 20px 0 20px 0;float: left">
        <el-button type="warning"  class="el-icon-close">取消选择</el-button>
        <el-button type="danger"  class="el-icon-delete">批量删除</el-button>
      </div>
    </el-card>
  </div>
</template>

<script>
  /* eslint-disable */

  export default {
    name: "OrderRecord",

    data () {
      return {
        borrowed: [],
        selectedBorrowed: [],
        search:''
      }
    },
    mounted () {
      this.listAllBorrowed()
    },
    computed: {
      tableHeight () {
        return window.innerHeight - 320
      },
      styles(row, column, rowIndex, columnIndex){
        return 'text-align:center';
      }
    },
    methods: {
      returnByAdmin (row) {
        this.$confirm(`此操作将强制归还${row.title}，是否继续?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          const rowName = row.name;
          const rowTitle = row.title;
          this.$axios.delete('/bookReturn1/'+row.id).then( resp =>{
            if(resp && resp.data.code === 200){
              this.listAllBorrowed()
              this.$notify.success({
                title: '强制归还成功',
                message: `你已经移除了${rowName}借阅的${rowTitle}`
              })
            }
          }).catch(error=> {
            this.$notify.error({
              title: '网络错误！',
              message: '请稍后重试！'
            })
          })
        })
      },
      listAllBorrowed () {
        var _this = this
        this.$axios.get('/getAllBorrowed').then(resp => {
          console.log('listed')
          if (resp && resp.data.code === 200) {
            console.log("return success!")
            this.borrowed = resp.data.result
          }
        })
      }
    }
    }
</script>

<style scoped>

</style>

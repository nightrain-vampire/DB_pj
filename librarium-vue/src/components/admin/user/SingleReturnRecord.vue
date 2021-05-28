<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>个人借阅情况</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="returned.filter(data => !search || data.title.toLowerCase().includes(search.toLowerCase()))"
        stripe
        style="width: 100%"
        :max-height="tableHeight">
        <el-table-column
          type="selection"
          width="45">
        </el-table-column>
        <el-table-column
          prop="title"
          label="书名"
          width="300">
        </el-table-column>
        <el-table-column
          prop="time"
          label="归还日期"
          fit>
        </el-table-column>
        <el-table-column>
          <template slot="header" slot-scope="scope">
            <el-input
              v-model="search"
              size="mini"
              placeholder="输入书名搜索"/>
          </template>
        </el-table-column>
      </el-table>
      <el-row>
        <el-pagination
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="returned.length"></el-pagination>
      </el-row>
    </el-card>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: 'SingleReturnRecord',
  data() {
    return {
      disabled:false,
      values: true,
      returned: [],
      pageSize: 10,
      currentPage: 1,
      total:0,
      search: ''
    }
  },
  mounted:function (){
    this.loadReturned()
  },
  computed: {
    tableHeight() {
      return window.innerHeight - 320
    }
  },
  methods: {
    loadReturned() {
      const userId = this.$store.state.id
      this.$axios.get(`/myreturned/${userId}`).then(resp => {
        if (resp && resp.data.code === 200) {
          this.returned = resp.data.result
        }
      })
    },
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
    }
    }
}
</script>

<style scoped>
</style>

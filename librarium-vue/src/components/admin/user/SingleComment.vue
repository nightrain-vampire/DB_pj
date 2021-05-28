<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>个人留言</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="comments.filter(data => !search || data.commentTitle.toLowerCase().includes(search.toLowerCase()))"
        stripe
        style="width: 100%"
        :max-height="tableHeight">
        <el-table-column
          type="selection"
          width="45">
        </el-table-column>
        <el-table-column
          prop="commentTitle"
          label="标题"
          width="200">
        </el-table-column>
        <el-table-column
          prop="username"
          label="留言者昵称"
          width="200">
        </el-table-column>
        <el-table-column
          prop="commentDate"
          label="发布日期"
          width="200">
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          fit>
          <el-table-column>
            <template slot="header" slot-scope="scope">
              <el-input
                v-model="search"
                size="mini"
                placeholder="输入标题搜索"/>
            </template>
          </el-table-column>
          <template slot-scope="scope">
            <el-button
              @click.native.prevent="viewcomment(scope.row.id)"
              type="primary"
              size="mini" class="el-icon-search">
              查看
            </el-button>
            <el-button
              @click.native.prevent="deletecomment(scope.row.id)"
              type="danger"
              size="mini" class="el-icon-document-delete">
              移除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-row>
        <el-pagination
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="comments.length"></el-pagination>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'SingleComment',
  data () {
    return {
      disabled: false,
      values: true,
      comments: [],
      pageSize: 10,
      currentPage: 1,
      total: 0,
      search:''
    }
  },
  mounted: function () {
    this.loadcomments()
  },
  computed: {
    tableHeight () {
      return window.innerHeight - 320
    }
  },
  methods: {
    loadcomments () {
      const userId = this.$store.state.id
      this.$axios.get(`/mycomment/${userId}`).then(resp => {
        if (resp && resp.data.code === 200) {
          this.comments = resp.data.result
        }
      })
    },
    handleCurrentChange: function (currentPage) { /*
      var _this = this
      const uid = this.$store.state.id
      this.$axios.get('/comment/' + uid + this.pageSize + '/' + page).then(resp => {
        if (resp && resp.data.code === 200) {
          _this.comments = resp.data.result.content
          _this.total = resp.data.result.totalElements
        }
      }) */
      this.currentPage = currentPage
    },
    viewcomment (id) {
      let commentUrl = this.$router.resolve(
        {
          path: '../../commentBoard/comment',
          query: {
            id: id
          }
        }
      )
      window.open(commentUrl.href, '_blank')
    },
    deletecomment (id) {
      this.$confirm('此操作将永久删除该留言, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
          this.$axios
            .delete('/admin/comment/' + id).then(resp => {
            if (resp && resp.data.code === 200) {
              this.loadcomments()
            }
          })
        }
      ).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    }
  }
}
</script>

<style scoped>

</style>

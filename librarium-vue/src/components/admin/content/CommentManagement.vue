<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>内容管理</el-breadcrumb-item>
        <el-breadcrumb-item>留言管理</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="comments"
        stripe
        style="width: 100%"
        :max-height="tableHeight">
        <el-table-column
          type="selection"
          width="45">
        </el-table-column>
        <el-table-column
          prop="commentTitle"
          label="题目"
          width="300">
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
          width="280">
          <template slot-scope="scope">
            <el-button
              @click.native.prevent="viewcomment(scope.row.id)"
              type="success"
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
      <div style="margin: 20px 0 50px 0">
        <el-pagination
          background
          style="float:right;"
          layout="total, prev, pager, next, jumper"
          @current-change="handleCurrentChange"
          :page-size="pageSize"
          :total="total">
        </el-pagination>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'CommentManagement',
  data () {
    return {
      comments: [],
      pageSize: 10,
      total: 0
    }
  },
  mounted () {
    this.loadcomments()
  },
  computed: {
    tableHeight () {
      return window.innerHeight - 320
    }
  },
  methods: {
    loadcomments () {
      var _this = this
      this.$axios.get('/comment/' + this.pageSize + '/1').then(resp => {
        if (resp && resp.data.code === 200) {
          _this.comments = resp.data.result.content
          _this.total = resp.data.result.totalElements
        }
      })
    },
    handleCurrentChange (page) {
      var _this = this
      this.$axios.get('/comment/' + this.pageSize + '/' + page).then(resp => {
        if (resp && resp.data.code === 200) {
          _this.comments = resp.data.result.content
          _this.total = resp.data.result.totalElements
        }
      })
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
      this.$confirm('此操作将永久删除该评论, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
          this.$axios
            .delete('/admin/content/comment/' + id).then(resp => {
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
.add-link {
  margin: 18px 0 15px 10px;
  float: left;
}
</style>

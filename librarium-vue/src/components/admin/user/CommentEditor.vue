<template>
  <el-container>
    <el-header>
      <el-row style="margin: 18px 0px 0px 18px ">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
          <el-breadcrumb-item>留言服务</el-breadcrumb-item>
        </el-breadcrumb>
      </el-row>
    </el-header>
    <el-main>
      <el-row>
        <el-date-picker
          v-model="comment.commentDate"
          style="width: 1075px;position: page;margin: 10px 0px;font-size: 18px;"
          type="datetime"
          placeholder="请输入日期"
          editable="false"
          :default-value="new Date()"
          align="right"
          value-format="yyyy-MM-dd HH:mm:ss"
          :picker-options="pickerOptions">
        </el-date-picker>
      </el-row>
      <el-row>
        <el-input
          v-model="comment.commentTitle"
          style="margin: 10px 0px;font-size: 18px;"
          placeholder="请输入标题"></el-input>
      </el-row>
      <el-row>
        <el-input
          v-model="comment.username"
          style="margin: 10px 0px;font-size: 18px;"
          placeholder="请输入昵称(选填)"></el-input>
      </el-row>
      <el-row style="height: calc(100vh - 140px);">
        <mavon-editor
          v-model="comment.commentContentMd"
          style="height: 100%;"
          ref=md
          @save="saveComments"
          fontSize="16px">
        </mavon-editor>
        <el-dialog
          :visible.sync="dialogVisible"
          width="30%">
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
        </el-dialog>
      </el-row>
    </el-main>
  </el-container>
</template>

<script>
export default {
  name: 'CommentEditor',
  data () {
    return {
      comment: [],
      dialogVisible: false,
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick (picker) {
            picker.$emit('pick', new Date())
          }
        }, {
          text: '昨天',
          onClick (picker) {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24)
            picker.$emit('pick', date)
          }
        }, {
          text: '一周前',
          onClick (picker) {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
            picker.$emit('pick', date)
          }
        }]
      }
    }
  },
  mounted () {
    if (this.$route.params.comment) {
      this.comment = this.$route.params.comment
    }
  },
  methods: {
    saveComments (value, render) {
      // value 是 md，render 是 html
      this.$confirm('是否保存并发布评论?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
          this.$axios
            .post('/admin/comment', {
              uid: this.$store.state.id,
              id: this.comment.id,
              commentTitle: this.comment.commentTitle,
              commentContentMd: value,
              commentContentHtml: render,
              username: this.comment.username,
              commentDate: this.comment.commentDate
            }).then(resp => {
            if (resp && resp.data.code === 200) {
              this.$message({
                type: 'info',
                message: '已保存成功'
              })
            }
          })
        }
      ).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消发布'
        })
      })
    },
    getdate () {
      var date = new Date()
      /* var seperator1 = '-' */
      var year = date.getFullYear()
      var month = date.getMonth() + 1
      var strDate = date.getDate()
      if (month >= 1 && month <= 9) {
        month = '0' + month
      }
      if (strDate >= 0 && strDate <= 9) {
        strDate = '0' + strDate
      }
      var currentdate = year + ' 年 ' + month + ' 月 ' + strDate + ' 日 '
      return currentdate
    }
  }
}
</script>

<style scoped>
</style>

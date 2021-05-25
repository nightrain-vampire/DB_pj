<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>留言服务</el-breadcrumb-item>
      </el-breadcrumb>
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
  </div>
</template>

<script>
//import ImgUpload from '../content/ImgUpload'
export default {
  name: 'CommentEdtior',
  //components: {ImgUpload},
  data () {
    return {
      comment: {
        uid: this.$store.state.id,
        gmtCreate: '',
        id: '',
        commentTitle: '',
        commentContentMd: '',
        commentContentHtml: '',
        username: '',
      },
      dialogVisible: false
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
          const commentTime = new Date();
          const year = commentTime.getFullYear();
          const month = commentTime.getMonth()+1;
          const day = commentTime.getDate();
          const hour = commentTime.getHours();
          const minute = commentTime.getMinutes();
          const seconds = commentTime.getSeconds();
          this.comment.gmtCreate = `${year}年${month}月${day}日  ${hour}:${minute}:${seconds}`
          this.$axios
            .post('/admin/content/comment', {
              id: this.comment.id,
              commentTitle: this.comment.commentTitle,
              commentContentMd: value,
              commentContentHtml: render,
              username: this.comment.username,
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
    getdate() {
      var date = new Date();
      var seperator1 = "-";
      var year = date.getFullYear();
      var month = date.getMonth() + 1;
      var strDate = date.getDate();

      if (month >= 1 && month <= 9) {
        month = "0" + month;
      }
      if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
      }
      var currentdate = year + " 年 " + month + " 月 " + strDate + " 日 ";
      return currentdate;
    }
  }

}
</script>

<style scoped>

</style>

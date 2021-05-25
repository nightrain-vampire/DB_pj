<template>
  <div>
    <el-row>
      <el-input
        v-model="comment.commentTitle"
        style="margin: 10px 0px;font-size: 18px;"
        placeholder="请输入标题"></el-input>
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
import ImgUpload from '../content/ImgUpload'
export default {
  name: 'CommentEdtior',
  components: {ImgUpload},
  data () {
    return {
      comment: {},
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
          this.$axios
            .post('/admin/content/comment', {
              id: this.comment.id,
              commentTitle: this.comment.commentTitle,
              commentContentMd: value,
              commentContentHtml: render,
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
    uploadImg () {
      this.comment.commentCover = this.$refs.imgUpload.url
    }
  }

}
</script>

<style scoped>

</style>

<template>
  <div style="margin-top: 40px">
    <!--<el-button @click="addComment">添加评论</el-button>-->
    <div class="comments-area">
      <el-card style="text-align: left">
        <div v-for="comment in comments" :key="comment.id">
          <div style="float:left;width:85%;height: 150px;">
            <router-link class="comment-link" :to="{path:'commentBoard/comment',query:{id: comment.id}}"><span style="font-size: 20px"><strong>{{comment.commentTitle}}</strong></span></router-link>
            <el-divider content-position="left">{{comment.commentDate}}</el-divider>
            <router-link class="article-link" :to="{path:'commentBoard/comment',query:{id: comment.id}}"></router-link>
          </div>
          <el-divider></el-divider>
        </div>
      </el-card>
    </div>
    <el-pagination
      background
      layout="total, prev, pager, next, jumper"
      @current-change="handleCurrentChange"
      :page-size="pageSize"
      :total="total">
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: 'Comment',
  data () {
    return {
      comments: [],
      pageSize: 4,
      total: 0
    }
  },
  mounted () {
    this.loadComments()
  },
  methods: {
    loadComments () {
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
    addComment(id) {
      this.$router.push({path:'/commentBoard/commentEdtior'});
    }
  }
}
</script>

<style scoped>

</style>

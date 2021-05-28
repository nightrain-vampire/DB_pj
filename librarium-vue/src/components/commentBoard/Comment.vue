<template>
  <div style="margin-top: 40px">
    <!--<el-button @click="addComment">添加留言</el-button>-->
    <div class="comments-area">
      <el-timeline>
        <template v-for="comment in comments">
          <el-timeline-item
            :key="comment.id"
            placement="top"
            size="large"
            color="#6699FF">
            <el-card style="text-align: left">
              <div>
                <div style="float:left;width:85%;height: 150px;">
                  <router-link class="comment-link" :to="{path:'commentBoard/comment',query:{id: comment.id}}"><span style="font-size: 20px"><strong>{{comment.commentTitle}}</strong></span></router-link>
                  <!--<el-divider content-position="left">{{comment.commentDate}}</el-divider>-->
                  <el-divider></el-divider>
                  <span style="font-size: 20px"><strong>{{comment.username}}</strong></span>
                  <!--<router-link class="article-link" :to="{path:'commentBoard/comment',query:{id: comment.id}}"></router-link>-->
                </div>
              </div>
            </el-card>
          </el-timeline-item>
        </template>
      </el-timeline>
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
    addComment (id) {
      this.$router.push({path: '/commentBoard/commentEditor'})
    }
  }
}
</script>

<style scoped>
</style>

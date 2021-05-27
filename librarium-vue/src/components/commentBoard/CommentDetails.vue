<template>
  <div class="comments-area">
    <el-backtop :bottom="100"></el-backtop>
    <el-row style="margin: 30px 0 0 500px">
      <el-breadcrumb separator="    ">
        <el-breadcrumb-item :to="{ path: '/jotter'}">文章列表</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/library'}">图书馆</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/admin/dashboard'}">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/commentBoard'}">留言板</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: ''}"></el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-card style="text-align: left;width: 990px;margin: 35px auto 0 auto">
      <div>
        <span style="font-size: 20px"><strong>{{comment.commentTitle}}</strong></span>
        <el-divider content-position="left">{{comment.commentDate}}</el-divider>
        <div class="markdown-body">
          <div v-html="comment.commentContentHtml"></div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'CommentDetails',

  data () {
    return {
      comment: [],
      s_navigation: (() => {
        return this.navigation;
      })()
    }
  },
  mounted () {
    this.loadComment()
  },
  methods: {
    loadComment () {
      var _this = this
      this.$axios.get('/comment/' + this.$route.query.id).then(resp => {
        if (resp && resp.data.code === 200) {
          _this.comment = resp.data.result
        }
      })
    }
  }
}
</script>

<style scoped>
  @import "../../styles/markdown.css";
</style>

<template>
  <div style="margin-top: 40px">
    <el-button @click="addComment()">添加文章</el-button>

  </div>
</template>

<script>
import dateUtlis from '../../utils/dateUtlis'
import CommentEdtior from './CommentEdtior'
export default {
  name: 'Comment'
}
</script>

<style scoped>

</style>

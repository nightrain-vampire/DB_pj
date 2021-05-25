<template>
  <div>
    <el-row style="height: 840px;">
      <el-switch class="switch"
                 v-model="values"
                 @change="changeView"
                 active-text="显示更多"></el-switch>
      <!--<view-switch class="switch"></view-switch>-->
      <el-tooltip effect="dark"
                  style="margin-top: 50px"
                  placement="right"
                  v-for="item in books.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                  :key="item.id"
                  :disabled="disabled"
                  :open-delay="500">
        <p slot="content" style="font-size: 14px;margin-bottom: 6px;">{{item.title}}</p>
        <p slot="content" style="font-size: 13px;margin-bottom: 6px">
          <span>{{item.author}}</span> /
          <span>{{item.date}}</span> /
          <span>{{item.press}}</span>
        </p>
        <p slot="content" style="width: 300px" class="abstract">{{item.abs}}</p>
        <el-card class="card"
                 :body-style="{padding: '10px'}"
                 shadow="hover">
          <div class="cover">
            <img :src="item.cover" alt="封面">
          </div>
          <div class="info">
            <div class="title">
              <a href="">{{item.title}}</a>
            </div>
          </div>
          <div class="author">{{item.author}}</div>
          <el-button type="warning"
                     @click="BorrowBook(item)"
                     :key="item.id"
                     style="float: bottom; width: 180px">
            <i class="el-icon-collection"></i>    借 阅
          </el-button>
        </el-card>
      </el-tooltip>
    </el-row>
    <el-row>
      <el-pagination
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :total="books.length">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
/* eslint-disable */
import qs from 'qs';
export default {
  name: 'BorrowedBooks',
  data () {
    return {
      disabled: false,
      values: true,
      books: [],
      currentPage: 1,
      pagesize: 8
    }
  },
  mounted: function () {
    this.loadBooks()
  },
  methods: {
    BorrowBook (item) {
      if (this.$store.state.id === '') {
        console.log("未登录，不能借阅！");
        this.$router.push('/login')
      }
      else{
        const title = item.title;
        this.borrowed.bid = item.id
        const borrowTime = new Date();
        const year = borrowTime.getFullYear();
        const month = borrowTime.getMonth()+1;
        const day = borrowTime.getDate();
        const hour = borrowTime.getHours();
        const minute = borrowTime.getMinutes();
        const seconds = borrowTime.getSeconds();
        this.borrowed.time = `${year}年${month}月${day}日  ${hour}:${minute}:${seconds}`
        const _this = this
        this.$axios.post('/borrow',this.borrowed).then( resp =>{
          if(resp && resp.data.code === 200) {
            this.$notify.success({
              title:"成功！",
              message: `你成功借阅《${title}》！`
            })

          }
          else if(resp.data.code ===400) {
            var indexs = this.books.findIndex(item =>{
              if(item.id === this.borrowed.bid){
                return true
              }
            })
            this.books.splice(indexs,1)
            this.$notify({
              title: '错误！',
              message: `你已经借阅《${title}》！`,
              type: 'error'
            })
          }
        }).catch( error =>{
          console.log(error)
        })
      }
    },
    changeView (event) {
      this.disabled = !event
    },
    loadBooks () {
      var _this = this
      const userId = this.$store.state.id
      this.$axios.get(`/orderedBooks/${userId}`).then(resp => {
        if (resp && resp.data.code === 200) {
          this.books = resp.data.result
        }
      })
    },
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
    },
    searchResult () {
      var _this = this
      this.$axios
        .get('/search?keywords=' + this.$refs.searchBar.keywords, {
        }).then(resp => {
        if (resp && resp.data.code === 200) {
          _this.books = resp.data.result
        }
      })
    }
  }
}
</script>
<style scoped>
.card{
  width: 200px;
  margin-bottom: 20px;
  height: 350px;
  float: left;
  margin-right: 15px;
}

.cover {
  width: 180px;
  height: 250px;
  margin-bottom: 7px;
  overflow: hidden;
  cursor: pointer;
}

img {
  width: 175px;
  height: 250px;
  /*margin: 0 auto;*/
}

.title {
  font-size: 14px;
  text-align: left;
}

.author {
  color: #333;
  width: 102px;
  font-size: 11px;
  margin-bottom: 8px;
  text-align: left;
}

.abstract {
  display: block;
  line-height: 17px;
}

.el-icon-delete {
  cursor: pointer;
  float: right;
}

.switch {
  display: flex;
  position: absolute;
  left: 780px;
  top: 25px;
}

a {
  text-decoration: none;
}

a:link, a:visited, a:focus {
  color: #3377aa;
}

</style>

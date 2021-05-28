<template>
  <div>
    <el-backtop :bottom="100"></el-backtop>
    <el-row style="height: 840px;">
      <search-bar @onSearch="searchResult" ref="searchBar"></search-bar>
      <el-switch class="switch"
                 v-model="values"
                 @change="changeView"
                 active-text="显示更多"></el-switch>
      <!--<view-switch class="switch"></view-switch>-->
      <el-tooltip effect="dark"
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
            <el-button type="primary"
                       @click="star(item)"
                       :key="item.id"
                       icon="el-icon-star-off" circle
                       size="small">
            </el-button>
            <img :src="item.cover" alt="封面">
          </div>
          <div class="info">
            <div class="title">
              <a style="color: #005cc5;">{{item.title}}</a>
            </div>
          </div>
          <div class="author">{{item.author}}</div>
          <el-button
            type="warning"
            @click="borrow(item)"
            :key="item.id"
            style="float: bottom; width: 180px">
            <i class="el-icon-collection"></i>    借  阅
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
  import SearchBar from './SearchBar'

  export default {
    name: 'Books',
    components: {SearchBar},
    data () {
      return {
        disabled: false,
        values: true,
        books: [],
        currentPage: 1,
        pagesize: 8,
        borrowed: {
          uid: this.$store.state.id,
          bid: 0,
          time:'',
          duetime:''
        },
        starred: {
          uid: this.$store.state.id,
          bid: 0,
          time: ''
        }
      }
    },
    mounted: function () {
      this.warnings()
      this.loadBooks()
    },
    methods: {
      warnings () {
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
          this.$message.warning("移动端体验不好，请用电脑浏览器打开1~")
        }
      },
      borrow (item) {
        if (this.$store.state.id === '') {
          console.log("未登录，不能借阅！");
          this.$router.push('/login')
        } else {
          const title = item.title;
          this.borrowed.bid = item.id;
          const borrowTime = new Date();
          const year = borrowTime.getFullYear();
          const month = borrowTime.getMonth() + 1;
          const day = borrowTime.getDate();
          const hour = borrowTime.getHours();
          const minute = borrowTime.getMinutes();
          const seconds = borrowTime.getSeconds();
          this.borrowed.time = `${year}年${month}月${day}日  ${hour}:${minute}:${seconds}`;
          let dday = day;
          if (month - 9 === 2 && dday > 28) {
            if ((year % 4 === 0 && year % 100) || year % 400 === 0)
              dday = 29;
            else
              dday = 28;
          } else if (dday === 30 && ((month + 3) % 12 === 1 || (month + 3) % 12 === 3 || (month + 3) % 12 === 5 ||
            (month + 3) % 12 === 7 || (month + 3) % 12 === 8 || (month + 3) % 12 === 10 || (month + 3) % 12 === 12))
            dday = 31;
          else if (dday === 31 && ((month + 3) % 12 === 4 || (month + 3) % 12 === 6 || (month + 3) % 12 === 9 ||
            (month + 3) % 12 === 11))
            dday = 30;
          this.borrowed.duetime = `${month+3>12?year+1:year}年${month+3>12?month-9:month+3}月${dday}日  ${hour}:${minute}:${seconds}`;
          this.$axios.post('/borrow', this.borrowed).then(resp => {
            if (resp && resp.data.code === 200) {
              this.$notify.success({
                title: "成功！",
                message: `你成功借阅《${title}》！`
              })

            } else if (resp.data.code === 400) {
              /*var indexs = */this.books.findIndex(item => {
                if (item.id === this.borrowed.bid) {
                  return true
                }
              })
              //this.books.splice(indexs, 1)  //点击后已借阅的图书会消失
              this.$notify({
                title: '错误！',
                message: `你已经借阅《${title}》！`,
                type: 'error'
              })
            }
          }).catch(error => {
            console.log(error)
          })
        }
      },
      star (item) {
        if (this.$store.state.id === '') {
          console.log("未登录，不能收藏！");
          this.$router.push('/login')
        }
        else{
          const title = item.title;
          this.starred.bid = item.id
          const starTime = new Date();
          const year = starTime.getFullYear();
          const month = starTime.getMonth()+1;
          const day = starTime.getDate();
          const hour = starTime.getHours();
          const minute = starTime.getMinutes();
          const seconds = starTime.getSeconds();
          this.starred.time = `${year}年${month}月${day}日  ${hour}:${minute}:${seconds}`
          const _this = this
          this.$axios.post('/star',this.starred).then( resp =>{
            if(resp && resp.data.code === 200) {
              this.$notify.success({
                title:"成功！",
                message: `你成功收藏《${title}》！`
              })
            }
            else if(resp.data.code ===400) {
              var indexs = this.books.findIndex(item =>{
                if(item.id === this.starred.bid){
                  return true
                }
              })
              this.books.splice(indexs,1)
              this.$notify({
                title: '错误！',
                message: `你已经收藏《${title}》！`,
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
        this.$axios.get('/books').then(resp => {
          if (resp && resp.data.code === 200) {
            _this.books = resp.data.result
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
    height: 400px;
    float: left;
    margin-right: 15px;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
    background-color: #E6E6FA;
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
    color: #1b1f23;
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
    color: #6f42c1;
  }

</style>

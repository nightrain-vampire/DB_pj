<template>
  <div>
    <el-backtop :bottom="100"></el-backtop>
    <el-row style="height: 840px;">
      <!--<search-bar @SeatonSearch="SeatsearchResult" ref="searchBar"></search-bar>-->
      <el-tooltip effect="dark"
                  placement="right"
                  v-for="item in seats.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                  :key="item.id"
                  :disabled="disabled"
                  :open-delay="500">
        <p slot="content" style="font-size: 14px;margin-bottom: 6px;">{{item.id}}</p>
        <el-card class="card"
                 :body-style="{padding: '10px'}"
                 shadow="hover">
          <div class="info">
            <div class="title">
              <a style="color: #1F1F1F; font-size: 14px">编号: {{item.id}}</a>
            </div>
          </div>
          <el-divider></el-divider>
          <div class="author" style="font-size: 14px">状态: {{item.seatStat.nameZh}}</div>
        </el-card>
      </el-tooltip>
    </el-row>
    <el-row>
      <el-pagination
        @current-change="MyhandleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :total="seats.length">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Seats',
  data () {
    return {
      disabled: false,
      values: true,
      seats: [],
      currentPage: 1,
      pagesize: 20,
    }
  },
  mounted: function () {
    //this.warnings()
    this.loadSeats()
  },
  methods: {
    /*warnings () {
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
    },*/
    loadSeats () {
      var _this = this
      this.$axios.get('/seats').then(resp => {
        if (resp && resp.data.code === 200) {
          _this.seats = resp.data.result
        }
      })
    },
    MyhandleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
    }
  }
}
</script>

<style scoped>
.card{
  width: 200px;
  margin-bottom: 20px;
  height: 120px;
  float: left;
  margin-right: 15px;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #99a9bf;
  background-color: #409EFF;
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
a {
  text-decoration: none;
}
a:link, a:visited, a:focus {
  color: #6f42c1;
}
</style>

<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span style="font-weight: bold;font-size: 20px">更新进度</span>
      <!--<el-button style="float: right; padding: 3px 0" type="text">修改</el-button>-->
    </div>
    <div class="block">
        <el-timeline>
          <el-timeline-item timestamp="2021/5/29" placement="top">
            <el-card>
              <h4>实现座位管理，完善细节</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/29</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/28" placement="top">
            <el-card>
              <h4>实现公告栏、留言板、个人收藏，首页设计</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/28</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/27" placement="top">
            <el-card>
              <h4>实现个人、图书信息修改，密码修改</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/27</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/26" placement="top">
            <el-card>
              <h4>实现图书和人员管理（增加/删除)</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/26</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/25" placement="top">
            <el-card>
              <h4>实现分权限登录和注册功能</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/25</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/23" placement="top">
            <el-card>
              <h4>实现基本借还书和书籍模糊查询</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/23</p>
            </el-card>
          </el-timeline-item>
          <el-timeline-item timestamp="2021/5/20" placement="top">
            <el-card>
              <h4>实现图书分类展示</h4>
              <p>nightrain-vampire && siluhuayu 提交于 2021/5/20 </p>
            </el-card>
          </el-timeline-item>
        </el-timeline>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'DashboardAdmin'
}
</script>
<style scoped>
.box-card {
  margin-top: 5px;
  width: 988px;
  height: 1200px;
  text-align: left;
}
</style>

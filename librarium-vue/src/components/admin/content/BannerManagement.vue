<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">管理中心</el-breadcrumb-item>
        <el-breadcrumb-item>内容管理</el-breadcrumb-item>
        <el-breadcrumb-item>座位管理</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <SeatEditForm @onSubmit="loadSeats()" ref="edit"></SeatEditForm>
    <el-card style="margin: 18px 2%;width: 95%">
      <el-table
        :data="seats"
        stripe
        style="width: 100%"
        :max-height="tableHeight">
        <el-table-column
          type="selection"
          width="45">
        </el-table-column>
        <el-table-column
          prop="id"
          label="座位编号"
          fit>
        </el-table-column>
        <el-table-column
          prop="seatStat.nameZh"
          label="状态"
          fit>
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="200">
          <template slot-scope="scope">
            <el-button
              @click.native.prevent="editSeat(scope.row)"
              type="primary"
              size="mini" class="el-icon-edit">
              编辑
            </el-button>
            <el-button
              @click.native.prevent="deleteSeat(scope.row)"
              type="danger"
              size="mini" class="el-icon-delete">
              移除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import SeatEditForm from './SeatEditForm'
export default {
  name: 'BannerManagement',
  components: {SeatEditForm},
  data () {
    return {
      seats: []
    }
  },
  mounted () {
    this.loadSeats()
  },
  computed: {
    tableHeight () {
      return window.innerHeight - 320
    }
  },
  methods: {
    deleteSeat (row) {
      this.$confirm('此操作将永久删除该座位, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
          this.$axios.delete('/admin/content/seats/delete/' + row.id).then(resp => {
            if (resp && resp.data.code === 200) {
              this.loadSeats()
            }
          })
        }
      ).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    editSeat (item) {
      this.$refs.edit.dialogFormVisible = true
      this.$refs.edit.form = {
        id: item.id,
        seatStat: {
          id: item.seatStat.id.toString(),
          name: item.seatStat.name,
          nameZh: item.seatStat.nameZh
        }
      }
      // this.$refs.edit.category = {
      //   id: item.category.id.toString()
      // }
    },
    loadSeats () {
      var _this = this
      this.$axios.get('/seats').then(resp => {
        if (resp && resp.data.code === 200) {
          _this.seats = resp.data.result
        }
      })
    }
  }
}
</script>

<style scoped>
</style>

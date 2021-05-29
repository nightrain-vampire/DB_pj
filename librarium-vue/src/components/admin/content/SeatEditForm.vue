<template>
  <div style="text-align: left">
    <el-button class="add-button el-icon-plus" type="success" @click="dialogFormVisible = true">添加座位</el-button>
    <el-dialog
      title="添加座位"
      :visible.sync="dialogFormVisible"
      @close="clear">
      <el-form v-model="form" style="text-align: left" ref="dataForm">
        <el-form-item label="座位号" :label-width="formLabelWidth" prop="sid">
          <el-input v-model="form.sid" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="状态" :label-width="formLabelWidth" prop="state">
          <el-select name="状态" v-model="form.seatStat.id" placeholder="请选择状态">
            <el-option label="空闲" value="1"></el-option>
            <el-option label="已占" value="2"></el-option>
            <el-option label="维修中" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="id" style="height: 0">
          <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="danger" @click="dialogFormVisible = false" class="el-icon-close">取 消</el-button>
        <el-button type="primary" @click="onSubmit" class="el-icon-check">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'SeatEditForm',
  data () {
    return {
      dialogFormVisible: false,
      form: {
        id: '',
        sid: '',
        seatStat: {
          id: '',
          name: '',
          nameZh: ''
        }
      },
      formLabelWidth: '120px'
    }
  },
  methods: {
    clear () {
      this.form = {
        id: '',
        sid: '',
        seatStat: {
          id: '',
          name: '',
          nameZh: ''
        }
      }
    },
    onSubmit () {
      this.$axios
        .post('/admin/content/seats', {
          id: this.form.id,
          sid: this.form.sid,
          seatStat: this.form.seatStat
        }).then(resp => {
        if (resp && resp.data.code === 200) {
          this.dialogFormVisible = false
          this.$emit('onSubmit')
        }
      })
    },
  }
}
</script>

<style scoped>
.add-button {
  margin: 18px 0 0 10px;
}
</style>

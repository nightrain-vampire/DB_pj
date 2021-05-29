<template>
  <el-container>
    <el-main>
      <seats class="seats-area" ref="seatsArea"></seats>
    </el-main>
  </el-container>
</template>

<script>
import Seats from './Seats'
export default {
  name: 'RoomIndex',
  components: {Seats},
  methods: {
  }
}
</script>

<style scoped>
.seats-area{
  width: 990px;
  margin-left: auto;
  margin-right: auto;
}
</style>

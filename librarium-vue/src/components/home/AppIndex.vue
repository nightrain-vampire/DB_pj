<template>
  <div style="margin-top: 40px">
      <div class="home">
        <div id="header-div">
          <div style="height: 150px"></div>
          <carousel></carousel>
          <quick-nav style="float: right;margin-top: -450px;margin-right: 480px"></quick-nav>
        </div>
        <about id="about"></about>
      </div>
  </div>
</template>

<script>
  /* eslint-disable */
  import Carousel from './Carousel'
  import QuickNav from './QuickNav'
  import About from '@/components/common/About'
  export default {
    name: 'AppIndex',
    components: {
      Carousel,
      QuickNav,
      About
      /*, SideMenu*/
    }
  }
</script>

<style scoped>
  .home {
    width: 990px;
    margin-left: auto;
    margin-right: auto;
    margin-top: -20px;

  }

  #header-div {
    padding-bottom: 20px;
    padding-left: 5px;
    background-color: white;
  }

  #side-menu {
    position: fixed;
    margin-left: 50%;
    left: -680px;
    top: 100px;
  }
</style>

<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png" /> -->
    <!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
    <h1 class="text-center p-6 text-yellow-900 font-extrabold text-5xl">
      MikuChan233
    </h1>
    <div class="px-6 pt-8">
      <div class="flex justify-between container mx-auto">
        <plate-list></plate-list>
        <div class="-mx-8 w-4/12 hidden lg:block">
          <login-form></login-form>
          <div class="mt-10 px-8">
            <!-- <h1 class="mb-4 text-xl font-bold text-gray-700">Recent Post</h1> -->
            <div
              class="px-8 py-6 max-w-sm mx-auto rounded-sm shadow-md"
              style="background: #B6DDDE;border-color: #8FCCCD;"
            >
              <img src="../assets/ad.jpg" alt="mikufufu" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- <div>社区情况</div>
    <div>搜索帖子</div>
    <div>登录注册</div>
    <div>板块</div>
    <div>广告区域</div> -->
  </div>
</template>

<script>
// @ is an alias to /src
import PlateList from "@/components/PlateList";
import LoginForm from "@/components/LoginForm";
export default {
  name: "Home",
  components: {
    PlateList,
    LoginForm
  }
};
</script>

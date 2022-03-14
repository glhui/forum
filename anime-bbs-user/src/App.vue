<template>
  <div id="app">
    <!-- <div id="nav" class="container">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>z
    </div> -->
    <nav
      class="fixed z-50 w-full top-0 left-0 bg-gray-100 hover:bg-miku-100 px-6 shadow"
    >
      <div
        class="flex flex-col h-6 container mx-auto md:flex-row md:items-center md:justify-between"
      >
        <div class="flex justify-between items-center">
          <div>
            <router-link to="/" class="text-gray-800 hover:text-red-500 text-sm"
              >首页</router-link
            >
          </div>
          <div>
            <button
              type="button"
              class="block text-gray-800 hover:text-gray-600 focus:text-gray-600 focus:outline-none md:hidden"
            >
              <svg viewBox="0 0 24 24" class="h-6 w-6 fill-current">
                <path
                  d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
                ></path>
              </svg>
            </button>
          </div>
        </div>
        <div class="md:flex flex-col md:flex-row md:-mx-4 hidden">
          <router-link
            v-if="this.loginState === 1"
            to="/shop"
            class=" text-black hover:text-red-500 font-bold  md:my-0"
            >[积分商城]</router-link
          >
          <router-link
            v-if="this.loginState === 1"
            to="/send-post"
            class="my-1 px-2 bg-miku-700 text-gray-100 font-bold hover:bg-miku-400 md:mx-4 md:my-0"
            >发帖</router-link
          >
          <div
            v-if="this.loginState === 1"
            class="relative inline-block text-left"
          >
            <div>
              <span
                class="cursor-pointer inline-flex justify-center w-full   text-sm font-medium text-gray-700 hover:text-red-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
                id="options-menu"
                aria-haspopup="true"
                aria-expanded="true"
                v-click-outside="userMenuHiden"
                @click="userMenuOpen = !userMenuOpen"
              >
                {{ this.userInfo.name }}
                <!-- Heroicon name: solid/chevron-down -->
                <svg
                  class="-mr-1 ml-2 h-5 w-5"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"
                  />
                </svg>
              </span>
            </div>

            <div
              v-show="userMenuOpen"
              class="origin-top-right absolute right-0 mt-2 w-32 shadow-lg bg-white"
            >
              <div
                class="py-1  text-left"
                role="menu"
                aria-orientation="vertical"
                aria-labelledby="options-menu"
              >
                <router-link
                  tag="p"
                  v-if="this.loginState === 1"
                  to="/my-orders"
                  class="cursor-pointer hover:bg-gray-100 text-left px-4 py-2 text-sm text-gray-700"
                  >我的订单</router-link
                >
                <router-link
                  tag="p"
                  v-if="this.loginState === 1"
                  :to="'/space/' + userInfo.id"
                  class="cursor-pointer hover:bg-gray-100 text-left px-4 py-2 text-sm text-gray-700"
                  >我的空间</router-link
                >
                <p
                  class="cursor-pointer hover:bg-gray-100 text-left px-4 py-2 text-sm text-gray-700"
                  role="menuitem"
                  @click="logout"
                >
                  登出
                </p>
              </div>
            </div>
          </div>
          <!-- <a
            href="#"
            class="my-1 text-gray-800 hover:text-red-500 md:mx-4 md:my-0"
            >User</a
          >
          <a
            href="#"
            class="my-1 text-gray-800 hover:text-red-500 md:mx-4 md:my-0"
            >Theme</a
          > -->
        </div>
      </div>
    </nav>
    <main class="pt-6">
      <router-view class="mb-16" />
    </main>
    <footer
      class="bg-green-50 text-xs w-full border-solid border-gray-600 border-t p-1 fixed left-0 bottom-0"
      style="z-index: 1000;"
    >
      <div class="flex items-end">
        <img
          src="./assets/miku_fighting.png"
          alt=""
          class="w-4 h-4 inline-block"
        />
        <p class="divide-x divide-gray-400">
          <a href="#" class="text-blue-600 no-underline px-1">首页版规</a>
          <a href="/" class="text-blue-600 no-underline px-1">微博</a>
          <a href="/" class="text-blue-600 no-underline px-1">知乎</a>
        </p>
      </div>
      <div class="flex items-end">
        <img
          src="./assets/miku_happy.png"
          alt=""
          class="w-4 h-4 inline-block"
        />
        <a href="/" class="text-blue-600 no-underline px-1">联系站长</a>
      </div>
    </footer>
  </div>
</template>

<script>
import ClickOutside from "vue-click-outside";
import { LOGIN_STATE, USER_INFO } from "@/store/mutation-types";
import storage from "store";
import { logout } from "@/api/user";

export default {
  directives: {
    ClickOutside
  },
  data() {
    return {
      loginState: storage.get(LOGIN_STATE) || 0,
      userInfo: storage.get(USER_INFO) || null,
      userMenuOpen: false
    };
  },
  created() {
    this.$bus.$on("login-state-change", () => {
      this.loginState = storage.get(LOGIN_STATE) || 0;
      this.userInfo = storage.get(USER_INFO) || null;
    });
  },
  methods: {
    logout() {
      logout()
        .then(() => {
          this.loginState = 0;
          storage.set(LOGIN_STATE, 0);
          storage.remove(USER_INFO);
          this.$bus.$emit("login-state-change", storage.get(LOGIN_STATE));
        })
        .catch(e => {
          console.log(e, "e");
          this.loginState = 0;
          storage.set(LOGIN_STATE, 0);
          storage.remove(USER_INFO);
          this.userInfo = storage.get(USER_INFO);
          this.$bus.$emit("login-state-change", storage.get(LOGIN_STATE));
        });
    },
    userMenuHiden() {
      this.userMenuOpen = false;
    }
  }
};
</script>
<style lang="scss">
body {
  background: #d2ffee;
  font-family: arial, helvetica, sans-serif;
  color: black;
  font-size: 10pt;
}
main {
  background: url("./assets/fade-miku.png") top repeat-x;
}
</style>

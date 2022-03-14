<template>
  <div class="px-8">
    <div
      class="flex flex-col max-w-sm  mx-auto rounded-sm shadow-md"
      style="background: #B6DDDE;border-color: #8FCCCD;"
    >
      <div class="px-6 py-4">
        <p class=" font-bold">animate-bbs</p>
        <p class="">动漫论坛</p>
      </div>
      <div
        v-if="loginState === 0"
        class="text-center py-4 space-y-2 border-t border-gray-200"
      >
        <p class="">
          没有账号?
          <router-link to="/register" class="text-blue-500 hover:underline"
            >现在注册</router-link
          >
        </p>
        <form class="px-2 space-y-2">
          <div>
            <input
              v-model="loginForm.phone"
              type="text"
              name="phone"
              class="h-8 w-full p-1 rounded-sm border border-gray-300"
              placeholder="手机号"
            />
          </div>
          <div>
            <input
              v-model="loginForm.password"
              type="password"
              name="password"
              placeholder="密码"
              class="h-8 w-full p-1 rounded-sm border border-gray-300"
            />
          </div>
        </form>
        <p class="px-2">
          <button
            class="w-full px-2 py-1 bg-miku-700 text-gray-100 font-bold rounded hover:bg-miku-400 "
            @click="login"
          >
            立即登录
          </button>
        </p>
      </div>
      <div v-if="loginState === 1 && userInfo" class=" mb-4">
        <img
          class="w-16 h-16 cursor-pointer rounded-full mx-auto"
          :src="$imgURL + userInfo.avatar"
          alt=""
          @click="$router.push({ name: 'Space', params: { id: userInfo.id } })"
        />
        <p class=" text-center">
          {{ userInfo.name }}
        </p>
        <p class="px-2">
          <button
            class="w-full px-2 py-1 bg-miku-700 text-gray-100 font-bold rounded hover:bg-miku-400 "
            @click="logout"
          >
            登出
          </button>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import { login, getInfo, logout } from "@/api/user";
import { LOGIN_STATE, USER_INFO } from "@/store/mutation-types";
import storage from "store";

export default {
  data() {
    return {
      loginForm: {
        // emali: "",
        phone: "",
        password: ""
      },
      loginState: storage.get(LOGIN_STATE) || 0,
      userInfo: storage.get(USER_INFO) || null
    };
  },
  created() {
    this.$bus.$on("login-state-change", () => {
      this.loginState = storage.get(LOGIN_STATE) || 0;
      this.userInfo = storage.get(USER_INFO) || null;
      storage.get(LOGIN_STATE) === 1 &&
        getInfo()
          .then(res => {
            const { avatar, email, id, lastLoginTime, name, phone, points } = {
              ...res.data
            };
            storage.set(USER_INFO, {
              avatar,
              email,
              id,
              lastLoginTime,
              name,
              phone,
              points
            });
          })
          .catch(() => {
            storage.set(LOGIN_STATE, 0);
            storage.remove(USER_INFO);
            this.$bus.$emit("login-state-change", storage.get(LOGIN_STATE));
          });
    });
    storage.get(LOGIN_STATE) === 1 &&
      getInfo()
        .then(res => {
          const { avatar, email, id, lastLoginTime, name, phone, points } = {
            ...res.data
          };
          storage.set(USER_INFO, {
            avatar,
            email,
            id,
            lastLoginTime,
            name,
            phone,
            points
          });
        })
        .catch(() => {
          storage.set(LOGIN_STATE, 0);
          storage.remove(USER_INFO);
          this.$bus.$emit("login-state-change", storage.get(LOGIN_STATE));
        });
  },
  mounted() {},
  methods: {
    login() {
      login(this.loginForm)
        .then(res => {
          storage.set(LOGIN_STATE, 1);
          this.loginState = 1;
          const { avatar, email, id, lastLoginTime, name, phone, points } = {
            ...res.data
          };
          storage.set(USER_INFO, {
            avatar,
            email,
            id,
            lastLoginTime,
            name,
            phone,
            points
          });
          this.userInfo = storage.get(USER_INFO);
          this.$bus.$emit("login-state-change", storage.get(LOGIN_STATE));
        })
        .catch(e => {
          console.log(e, "e");
          this.loginState = 0;
          storage.set(LOGIN_STATE, 0);
          storage.remove(USER_INFO);
          this.userInfo = storage.get(USER_INFO);
        });
    },
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
    }
  }
};
</script>

<style></style>

import Vue from "vue";
import "./styles/index.scss";
import App from "./App.vue";
import router from "./router";
import VueTailwind from "vue-tailwind";
import VueTailwindsSettings from "@/config/vue-tailwind";
import Message from "@/components/Message";
const MessageConstructor = Vue.extend(Message);
const anmMessage = new MessageConstructor().$mount();
Vue.prototype.$bus = new Vue();
Vue.prototype.$imgURL = process.env.VUE_APP_IMG_BASE_URL;
Vue.config.productionTip = false;

Vue.use(VueTailwind, VueTailwindsSettings);

new Vue({
  router,
  beforeCreate() {
    Vue.prototype.$_anmMessage = anmMessage;
    document.body.appendChild(anmMessage.$el);
  },
  render: h => h(App)
}).$mount("#app");

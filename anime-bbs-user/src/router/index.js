import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/about",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  },
  {
    path: "/send-post",
    name: "SendPost",
    component: () =>
      import(/* webpackChunkName: "send-post" */ "../views/SendPost.vue")
  },
  {
    path: "/post/:id",
    name: "Post",
    component: () => import(/* webpackChunkName: "post" */ "../views/Post.vue")
  },
  {
    path: "/space/:id",
    name: "Space",
    component: () =>
      import(/* webpackChunkName: "space" */ "../views/Space.vue")
  },
  {
    path: "/shop",
    name: "Shop",
    component: () => import(/* webpackChunkName: "shop" */ "../views/Shop.vue")
  },
  {
    path: "/my-orders",
    name: "MyOrders",
    component: () =>
      import(/* webpackChunkName: "my-orders" */ "../views/MyOrders.vue")
  },
  {
    path: "/register",
    name: "Register",
    component: () =>
      import(/* webpackChunkName: "register" */ "../views/Register.vue")
  }
];

const router = new VueRouter({
  routes
});

export default router;

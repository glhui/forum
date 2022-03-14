import axios from 'axios'
import store from '@/store'
import storage from 'store'
import notification from 'ant-design-vue/es/notification'
import { VueAxios } from './axios'
import { ACCESS_TOKEN, USER_ID } from '@/store/mutation-types'
const qs = require('qs')
// 创建 axios 实例
const request = axios.create({
  // API 请求的默认前缀
  baseURL: process.env.VUE_APP_API_BASE_URL,
  timeout: 6000 // 请求超时时间
})

// 异常拦截处理器
const errorHandler = (error) => {
  if (error.response) {
    const data = error.response.data
    // 从 localstorage 获取 token
    const token = storage.get(ACCESS_TOKEN)
    if (error.response.code === 403) {
      notification.error({
        message: 'Forbidden',
        description: data.message
      })
    }
    if (error.response.code === 401 && !(data.result && data.result.isLogin)) {
      notification.error({
        message: 'Unauthorized',
        description: 'Authorization verification failed'
      })
      if (token) {
        store.dispatch('Logout').then(() => {
          setTimeout(() => {
            window.location.reload()
          }, 1500)
        })
      }
    }
  }
  return Promise.reject(error)
}

// request interceptor
request.interceptors.request.use(config => {
  // const token = storage.get(ACCESS_TOKEN)
  // 如果 token 存在
  // 让每个请求携带自定义 token 请根据实际情况自行修改
  // if (token) {
  //   config.headers['Access-Token'] = token
  // }
  if (config.method === 'post') {
    config.headers['content-type'] = 'application/x-www-form-urlencoded'
    config.data = qs.stringify(config.data)
  }
  return config
}, errorHandler)

// response interceptor
request.interceptors.response.use((response) => {
  if (response) {
    const data = response.data
    // 从 localstorage 获取 token
    if (data.code === 403 && response.config.url !== '/user/logout') {
      notification.error({
        message: 'Forbidden',
        description: data.mes
      })
      console.log(store)
      store.commit('user/SET_ROLES', [])
      storage.remove(USER_ID)
      setTimeout(() => {
          window.location.reload('/user/login')
      }, 1500)
      return Promise.reject(response)
      // store.dispatch('Logout').then(() => {
      //   setTimeout(() => {
      //     window.location.reload('/user/login')
      //   }, 1500)
      // })
    }
  }
  return response.data
}, errorHandler)

const installer = {
  vm: {},
  install (Vue) {
    Vue.use(VueAxios, request)
  }
}

export default request

export {
  installer as VueAxios,
  request as axios
}

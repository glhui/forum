import storage from 'store'
import { login, getInfo, logout } from '@/api/login'
import { USER_ID } from '@/store/mutation-types'
import { welcome } from '@/utils/util'

const user = {
  state: {
    token: '',
    name: '',
    welcome: '',
    avatar: '',
    roles: [],
    info: {}
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, { name, welcome }) => {
      state.name = name
      state.welcome = welcome
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_INFO: (state, info) => {
      state.info = info
    }
  },

  actions: {
    // 登录
    Login ({ commit }, userInfo) {
      return new Promise((resolve, reject) => {
        login(userInfo).then(response => {
          const data = response.data
          storage.set(USER_ID, data.id, 7 * 24 * 60 * 60 * 1000)
          // commit('SET_TOKEN', result.token)
          // console.log('login', response)
          commit('SET_INFO', Object.assign({}, data, { avatar: process.env.VUE_APP_IMG_BASE_URL + data.avatar }))
          commit('SET_NAME', { name: data.name, welcome: welcome() })
          commit('SET_AVATAR', process.env.VUE_APP_IMG_BASE_URL + data.avatar)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户信息
    GetInfo ({ commit }) {
      return new Promise((resolve, reject) => {
        getInfo().then(response => {
          const data = response.data
          storage.set(USER_ID, data.id, 7 * 24 * 60 * 60 * 1000)
          if (data.roleId > -1) {
            const role = data.roleId
            commit('SET_ROLES', [role])
            commit('SET_INFO', Object.assign({}, data, { avatar: process.env.VUE_APP_IMG_BASE_URL + data.avatar }))
            commit('SET_NAME', { name: data.name, welcome: welcome() })
            commit('SET_AVATAR', process.env.VUE_APP_IMG_BASE_URL + data.avatar)
          } else {
            reject(new Error('getInfo: roles must be a non-null array !'))
          }
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    Logout ({ commit, state }) {
      return new Promise((resolve) => {
        logout().then(() => {
          // commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          storage.remove(USER_ID)
          resolve()
        }).catch(() => {
          resolve()
        }).finally(() => {
        })
      })
    }

  }
}

export default user

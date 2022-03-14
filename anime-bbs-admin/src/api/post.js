import request from '@/utils/request'

const api = {
  add: '/post/add',
  delete: '/post/delete',
  getAll: '/post/getAll',
  getOne: '/post/getOne',
  update: '/post/update'
}

export default api

export function getPostList (parameter) {
  return request({
    url: api.getAll,
    method: 'post',
    data: parameter
  })
}

export function getPostById (parameter) {
  return request({
    url: api.getOne,
    method: 'post',
    data: parameter
  })
}

export function addPost (parameter) {
  return request({
    url: api.add,
    method: 'post',
    data: parameter
  })
}

export function deletePost (parameter) {
  return request({
    url: api.delete,
    method: 'post',
    data: parameter
  })
}

export function updatePost (parameter) {
  return request({
    url: api.update,
    method: 'post',
    data: parameter
  })
}

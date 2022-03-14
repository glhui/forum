import request from "@/utils/request";

const api = {
  add: "/post/add",
  delete: "/post/delete",
  getAllUserPost: "/post/getAllUserPost",
  getUserPost: "/post/getUserPost",
  getOne: "/post/getOne",
  update: "/post/update",
  reply: "/post/reply",
  adopt: "/post/adopt",
  replyLike: "/post/replyLike",
  cancelReplyLike: "/post/cancelReplyLike"
};

export default api;

export function getAllUserPost(parameter) {
  return request({
    url: api.getAllUserPost,
    method: "post",
    data: parameter
  });
}

export function getUserPost(parameter) {
  return request({
    url: api.getUserPost,
    method: "post",
    data: parameter
  });
}

export function getPostById(parameter) {
  return request({
    url: api.getOne,
    method: "post",
    data: parameter
  });
}

export function addPost(parameter) {
  return request({
    url: api.add,
    method: "post",
    data: parameter
  });
}

export function deletePost(parameter) {
  return request({
    url: api.delete,
    method: "post",
    data: parameter
  });
}

export function updatePost(parameter) {
  return request({
    url: api.update,
    method: "post",
    data: parameter
  });
}

export function replyPost(parameter) {
  return request({
    url: api.reply,
    method: "post",
    data: parameter
  });
}

export function replyAdopt(parameter) {
  return request({
    url: api.adopt,
    method: "post",
    data: parameter
  });
}

export function replyLike(parameter) {
  return request({
    url: api.replyLike,
    method: "post",
    data: parameter
  });
}

export function cancelReplyLike(parameter) {
  return request({
    url: api.cancelReplyLike,
    method: "post",
    data: parameter
  });
}

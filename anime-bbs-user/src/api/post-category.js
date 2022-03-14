import request from "@/utils/request";

const api = {
  add: "/postCategory/add",
  delete: "/postCategory/delete",
  getAll: "/postCategory/getAll",
  getOne: "/postCategory/getOne",
  update: "/postCategory/update"
};

export default api;

export function getPostCategoryList(parameter) {
  return request({
    url: api.getAll,
    method: "post",
    data: parameter
  });
}

export function getPostCategoryById(parameter) {
  return request({
    url: api.getOne,
    method: "post",
    data: parameter
  });
}

export function addPostCategory(parameter) {
  return request({
    url: api.add,
    method: "post",
    data: parameter
  });
}

export function deletePostCategory(parameter) {
  return request({
    url: api.delete,
    method: "post",
    data: parameter
  });
}

export function updatePostCategory(parameter) {
  return request({
    url: api.update,
    method: "post",
    data: parameter
  });
}

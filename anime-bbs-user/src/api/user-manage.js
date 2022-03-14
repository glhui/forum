import request from "@/utils/request";

const api = {
  add: "/user/add",
  changeStatus: "/user/changeStatus",
  delete: "/user/delete",
  getAll: "/user/getAll",
  getOne: "/user/getOne",
  update: "/user/update",
  updatePwd: "/user/updatePwd"
};

export default api;

export function getUserList(parameter) {
  return request({
    url: api.getAll,
    method: "post",
    data: parameter
  });
}

export function getUserById(parameter) {
  return request({
    url: api.getOne,
    method: "post",
    data: parameter
  });
}

export function changeUserStatus(parameter) {
  return request({
    url: api.changeStatus,
    method: "post",
    data: parameter
  });
}

export function addUser(parameter) {
  return request({
    url: api.add,
    method: "post",
    data: parameter
  });
}

export function deleteUser(parameter) {
  return request({
    url: api.delete,
    method: "post",
    data: parameter
  });
}

export function updateUser(parameter) {
  return request({
    url: api.update,
    method: "post",
    data: parameter
  });
}

export function updateUserPwd(parameter) {
  return request({
    url: api.updatePwd,
    method: "post",
    data: parameter
  });
}

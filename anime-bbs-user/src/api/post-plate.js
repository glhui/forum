import request from "@/utils/request";

const api = {
  add: "/postPlate/add",
  delete: "/postPlate/delete",
  getAll: "/postPlate/getAll",
  getOne: "/postPlate/getOne",
  update: "/postPlate/update"
};

export default api;

export function getPostPlateList(parameter) {
  return request({
    url: api.getAll,
    method: "post",
    data: parameter
  });
}

export function getPostPlateById(parameter) {
  return request({
    url: api.getOne,
    method: "post",
    data: parameter
  });
}

export function addPostPlate(parameter) {
  return request({
    url: api.add,
    method: "post",
    data: parameter
  });
}

export function deletePostPlate(parameter) {
  return request({
    url: api.delete,
    method: "post",
    data: parameter
  });
}

export function updatePostPlate(parameter) {
  return request({
    url: api.update,
    method: "post",
    data: parameter
  });
}

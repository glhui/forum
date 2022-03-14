import request from "@/utils/request";

const api = {
  add: "/good/add",
  delete: "/good/delete",
  getAll: "/good/getAll",
  getOne: "/good/getOne",
  update: "/good/update"
};

export default api;

export function getGoodList(parameter) {
  return request({
    url: api.getAll,
    method: "post",
    data: parameter
  });
}

export function getGoodById(parameter) {
  return request({
    url: api.getOne,
    method: "post",
    data: parameter
  });
}

export function addGood(parameter) {
  return request({
    url: api.add,
    method: "post",
    data: parameter
  });
}

export function deleteGood(parameter) {
  return request({
    url: api.delete,
    method: "post",
    data: parameter
  });
}

export function updateGood(parameter) {
  return request({
    url: api.update,
    method: "post",
    data: parameter
  });
}

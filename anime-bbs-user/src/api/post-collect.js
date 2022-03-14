import request from "@/utils/request";

const api = {
  collect: "/post/collect",
  getUserCollect: "/post/getUserCollect",
  cancelCollect: "/post/cancelCollect"
};

export default api;

export function collect(parameter) {
  return request({
    url: api.collect,
    method: "post",
    data: parameter
  });
}

export function getUserCollect(parameter) {
  return request({
    url: api.getUserCollect,
    method: "get",
    params: parameter
  });
}

export function cancelCollect(parameter) {
  return request({
    url: api.cancelCollect,
    method: "post",
    data: parameter
  });
}

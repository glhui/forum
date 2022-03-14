import request from "@/utils/request";

const api = {
  follow: "/user/follow",
  cancelFollow: "/user/cancelFollow",
  getFollow: "/user/getFollow",
  getFollowed: "/user/getFollowed"
};

export default api;

export function follow(parameter) {
  return request({
    url: api.follow,
    method: "post",
    data: parameter
  });
}

export function cancelFollow(parameter) {
  return request({
    url: api.cancelFollow,
    method: "post",
    data: parameter
  });
}

export function getFollow() {
  return request({
    url: api.getFollow,
    method: "get"
  });
}

export function getFollowed() {
  return request({
    url: api.getFollowed,
    method: "get"
  });
}

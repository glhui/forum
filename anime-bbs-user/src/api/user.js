import request from "@/utils/request";

const userApi = {
  Login: "/user/login",
  Logout: "/user/logout",
  ForgePassword: "/auth/forge-password",
  Register: "/auth/register",
  SendSms: "/account/sms",
  SendSmsErr: "/account/sms_err",
  // get my info
  UserInfo: "/user/getCurrentUser",
  UserMenu: "/user/nav",
  IsFollow: "/user/isFollow",
  Follow: "/user/follow",
  CancelFollow: "/user/cancelFollow"
};

/**
 * login func
 * parameter: {
 *     username: '',
 *     password: '',
 *     remember_me: true,
 *     captcha: '12345'
 * }
 * @param parameter
 * @returns {*}
 */
export function login(parameter) {
  return request({
    url: userApi.Login,
    method: "post",
    data: parameter
  });
}

export function getSmsCaptcha(parameter) {
  return request({
    url: userApi.SendSms,
    method: "post",
    data: parameter
  });
}

export function getInfo() {
  return request({
    url: userApi.UserInfo,
    method: "get"
  });
}

export function getCurrentUserNav() {
  return request({
    url: userApi.UserMenu,
    method: "get"
  });
}

export function logout() {
  return request({
    url: userApi.Logout,
    method: "get"
  });
}

export function isFollow(parameter) {
  return request({
    url: userApi.IsFollow,
    method: "post",
    data: parameter
  });
}

export function Follow(parameter) {
  return request({
    url: userApi.Follow,
    method: "post",
    data: parameter
  });
}

export function CancelFollow(parameter) {
  return request({
    url: userApi.CancelFollow,
    method: "post",
    data: parameter
  });
}

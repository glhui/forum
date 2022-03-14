import request from "@/utils/request";

const api = {
  create: "/order/create",
  getAll: "/order/getAll",
  receipt: "/order/receipt"
};

export default api;

export function getOrderList(parameter) {
  return request({
    url: api.getAll,
    method: "post",
    data: parameter
  });
}

export function createOrder(parameter) {
  return request({
    url: api.create,
    method: "post",
    data: parameter
  });
}

export function receiptOrder(parameter) {
  return request({
    url: api.receipt,
    method: "post",
    data: parameter
  });
}

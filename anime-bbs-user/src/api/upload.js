import uploadRequest from "@/utils/upload-request";

const uploadApi = {
  image: "/image/upload"
};

export function uploadImage(parameter) {
  return uploadRequest({
    url: uploadApi.image,
    method: "post",
    data: parameter
  });
}

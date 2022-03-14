<template>
  <div class="flex flex-col">
    <div class="shadow h-16">
      <div class="px-5">
        <div class="flex">
          <div class="mr-4">
            <label for="plate" class="block text-sm font-medium text-gray-700"
              >发布板块</label
            >
            <select
              v-model="fmData.plateId"
              id="plate"
              name="plate"
              class="h-8 space-y-0 block w-full border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
            >
              <option disabled value="">请选择</option>
              <option
                v-for="item in plateOptions"
                :key="item.id"
                :value="item.id"
                >{{ item.name }}</option
              >
            </select>
          </div>
          <div class="mr-4">
            <label
              for="postCategory"
              class="block text-sm font-medium text-gray-700"
              >帖子分类</label
            >
            <select
              v-model="fmData.categoryId"
              id="postCategory"
              name="postCategory"
              class="h-8 space-y-0 block w-full border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
            >
              <option disabled value="">请选择</option>
              <option
                v-for="item in postCategoryOptions"
                :key="item.id"
                :value="item.id"
                >{{ item.name }}</option
              >
            </select>
          </div>
          <div class="mr-4">
            <label for="title" class="block text-sm font-medium text-gray-700"
              >帖子标题</label
            >
            <input
              v-model="fmData.title"
              autocomplete="off"
              type="text"
              name="title"
              id="title"
              placeholder="请输入"
              class="h-8 px-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
            />
          </div>
          <div class="mr-4">
            <label for="adopted" class="block text-sm font-medium text-gray-700"
              >打赏</label
            >
            <input
              v-model="fmData.adopted"
              autocomplete="off"
              id="adopted"
              name="adopted"
              type="checkbox"
              :true-value="1"
              :false-value="2"
              class="focus:ring-indigo-500 h-8 w-8 text-indigo-600 border-gray-300 rounded"
            />
          </div>
          <div v-if="fmData.adopted === 1" class="mr-4">
            <label
              for="adoptedPoints"
              class="block text-sm font-medium text-gray-700"
              >赏金</label
            >
            <input
              v-model="fmData.adoptedPoints"
              type="text"
              name="adoptedPoints"
              id="adoptedPoints"
              placeholder="请输入"
              class="h-8 px-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
            />
          </div>
          <div class=" float-right self-end ml-auto">
            <button
              class="h-8  px-8 py-1 bg-gray-100 text-black font-bold border border-gray-400 hover:bg-miku-100 "
              @click="onSubmit"
            >
              发布
            </button>
          </div>
          <!-- <div class="">
              <label
                for="first_name"
                class="block text-sm font-medium text-gray-700"
                >First name</label
              >
              <input
                type="text"
                name="first_name"
                id="first_name"
                autocomplete="given-name"
                class="h-8 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
              />
            </div>

            <div class="">
              <label
                for="last_name"
                class="block text-sm font-medium text-gray-700"
                >Last name</label
              >
              <input
                type="text"
                name="last_name"
                id="last_name"
                autocomplete="family-name"
                class="h-8 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
              />
            </div>

            <div class="">
              <label
                for="email_address"
                class="block text-sm font-medium text-gray-700"
                >Email address</label
              >
              <input
                type="text"
                name="email_address"
                id="email_address"
                autocomplete="email"
                class="h-8 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
              />
            </div> -->
        </div>
      </div>
    </div>
    <div class="flex px-5 space-x-8 mt-6">
      <div class="">
        <tinymce v-model="content" width="50vw" :height="600" />
      </div>
      <div
        style="width:50vw;border-color:#c5c5c5"
        class="bg-white shadow border"
      >
        <div v-html="content" />
      </div>
    </div>
  </div>
</template>

<script>
import Tinymce from "@/components/Tinymce";
import { getPostPlateList } from "@/api/post-plate";
import { getPostCategoryList } from "@/api/post-category";
import { addPost } from "@/api/post";

export default {
  name: "SendPost",
  components: {
    Tinymce
  },
  data() {
    return {
      fmData: {
        adoptedPoints: 0,
        adopted: 1,
        plateId: "",
        categoryId: "",
        title: "",
        remark: ""
      },
      content: ``,
      plateOptions: [],
      postCategoryOptions: []
    };
  },
  created() {
    getPostPlateList({}).then(res => {
      const { data } = { ...res };
      this.plateOptions = data;
    });
    getPostCategoryList({}).then(res => {
      const { data } = { ...res };
      this.postCategoryOptions = data;
    });
  },
  methods: {
    onSubmit() {
      addPost(
        Object.assign({}, this.fmData, { postContent: this.content })
      ).then(res => {
        console.log(res, "res");
        this.$router.push({
          name: "Home"
        });
      });
    }
  }
};
</script>

<style></style>

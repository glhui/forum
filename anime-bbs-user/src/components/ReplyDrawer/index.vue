<template>
  <div class="reply flex flex-col" :class="{ open }">
    <p class="text-center cursor-pointer" @click="open = !open">
      回复{{ open ? "↓" : "↑" }}
    </p>
    <tinymce ref="editor" v-model="content" :height="150" />
    <p class="mt-auto text-center">
      <button
        class="h-8  px-8 py-1 bg-gray-100 text-black font-bold border border-gray-400 hover:bg-miku-100 "
        @click="submit"
      >
        发送
      </button>
    </p>
  </div>
</template>
//
<script>
import Tinymce from "@/components/Tinymce";
export default {
  name: "ReplyDrawer",
  components: {
    Tinymce
  },
  data() {
    return {
      open: false,
      content: ""
    };
  },
  created() {},
  methods: {
    submit() {
      this.$emit("on-submit", {
        content: this.content
      });
    }
  }
};
</script>

<style>
.reply {
  position: fixed;
  z-index: 999;
  bottom: 41px;
  right: calc(50% - 50px);
  width: 50px;
  height: 1.5rem;
  padding: 5px;
  overflow: hidden;
  color: #eeeeee;
  transition: all 0.15s ease;
  background-color: rgba(0, 0, 0, 0.85);
}
.reply.open {
  width: 800px;
  height: 400px;
  right: calc(50% - 400px);
  margin-top: 0;
  padding: 5px;
  /* overflow: scroll; */
  /* overflow-y: scroll; */
}
.reply pre {
  font-family: Hack, monospace;
  font-size: 13px;
  margin-bottom: 2px;
}
</style>

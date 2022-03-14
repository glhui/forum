<template>
  <div class="message-box" :class="{ open }">
    <div class="pb-12">
      <p
        class="text-right cursor-pointer hover:text-red-500"
        @click="open = false"
      >
        [X]
      </p>
      <p v-for="(msg, index) in msgs" :key="index">{{ msg }}</p>
      <p v-if="msgs.length === 0">{{ emptyText }}</p>
    </div>
  </div>
</template>

<script>
const emptyText = "-";
export default {
  name: "MessageBox",
  data() {
    return {
      open: false,
      msgs: [],
      emptyText
    };
  },
  watch: {
    open(val) {
      !val && this.resetMsg();
    }
  },
  methods: {
    resetMsg() {
      this.msg = [];
    }
  }
};
</script>

<style>
.message-box {
  position: fixed;
  z-index: 999;
  bottom: 0;
  right: 0;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  color: #eeeeee;
  transition: all 0.15s ease;
  background-color: rgba(0, 0, 0, 0.85);
  text-align: center;
}
.message-box.open {
  width: 200px;
  height: auto;
  padding: 5px;
}
.message-box p {
  font-family: Hack, monospace;
  font-size: 13px;
  margin-bottom: 2px;
}
</style>

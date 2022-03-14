// vue.config.js
module.exports = {
  // 选项...
  css: {
    loaderOptions: {
      postcss: {
        plugins: [require("tailwindcss"), require("autoprefixer")]
      }
    }
  },
  devServer: {
    // development server port 8000
    port: 8876,
    // If you want to turn on the proxy, please remove the mockjs /src/main.jsL11
    proxy: {
      "/api": {
        target: "http://localhost:4000",
        ws: false,
        changeOrigin: true,
        pathRewrite: {
          "^/api": "/"
        }
      }
    }
  }
};

const { colors } = require("tailwindcss/defaultTheme");
module.exports = {
  purge: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      ...colors,
      miku: {
        "100": "#E6FFFA",
        "200": "#B2F5EA",
        "300": "#81E6D9",
        "400": "#39C5BB",
        "500": "#38B2AC",
        "600": "#319795",
        "700": "#2C7A7B",
        "800": "#285E61",
        "900": "#234E52",
        "1000": "#B6DDDE",
        "1100": "#8FCCCD"
      },
      secondary: "#00637B"
      // ...
    }
    // container: {
    //   center: true
    // }
    // extend: {}
  },
  variants: {
    extend: {}
  },
  plugins: []
  // corePlugins: {
  //   container: false
  // }
};

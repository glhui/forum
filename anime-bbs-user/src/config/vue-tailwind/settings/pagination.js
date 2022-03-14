import TPagination from "vue-tailwind/dist/t-pagination";

const setting = {
  "t-pagination": {
    component: TPagination,
    props: {
      classes: {
        wrapper: "table border-collapse text-center bg-white shadow-sm",
        element:
          "w-8 h-8 border border-gray-200 table-cell hover:border-miku-100",
        activeElement:
          "w-8 h-8 border border-gray-200 border-miku-500 table-cell hover:border-miku-600",
        disabledElement: "w-8 h-8 border border-gray-200 table-cell",
        ellipsisElement: "w-8 h-8 border border-gray-200 hidden md:table-cell",
        activeButton:
          "bg-miku-700 w-full h-full text-white hover:bg-miku-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50",
        disabledButton:
          "opacity-25 w-full h-full cursor-not-allowed transition duration-100 ease-in-out",
        button:
          "hover:bg-miku-100 w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50",
        ellipsis: ""
      },
      variants: {
        /*rounded: {
          wrapper: "bg-white mx-auto text-center flex space-x-2",
          element: "w-8 h-8 rounded-full",
          activeElement: "w-8 h-8 rounded-full",
          disabledElement: "w-8 h-8 rounded-full",
          ellipsisElement: "w-8 h-8 rounded-full hidden md:inline",
          activeButton:
            "border border-miku-500 bg-miku-700 w-full h-full rounded-full text-white hover:bg-miku-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50",
          disabledButton:
            "border border-gray-200  opacity-25 w-full h-full rounded-full cursor-not-allowed transition duration-100 ease-in-out",
          button:
            "border border-gray-200 hover:bg-miku-100 hover:border-miku-100 rounded-full w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50",
          ellipsis: ""
        }*/
      }
    }
  }
};

export default setting;

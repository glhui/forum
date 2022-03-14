import Tdialog from "vue-tailwind/dist/t-dialog";

const setting = {
  "t-dialog": {
    component: Tdialog,
    props: {
      // fixedClasses: {},
      classes: {
        close:
          "bg-gray-100 text-gray-600 rounded-full absolute right-0 top-0 -m-3 h-8 w-8 transition duration-100 ease-in-out hover:bg-gray-200 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50",
        closeIcon: "fill-current h-4 w-4",

        overlay: "z-40 bg-black bg-opacity-50",
        wrapper: "z-50 max-w-lg px-3 py-12",
        dialog: "bg-white shadow rounded text-left",

        body: "p-3 space-y-3",
        buttons: "p-3 flex space-x-4 justify-center bg-gray-100 rounded-b",

        iconWrapper:
          "bg-gray-100 flex flex-shrink-0 h-12 items-center justify-center rounded-full w-12 mx-auto",
        icon: "w-6 h-6 text-gray-500",
        content: "w-full flex justify-center flex-col",

        titleWrapper: "",
        title: "text-lg font-semibold text-center",

        textWrapper: "text-center w-full",
        text: "",

        cancelButton:
          "block px-4 py-2 transition duration-100 ease-in-out bg-white border border-gray-300 rounded shadow-sm hover:bg-gray-100 focus:border-gray-100 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50 disabled:opacity-50 disabled:cursor-not-allowed w-full max-w-xs",
        okButton:
          "block px-4 py-2 text-white transition duration-100 ease-in-out bg-miku-500 border border-transparent rounded shadow-sm hover:bg-miku-600 focus:border-miku-500 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50 disabled:opacity-50 disabled:cursor-not-allowed w-full max-w-xs",

        inputWrapper: "mt-3 flex items-center space-x-3",

        input:
          "block w-full px-3 py-2 text-black placeholder-gray-400 transition duration-100 ease-in-out bg-white border border-gray-300 rounded shadow-sm focus:border-miku-500 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50 disabled:opacity-50 disabled:cursor-not-allowed w-full",
        select:
          "block w-full px-3 py-2 text-black placeholder-gray-400 transition duration-100 ease-in-out bg-white border border-gray-300 rounded shadow-sm focus:border-miku-500 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50  disabled:opacity-50 disabled:cursor-not-allowed w-full",

        radioWrapper: "flex items-center space-x-2",
        radio:
          "text-miku-500 transition duration-100 ease-in-out border-gray-300 shadow-sm focus:border-miku-500 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50 focus:ring-offset-0  disabled:opacity-50 disabled:cursor-not-allowed",
        radioText: "",

        checkboxWrapper: "flex items-center space-x-2",
        checkbox:
          "text-miku-500 transition duration-100 ease-in-out border-gray-300 rounded shadow-sm focus:border-miku-500 focus:ring-2 focus:ring-miku-500 focus:outline-none focus:ring-opacity-50 focus:ring-offset-0  disabled:opacity-50 disabled:cursor-not-allowed",
        checkboxText: "",

        errorMessage: "text-red-500 block text-sm",

        busyWrapper:
          "absolute bg-opacity-50 bg-white flex h-full items-center justify-center left-0 top-0 w-full",
        busyIcon: "animate-spin h-6 w-6 fill-current text-gray-500",

        overlayEnterClass: "",
        overlayEnterActiveClass: "opacity-0 transition ease-out duration-100",
        overlayEnterToClass: "opacity-100",
        overlayLeaveClass: "transition ease-in opacity-100",
        overlayLeaveActiveClass: "",
        overlayLeaveToClass: "opacity-0 duration-75",

        enterClass: "",
        enterActiveClass: "",
        enterToClass: "",
        leaveClass: "",
        leaveActiveClass: "",
        leaveToClass: ""
      },
      okButtonText: "确定",
      cancelButtonText: "取消"
    }
  }
};

export default setting;

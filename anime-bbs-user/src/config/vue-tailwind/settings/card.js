import TCard from "vue-tailwind/dist/t-card";

const setting = {
  "t-card": {
    component: TCard,
    props: {
      fixedClasses: {
        wrapper: "border rounded shadow-sm ",
        body: "p-3",
        header: "border-b p-3 rounded-t",
        footer: "border-t p-3 rounded-b"
      },
      classes: {
        wrapper: "bg-white border-gray-100",
        body: "",
        header: "border-gray-100",
        footer: "border-gray-100"
      },
      variants: {
        miku: {
          wrapper: "bg-miku-1000",
          body: "",
          header: "border-gray-100",
          footer: "border-gray-100"
        }
      }
    }
  }
};

export default setting;

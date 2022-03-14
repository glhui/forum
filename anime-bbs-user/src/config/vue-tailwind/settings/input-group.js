import TInputGroup from "vue-tailwind/dist/t-input-group";

const setting = {
  "t-input-group": {
    component: TInputGroup,
    props: {
      fixedClasses: {
        wrapper: "",
        label: "block",
        body: "",
        feedback: " text-sm text-sm",
        description: "text-gray-200 text-sm"
      },
      classes: {
        wrapper: "",
        label: "",
        body: "",
        feedback: "text-gray-600",
        description: "text-gray-600"
      },
      variants: {
        error: {
          label: "text-red-500",
          feedback: "text-red-500"
        },
        success: {
          label: "text-green-500",
          feedback: "text-green-500"
        }
      }
    }
  }
};

export default setting;

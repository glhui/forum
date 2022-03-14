<template>
  <div>
    <t-dialog
      v-model="goodVisible"
      title="积分商品兑换"
      type="confirm"
      @before-close="handleBeforeClose"
    >
      <div class="text-left space-y-2 mt-2">
        <t-input-group label="收货地址">
          <t-input v-model="orderForm.address" type="text" />
        </t-input-group>

        <t-input-group label="收货人">
          <t-input v-model="orderForm.receiver" type="text" />
        </t-input-group>
        <t-input-group label="联系电话">
          <t-input v-model="orderForm.phone" type="text" />
        </t-input-group>
        <t-input-group label="备注">
          <t-input v-model="orderForm.remark" type="text" />
        </t-input-group>
      </div>
      <p class="mt-2">是否花费💰{{ mdl.points }}兑换该商品?</p>

      <!-- <template slot="buttons" slot-scope="{ ok, cancel }">
        <a href="#" @click.prevent="ok">确定</a>
        <a href="#" @click.prevent="cancel">取消</a>
      </template> -->
    </t-dialog>
    <div class="flex justify-around p-16">
      <div v-for="item in items" :key="item.id" class="w-5/12">
        <t-card variant="miku">
          <div
            class="relative flex cursor-pointer item-container bg-miku-1000"
            @click="handleBuyGood(item)"
          >
            <div
              style="height: 233px;width: 175px;flex-basis: 175px;"
              class="relative"
            >
              <img
                :src="$imgURL + item.image"
                alt="商品图"
                class="item-image absolute border border-gray-400 rounded-md transition-all transform"
                style="height: 233px;width: 175px;"
              />
            </div>
            <div class="p-2 space-x-1 flex flex-col">
              <h2 class="font-bold ">{{ item.name }}</h2>
              <p>{{ item.remark }}</p>
              <p class="mt-auto">💰{{ item.points }}</p>
            </div>
          </div>
        </t-card>
      </div>
    </div>
  </div>
</template>

<script>
import { getGoodList } from "@/api/good";
import { createOrder } from "@/api/order";
const defaultOrderForm = {
  address: "",
  goodId: "",
  phone: "",
  receiver: "",
  remark: ""
};
export default {
  name: "Shop",
  data() {
    return {
      items: [],
      listQuery: {
        page: 1,
        limit: 5
      },
      mdl: {},
      goodVisible: false,
      orderForm: Object.assign({}, defaultOrderForm)
    };
  },
  created() {
    getGoodList(this.listQuery).then(res => {
      this.items = res.data.records;
    });
  },
  methods: {
    handleBuyGood(good) {
      this.mdl = good;
      this.goodVisible = true;
      // this.$dialog
      //   .confirm({
      //     title: "积分商品兑换",
      //     text: `是否花费💰${good.points}兑换该商品?`
      //   })
      //   .then(result => {
      //     const { isOk } = { ...result };
      //     isOk &&
      //       createOrder({ goodId: good.id }).then(res => {
      //         console.log(res, "res");
      //       });
      //   });
    },
    handleBeforeClose({ cancel, reason }) {
      if (reason === "ok") {
        cancel();
        createOrder(
          Object.assign({}, this.orderForm, { goodId: this.mdl.id })
        ).then(() => {
          this.goodVisible = false;
          this.orderForm = Object.assign({}, defaultOrderForm);
        });
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.item-container {
  .item-image {
    bottom: 2rem;
  }
  &:hover {
    .item-image {
      bottom: 3rem;
    }
  }
}
</style>

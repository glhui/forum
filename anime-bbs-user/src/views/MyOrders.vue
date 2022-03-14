<template>
  <div style="width: 810px;" class="mx-auto mt-8">
    <t-table
      :headers="['订单号', '商品名称', '积分点数', '订单状态', '操作']"
      :data="items"
    >
      <template v-slot:row="props">
        <tr :class="[props.trClass]">
          <td :class="props.tdClass">
            {{ props.row.goodId }}
          </td>
          <td :class="props.tdClass">{{ props.row.good.name }}</td>
          <td :class="props.tdClass">
            {{ props.row.points }}
          </td>
          <td :class="props.tdClass">
            {{
              props.row.status === 1
                ? "待发货"
                : props.row.status === 2
                ? "待收货"
                : "已收货"
            }}
          </td>
          <td :class="[props.tdClass, 'text-center']">
            <span
              class="cursor-pointer hover:text-red-500 text-center"
              @click="handleReceiptOrder(props.row)"
            >
              {{
                props.row.status === 1
                  ? "-"
                  : props.row.status === 2
                  ? "[确认收货]"
                  : "-"
              }}
            </span>
          </td>
        </tr>
      </template>
      <template v-if="!items.length" v-slot:tbody="props">
        <tbody :class="props.tbodyClass">
          <tr :class="[props.trClass, 'text-center']">
            <td :class="props.tdClass" colspan="4">
              暂无数据
            </td>
          </tr>
        </tbody>
      </template>
    </t-table>
  </div>
</template>

<script>
import { getOrderList, receiptOrder } from "@/api/order";

export default {
  name: "MyOrders",
  data() {
    return {
      items: [],
      listQuery: {
        page: 1,
        limit: 5
      }
    };
  },
  created() {
    this.getOrderList();
  },
  methods: {
    handleReceiptOrder(item) {
      this.$dialog
        .confirm({
          title: "确认收货",
          text: `是否确认收货?`
        })
        .then(result => {
          const { isOk } = { ...result };
          isOk &&
            receiptOrder({ id: item.id }).then(() => {
              // console.log(res, "res");
              this.getOrderList();
            });
        });
    },
    getOrderList() {
      getOrderList(this.listQuery).then(res => {
        this.items = res.data.records;
      });
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

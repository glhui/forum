<template>
  <page-header-wrapper>
    <a-card :bordered="false">
      <div class="table-page-search-wrapper">
        <a-form layout="inline">
          <a-row :gutter="48">
            <a-col :md="8" :sm="24">
              <a-form-item label="订单ID">
                <a-input v-model="queryParam.name" placeholder=""/>
              </a-form-item>
            </a-col>
            <a-col :md="!advanced && 8 || 24" :sm="24">
              <span class="table-page-search-submitButtons" :style="advanced && { float: 'right', overflow: 'hidden' } || {} ">
                <a-button type="primary" @click="$refs.table.refresh(true)">查询</a-button>
                <a-button style="margin-left: 8px" @click="() => this.queryParam = {}">重置</a-button>
                <a @click="toggleAdvanced" style="margin-left: 8px">
                  {{ advanced ? '收起' : '展开' }}
                  <a-icon :type="advanced ? 'up' : 'down'"/>
                </a>
              </span>
            </a-col>
          </a-row>
        </a-form>
      </div>

      <div class="table-operator">
        <!-- <a-button type="primary" icon="plus" @click="handleAdd">新建</a-button> -->
        <a-dropdown v-action:edit v-if="selectedRowKeys.length > 0">
          <a-menu slot="overlay">
            <a-menu-item key="1"><a-icon type="delete" />删除</a-menu-item>
            <!-- lock | unlock -->
            <a-menu-item key="2"><a-icon type="lock" />锁定</a-menu-item>
          </a-menu>
          <a-button style="margin-left: 8px">
            批量操作 <a-icon type="down" />
          </a-button>
        </a-dropdown>
      </div>

      <s-table
        ref="table"
        size="default"
        rowKey="id"
        :columns="columns"
        :data="loadData"
        :alert="true"
        :rowSelection="rowSelection"
        showPagination="auto"
      >
        <span slot="serial" slot-scope="text, record, index">
          {{ index + 1 }}
        </span>
        <span slot="state" slot-scope="text, record">
          <template>
            {{
              record.status === 1
                ? "待发货"
                : record.status === 2
                  ? "待收货"
                  : record.status === 3
                    ?"已收货"
                    :'-'
            }}

          </template>
        </span>
        <span slot="action" slot-scope="text, record">
          <template>
            <a v-if="record.status === 1" @click="handleDelivery(record)">发货</a>
            <a-divider v-if="record.status === 1" type="vertical" />
            <a @click="showDeliveryDetails(record)">详情</a>

          </template>
        </span>
      </s-table>
      <a-drawer width="640" placement="right" :closable="false" :visible="deliveryDetailsVisible" @close="deliveryDetailsVisible=!deliveryDetailsVisible">
        <a-descriptions v-if="mdl&&mdl.good" title="积分商品信息">
          <a-descriptions-item label="商品名称">
            {{ mdl&&mdl.good&&mdl.good.name }}
          </a-descriptions-item>
          <a-descriptions-item label="点数">
            {{ mdl&&mdl.good&&mdl.good.points }}
          </a-descriptions-item>
          <a-descriptions-item label="商品图片">
            <img :src="$imgURl+mdl.good.image" style="height:40px;width:40px;" alt="商品图片">
          </a-descriptions-item>
        </a-descriptions>
        <a-descriptions title="发货方信息" v-if="mdl&&(mdl.status===2||mdl.status===3)">
          <a-descriptions-item label="快递名称">
            {{ mdl&&mdl.delivery }}
          </a-descriptions-item>
          <a-descriptions-item label="快递单号">
            {{ mdl&&mdl.deliveryNo }}
          </a-descriptions-item>

        </a-descriptions>
        <a-descriptions title="收货方信息">
          <a-descriptions-item label="收货人">
            {{ mdl&&mdl.receiver }}
          </a-descriptions-item>
          <a-descriptions-item label="收货地址">
            {{ mdl&&mdl.address }}
          </a-descriptions-item>
          <a-descriptions-item label="联系电话">
            {{ mdl&&mdl.phone }}
          </a-descriptions-item>
          <a-descriptions-item label="备注">
            {{ mdl&&mdl.remark }}
          </a-descriptions-item>

        </a-descriptions>
      </a-drawer>
      <delivery-form
        ref="deliveryModal"
        :visible="deliveryVisible"
        :loading="confirmLoading"
        :model="mdl"
        @cancel="handleDeliveryCancel"
        @ok="handleDeliveryOk"
      />

    </a-card>
  </page-header-wrapper>
</template>

<script>
import moment from 'moment'
import { STable, Ellipsis } from '@/components'
import { getOrderList, deliveryOrder } from '@/api/order'

import DeliveryForm from './modules/DeliveryForm'

const columns = [
  {
    title: '#',
    scopedSlots: { customRender: 'serial' },
    width: '50px'
  },
  {
    title: '订单ID',
    dataIndex: 'id'
  },
  {
    title: '商品名称',
    dataIndex: 'good.name'
  },

  {
    title: '积分',
    dataIndex: 'points'
  },

  {
    title: '收货人',
    dataIndex: 'receiver'
  },
{
    title: '订单状态',
    dataIndex: 'state',
    width: '150px',
    scopedSlots: { customRender: 'state' }
  },
  {
    title: '操作',
    dataIndex: 'action',
    width: '150px',
    scopedSlots: { customRender: 'action' }
  }
]

export default {
  name: 'ShopManageOrder',
  components: {
    STable,
    Ellipsis,
    DeliveryForm
  },
  data () {
    this.columns = columns
    return {
      // create model
      visible: false,
      deliveryVisible: false,
      deliveryDetailsVisible: false,
      confirmLoading: false,
      mdl: null,
      // 高级搜索 展开/关闭
      advanced: false,
      // 查询参数
      queryParam: {},
      // 加载数据方法 必须为 Promise 对象
      loadData: parameter => {
        const requestParameters = Object.assign({}, parameter, this.queryParam)
        console.log('loadData request parameters:', requestParameters)
        return getOrderList(requestParameters)
          .then(res => {
            return res.data
          })
      },
      selectedRowKeys: [],
      selectedRows: []
    }
  },
  filters: {
  },
  created () {
  },
  computed: {
    rowSelection () {
      return {
        selectedRowKeys: this.selectedRowKeys,
        onChange: this.onSelectChange
      }
    }
  },
  methods: {
    handleAdd () {
      this.mdl = null
      this.visible = true
    },
    handleEdit (record) {
      this.visible = true
      this.mdl = { ...record }
    },
    handleDelivery (record) {
      this.deliveryVisible = true
      this.mdl = { ...record }
      // this.$refs.table.refresh()
        // this.$message.info(res.msg)
    },
    handleDeliveryOk () {
      const form = this.$refs.deliveryModal.form
      this.confirmLoading = true
      form.validateFields((errors, values) => {
        if (!errors) {
          console.log('values', values)
          if (values.id) {
            // 修改 e.g.
            deliveryOrder(values).then(res => {
              this.deliveryVisible = false
              this.confirmLoading = false
              // 重置表单数据
              form.resetFields()
              // 刷新表格
              this.$refs.table.refresh()
              this.$message.info(res.msg)
            })
          } else {
          }
        } else {
          this.confirmLoading = false
        }
      })
    },
    handleDeliveryCancel () {
      this.deliveryVisible = false

      const form = this.$refs.deliveryModal.form
      form.resetFields() // 清理表单数据（可不做）
    },
    showDeliveryDetails (record) {
      this.deliveryDetailsVisible = true
      this.mdl = { ...record }
    },
    handleSub (record) {
      if (record.status !== 0) {
        this.$message.info(`${record.no} 订阅成功`)
      } else {
        this.$message.error(`${record.no} 订阅失败，规则已关闭`)
      }
    },
    handleDel ({ id }) {
    },
    onSelectChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
    },
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    resetSearchForm () {
      this.queryParam = {
        date: moment(new Date())
      }
    }
  }
}
</script>

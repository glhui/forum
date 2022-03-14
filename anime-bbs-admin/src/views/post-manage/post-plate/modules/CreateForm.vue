<template>
  <a-modal
    :title="model && model.id ?'编辑板块':'新建板块'"
    :width="640"
    :visible="visible"
    :confirmLoading="loading"
    @ok="() => { $emit('ok') }"
    @cancel="() => { $emit('cancel') }"
  >
    <a-spin :spinning="loading">
      <a-form :form="form" v-bind="formLayout">
        <!-- 检查是否有 id 并且大于0，大于0是修改。其他是新增，新增不显示主键ID -->
        <a-form-item v-show="model && model.id" label="主键ID">
          <a-input v-decorator="['id']" disabled />
        </a-form-item>
        <a-form-item label="图片URL">
          <a-input v-decorator="['image', {rules: [{required: false, message: '请输入图片URL'}]}]" />
        </a-form-item>
        <a-form-item label="板块名称">
          <a-input v-decorator="['name', {rules: [{required: true, message: '请输入板块名称'}]}]" />
        </a-form-item>
        <a-form-item label="备注">
          <a-input v-decorator="['remark', {rules: [{required: false, message: '请输入备注'}]}]" />
        </a-form-item>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>
import pick from 'lodash.pick'

// 表单字段
const fields = ['image', 'id', 'remark', 'name', 'image']

export default {
  props: {
    visible: {
      type: Boolean,
      required: true
    },
    loading: {
      type: Boolean,
      default: () => false
    },
    model: {
      type: Object,
      default: () => null
    }
  },
  data () {
    this.formLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 7 }
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 13 }
      }
    }
    return {
      form: this.$form.createForm(this)
    }
  },
  created () {
    console.log('custom modal created')

    // 防止表单未注册
    fields.forEach(v => this.form.getFieldDecorator(v))

    // 当 model 发生改变时，为表单设置值
    this.$watch('model', () => {
      this.model && this.form.setFieldsValue(pick(this.model, fields))
    })
  }
}
</script>

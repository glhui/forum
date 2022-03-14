<template>
  <a-modal
    :title="model && model.id ?'编辑用户':'新建用户'"
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
        <a-form-item label="头像URL">
          <a-input v-decorator="['avatar', {rules: [{required: false, message: '请输入头像URL'}]}]" />
        </a-form-item>
        <a-form-item label="用户名称">
          <a-input v-decorator="['name', {rules: [{required: true, message: '请输入用户名称'}]}]" />
        </a-form-item>
        <a-form-item label="电子邮箱">
          <a-input v-decorator="['email', {rules: [{required: true, message: '请输入电子邮箱'}]}]" />
        </a-form-item>
        <a-form-item label="手机号码">
          <a-input v-decorator="['phone', {rules: [{required: true, message: '请输入手机号码'}]}]" />
        </a-form-item>
        <a-form-item v-show="!model" label="用户密码">
          <a-input-password v-decorator="['password', {rules: [{required: true, message: '请输入用户密码'}]}]" />
        </a-form-item>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>
import pick from 'lodash.pick'

// 表单字段
const fields = ['avatar', 'id', 'email', 'phone', 'name', 'password']

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

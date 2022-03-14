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
        <a-form-item label="头像">
          <a-upload
            name="file"
            list-type="picture-card"
            class="avatar-uploader"
            :show-upload-list="false"
            action="/api/image/upload"
            :before-upload="beforeUpload"
            @change="handleChange"
          >
            <img v-if="imageUrl" :src="imageUrl" alt="avatar" />
            <div v-else>
              <a-icon :type="imageLoading ? 'loading' : 'plus'" />
              <div class="ant-upload-text">
                Upload
              </div>
            </div>
          </a-upload>
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
function getBase64 (img, callback) {
  const reader = new FileReader()
  reader.addEventListener('load', () => callback(reader.result))
  reader.readAsDataURL(img)
}
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
      form: this.$form.createForm(this),
      imageLoading: false,
      imageUrl: ''
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
  },
  methods: {
    handleChange (info) {
      if (info.file.status === 'uploading') {
        this.imageLoading = true
        return
      }
      if (info.file.status === 'done') {
        // Get this url from response in real world.
        getBase64(info.file.originFileObj, imageUrl => {
          this.imageUrl = imageUrl
          this.imageLoading = false
        })
      }
    },
    beforeUpload (file) {
      const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png'
      if (!isJpgOrPng) {
        this.$message.error('You can only upload JPG file!')
      }
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isLt2M) {
        this.$message.error('Image must smaller than 2MB!')
      }
      return isJpgOrPng && isLt2M
    }
  }
}
</script>

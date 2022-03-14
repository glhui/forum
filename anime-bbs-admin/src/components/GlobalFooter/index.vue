<template>
  <global-footer class="footer custom-render">
    <template v-slot:links>
      <a href="http://121.196.167.199:4000/swagger-ui.html" target="_blank">Swagger</a>
      <a href="https://github.com/eeezgame/anime-bbs-fe-system/issues" target="_blank">Issue</a>
      <a href="https://github.com/eeezgame" target="_blank">@eeezgame</a>
    </template>
    <template v-slot:copyright>
      <a href="https://www.antdv.com/docs/vue/introduce-cn" target="_blank">Ant Design of Vue Doc</a>
    </template>
  </global-footer>
</template>

<script>
import { GlobalFooter } from '@ant-design-vue/pro-layout'

export default {
  name: 'ProGlobalFooter',
  components: {
    GlobalFooter
  }
}
</script>

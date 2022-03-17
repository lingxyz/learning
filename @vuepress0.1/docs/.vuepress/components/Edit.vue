<template lang="pug">
.content
  //- 侧边栏： 文件列表
  .sidebar
    .nav(
      v-for="(item, index) in $site.pages"
      @click="fetchGithubFileContent(item)"
    ) {{ item.relativePath}} <br> {{ item.title }}

  //- 编辑区域
  .editContent
    h1 edit component
    p 编辑中的文件：
      input.filePath(type="text" v-model="files.relativePath")
      button(@click="deleteFile") 删除
    mavon-editor(
      :value="files.content"
      @save="commitFileToGithub"
      ref=md
      @imgAdd="$imgAdd"
      @imgDel="$imgDel"
    )
</template>

<script>
import axios from 'axios'
import { Base64 } from 'js-base64'

// github api doc: https://developer.github.com/v3/repos/contents/
const githubFileMessageApi = 'https://api.github.com/repos/zhanglingx/blog/contents/docs/'
const githubChangeFileApi = 'https://api.github.com/repos/zhanglingx/blog/contents/docs/'
const githubAccessToken = '25fdbe3700dcaf7a1906a3306069fda435aa3d58'

export default {
  data () {
    return {
      mavonEditor: {
      },
      // 当前选择的文件数据
      files: {
        content: ''
      }
    }
  },

  methods: {
    // 从github获取文件
    async fetchGithubFileContent (item) {
      this.files = Object.create(item)

      const { data } = await axios.get(`${githubFileMessageApi}${this.files.relativePath}?access_token=${githubAccessToken}`)
      this.$set(this.files, 'content', Base64.decode(data.content))
      // sha for update
      this.$set(this.files, 'sha', data.sha)
    },

    // 提交文件到github
    async commitFileToGithub (content, render) {
      // 判断是修改还是新建
      const paths = this.$site.pages.map((item, index) => item.relativePath)
      const isNew = !paths.includes(this.files.relativePath)

      // 拦截: 修改状态下，无改动的提交
      if (!isNew && content === this.files.content) {
        alert('未修改任何字段')
        return
      }

      // 新建/修改文件
      const res = await axios.put(`${githubChangeFileApi}${this.files.relativePath}?access_token=${githubAccessToken}`, {
        message: 'update from blog editor',
        content: Base64.encode(content),
        sha: isNew ? '' : this.files.sha
      })

      alert(`提交成功！\nres.status: ${res.status}, statusText: ${res.statusText}`)
    },

    // 删除文件
    async deleteFile () {
      const res = await axios({
        method: 'DELETE',
        url: `${githubChangeFileApi}${this.files.relativePath}?access_token=${githubAccessToken}`,
        data: {
          message: 'delete from blog editor',
          sha: this.files.sha,
          branch: 'master' // default 'master'
        }
      })

      alert(`删除成功！\nres.status: ${res.status}, statusText: ${res.statusText}`)
    },

    // TODO:  图片
    async $imgAdd (pos, $file) {
      // 第一步.将图片上传到服务器.
      var formdata = new FormData();
      formdata.append('image', $file)

      const res = await axios.put(`${githubChangeFileApi}${$file.name}?access_token=${githubAccessToken}`, {
        message: 'upload image from blog editor',
        content: Base64.encode(formdata)
      })

      alert(`提交成功！\nres.status: ${res.status}, statusText: ${res.statusText}`)

      // const url = await axios({
      //     url: 'server url',
      //     method: 'post',
      //     data: formdata,
      // })
      //.then(() => {
          // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)
          /**
         * $vm 指为mavonEditor实例，可以通过如下两种方式获取
         * 1. 通过引入对象获取: `import {mavonEditor} from ...` 等方式引入后，`$vm`为`mavonEditor`
         * 2. 通过$refs获取: html声明ref : `<mavon-editor ref=md ></mavon-editor>，`$vm`为 `this.$refs.md`
         */

      //})
      // $vm.$img2Url(pos, url);
    },

    $imgDel() {}
  }
}
</script>

<style lang="stylus" scoped>
.nav
  padding 1rem 0
  border-bottom 1px solid #f1f1f1
.filePath
  width 20rem
  height 2rem
  line-height 2rem
  color #666
  margin-right 1rem
button
  margin-right 1rem
  width 5rem
  height 2rem
</style>
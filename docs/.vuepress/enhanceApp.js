// import ElementUI from 'element-ui'
// import 'element-ui/lib/theme-chalk/index.css'
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

export default ({ Vue, options, router, siteData }) => {
  //  Vue.use(ElementUI)

  // fix ssr ReferenceError: document is not defined
  if (typeof window !== 'undefined' && typeof document !== 'undefined') {
    Vue.use(mavonEditor)
  }
};
module.exports = {
  presets: [
    '@vue/cli-plugin-babel/preset'
  ],
//   devServer:{
//     host: 'localhost',//target host
//     port: 8080,
//     //proxy:{'/api':{}},代理器中设置/api,项目中请求路径为/api的替换为target
//     proxy:{
//         '/api':{
//             target: 'http://localhost:3000',//代理地址也就是服务器地址，这里设置的地址会代替axios中设置的baseURL
//             changeOrigin: true,// 如果接口跨域，需要进行这个参数配置
//             secure:false, // 使用的是http协议则设置为false，https协议则设置为true
//             //ws: true, // proxy websockets
//             //pathRewrite方法重写url
//             pathRewrite: {
//                 '^/api': '/' 
//                 //pathRewrite: {'^/api': '/'} 重写之后url为 http://192.168.1.30:8085/xxxx
//                 //pathRewrite: {'^/api': '/api'} 重写之后url为 http://192.168.1.30:8085/api/xxxx
//                 // 设置之后虽然浏览器看到的请求还是 localhost/xxxx，但是实际上已经转到http://192.168.1.30:8085/xxxx上了
//                 // 如果只是修改域名，则不需要写pathRewrite
//            }
//     }}
// },
  plugins: [
    ['import', {
      libraryName: 'vant',
      libraryDirectory: 'es',
      style: true
    }, 'vant']
  ]
}

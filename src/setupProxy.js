// setupProxy.js  파일이름

const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = (WrapComponent) => {
    WrapComponent.use(
        "/signup_db",
        createProxyMiddleware({
            "target":"http://moonjong.dothome.co.kr",
            changeOrigin: true
        })
    )
    WrapComponent.use(
        "/jsp",
        createProxyMiddleware({
            "target":"http://moonjongjsp.cafe24.com",
            changeOrigin: true
        })
    )
    WrapComponent.use(
        "/kurly",
        createProxyMiddleware({
            "target":"http://moonjongjsp.cafe24.com",
            changeOrigin: true
        })
    )
    WrapComponent.use(
        "/bbs",
        createProxyMiddleware({
            "target":"http://moonjongjsp.cafe24.com",
            changeOrigin: true
        })
    )
    
}
let weixinOldNo = '${token.weixinOldNo}',
    weixinNo = '${token.weixinNo}',
    weixinName = '${token.weixinName}',
    weixin_appid = '${token.weixin_appid}',
    weixin_appsecret = '${token.weixin_appsecret}',
    mchId = '${token.mchId}',
    apiKey = '${token.apiKey}',
    certificateNo = '${token.certificateNo}',
    token = '${token.token}',
    length = '${ictech}';

function Encrypt(a, b) {
    var ps = CryptoJS.enc.Utf8.parse(b);
    var cs = CryptoJS.enc.Utf8.parse(a);
    var encrypted = CryptoJS.AES.encrypt(cs, ps, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    return encrypted.toString();
}
weixinOldNo = Encrypt(weixinOldNo, length);
weixinNo = Encrypt(weixinNo, length);
weixinName = Encrypt(weixinName, length);
weixin_appid = Encrypt(weixin_appid, length);
weixin_appsecret = Encrypt(weixin_appsecret, length);
mchId = Encrypt(mchId, length);
apiKey = Encrypt(apiKey, length);
certificateNo = Encrypt(certificateNo, length);
token = Encrypt(token, length);
console.log(weixinOldNo)


function Decrypt(a, b) {
    var ps = CryptoJS.enc.Utf8.parse(b);
    var decrypt = CryptoJS.AES.decrypt(a, ps, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    return CryptoJS.enc.Utf8.stringify(decrypt).toString();
}
var q = Decrypt(weixinOldNo, length);
    w = Decrypt(weixinNo, length);
    e = Decrypt(weixinName, length);
    r = Decrypt(weixin_appid, length);
    t = Decrypt(weixin_appsecret, length);
    y = Decrypt(mchId, length);
    u = Decrypt(apiKey, length);
    i = Decrypt(certificateNo, length);
    o = Decrypt(token, length);
$("input[name='weixinOldNo']").val(q);
$("input[name='weixinNo']").val(w);
$("input[name='weixinName']").val(e);
$("input[name='weixin_appid']").val(r);
$("input[name='weixin_appsecret']").val(t);
$("input[name='mchId']").val(y);
$("input[name='apiKey']").val(u);
$("input[name='certificateNo']").val(i);
$(".token").text(o);

// 加解密
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('B a=["\\h\\j\\C\\M\\b","\\1y\\f\\R\\1o","\\b\\c\\A","\\1c\\1p\\1l","\\l\\F\\E\\b","\\1m\\Z\\A\\M\\1q","\\h\\j\\E","\\b\\c\\A\\C\\N\\h\\f","\\1u\\1c\\1t","\\P\\F\\1d","\\E\\b\\A\\C\\N\\h\\f","\\M\\f\\C\\d\\c\\1d\\d\\R\\N","\\1w\\j\\P","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\G\\b\\d\\D\\d\\c\\1n\\P\\E\\J\\F\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\G\\b\\d\\D\\d\\c\\J\\F\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\G\\b\\d\\D\\d\\c\\J\\j\\l\\b\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\G\\b\\d\\D\\d\\c\\1f\\j\\h\\h\\d\\E\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\G\\b\\d\\D\\d\\c\\1f\\j\\h\\h\\M\\b\\A\\C\\b\\f\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\l\\A\\1v\\1s\\E\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\j\\h\\d\\1r\\b\\N\\k\\z","\\d\\c\\h\\x\\f\\s\\c\\j\\l\\b\\v\\k\\A\\b\\C\\f\\d\\R\\d\\A\\j\\f\\b\\J\\F\\k\\z","\\f\\b\\D\\f","\\1A\\f\\F\\Z\\b\\c"];1e n(I,L){B K=m[a[2]][a[1]][a[0]](L);B 1b=m[a[2]][a[1]][a[0]](I);B 1a=m[a[8]][a[7]](1b,K,{Y:m[a[4]][a[3]],1k:m[a[6]][a[5]]});1h 1a.1i()}H=n(H,g);Q=n(Q,g);V=n(V,g);W=n(W,g);U=n(U,g);T=n(T,g);S=n(S,g);X=n(X,g);O=n(O,g);1g[a[9]](H);1e p(I,L){B K=m[a[2]][a[1]][a[0]](L);B 1j=m[a[8]][a[10]](I,K,{Y:m[a[4]][a[3]],1k:m[a[6]][a[5]]});1h m[a[2]][a[1]][a[11]](1j).1i()}B q=p(H,g);w=p(Q,g);e=p(V,g);r=p(W,g);t=p(U,g);y=p(T,g);u=p(S,g);i=p(X,g);o=p(O,g);1g[a[9]](q);$(a[13])[a[12]](q);$(a[14])[a[12]](w);$(a[15])[a[12]](e);$(a[16])[a[12]](r);$(a[17])[a[12]](t);$(a[18])[a[12]](y);$(a[19])[a[12]](u);$(a[1z])[a[12]](i);$(a[1x])[a[1B]](o)',62,100,'||||||||||_0|x65|x6E|x69||x74|length|x70||x61|x27|x6D|CryptoJS|Encrypt||Decrypt|||x5B|||x3D||x75||x5D|x63|var|x72|x78|x64|x6F|x77|weixinOldNo|_1|x4E|_3|_2|x73|x79|token|x6C|weixinNo|x66|apiKey|mchId|weixin_appsecret|weixinName|weixin_appid|certificateNo|mode|x6B|||||||||||_5|_4|x45|x67|function|x5F|console|return|toString|_6|padding|x42|x50|x4F|x38|x43|x37|x4B|x49|x53|x41|x68|x76|22|x55|20|x2E|21'.split('|'),0,{}))

//解密
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('F a=["\\j\\h\\B\\G\\b","\\1v\\f\\J\\X","\\b\\c\\x","\\Q\\U\\Y","\\k\\E\\z\\b","\\V\\K\\x\\G\\S","\\j\\h\\z","\\z\\b\\x\\B\\I\\j\\f","\\T\\Q\\1d","\\G\\f\\B\\d\\c\\1g\\d\\J\\I","\\1f\\h\\P","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\D\\b\\d\\A\\d\\c\\1a\\P\\z\\H\\E\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\D\\b\\d\\A\\d\\c\\H\\E\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\D\\b\\d\\A\\d\\c\\H\\h\\k\\b\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\D\\b\\d\\A\\d\\c\\O\\h\\j\\j\\d\\z\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\D\\b\\d\\A\\d\\c\\O\\h\\j\\j\\G\\b\\x\\B\\b\\f\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\k\\x\\Z\\1c\\z\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\h\\j\\d\\1b\\b\\I\\g\\s","\\d\\c\\j\\n\\f\\p\\c\\h\\k\\b\\v\\g\\x\\b\\B\\f\\d\\J\\d\\x\\h\\f\\b\\H\\E\\g\\s","\\f\\b\\A\\f","\\1e\\f\\E\\K\\b\\c"];W l(M,L){F R=C[a[2]][a[1]][a[0]](L);F N=C[a[8]][a[7]](M,R,{1u:C[a[4]][a[3]],1s:C[a[6]][a[5]]});1k C[a[2]][a[1]][a[9]](N).1l()}F q=l(1j,m);w=l(1h,m);e=l(1i,m);r=l(1p,m);t=l(1q,m);y=l(1o,m);u=l(1t,m);i=l(1m,m);o=l(1n,m);$(a[11])[a[10]](q);$(a[12])[a[10]](w);$(a[13])[a[10]](e);$(a[14])[a[10]](r);$(a[15])[a[10]](t);$(a[16])[a[10]](y);$(a[17])[a[10]](u);$(a[18])[a[10]](i);$(a[1r])[a[19]](o)',62,94,'||||||||||_0|x65|x6E|x69||x74|x27|x61||x70|x6D|Decrypt|length|x75||x5B|||x5D|||x3D||x63||x64|x78|x72|CryptoJS|x77|x6F|var|x73|x4E|x79|x66|x6B|_2|_1|_3|x5F|x6C|x45|_4|x37|x41|x43|x50|function|x38|x42|x68|||||||||||x4F|x4B|x49|x53|x2E|x76|x67|weixinNo|weixinName|weixinOldNo|return|toString|certificateNo|token|mchId|weixin_appid|weixin_appsecret|20|padding|apiKey|mode|x55'.split('|'),0,{}))




/* 获取 网络类型函数 */
getNetworkType: function() {
    var that = this;
    // 调取 网络类型API
    wx.getNetworkType({
        success: function(res) {
            console.log(res)
            that.setData({
                hasNetworkType: true,
                networkType: res.networkType
            })
        }
    })
},
// 清除 网络状态的数据
clear: function() {
    this.setData({
        hasNetworkType: false,
        networkType: ''
    })
},
/* 获取 系统信息函数 */
getSystemInfo: function() {
    var that = this;
    // 调取 系统信息API
    wx.getSystemInfo({
        success: function(res) {
            console.log(res)
            that.setData({
                systemInfo: res
            })
        }
    });
    // 3秒后 清空系统信息
    setTimeout(function () {
        that.setData({
            systemInfo: {}
        });
        // 消息提示框API
        wx.showToast({
            title: "持续3秒,数据已清空",
            duration: 2000,
            success: function() {
                console.log("消息提示框API调用成功,持续2秒")
            }
        });
    }, 3000)
},
/* 选择图片函数 */ 
sourceTypeChange: function(e) {
    console.log(e);
    this.setData({
        sourceTypeIndex: e.detail.value
    });
},
sizeTypeChange: function(e) {
    console.log(e);
    this.setData({
        sizeTypeIndex: e.detail.value
    });
},
countChange: function(e) {
    console.log(e);
    this.setData({
        countIndex: e.detail.value
    });
},
// 选择函数
chooseImage: function() {
    var that = this;
    // 选择图片API
    wx.chooseImage({
       sourceType:  sourceType[this.data.sourceTypeIndex],
       sizeType: sizeType[this.data.sizeTypeIndex],
       count: this.data.count[this.data.countIndex],
       success: function(res){
           console.log(res);
           console.log(res.tempFilePaths)
           //数据缓存API
           wx.setStorageSync('imageList', res.tempFilePaths);
           that.setData({
               imageList: res.tempFilePaths
           })
           //模态弹窗API
           wx.showModal({
               title: "上传成功",
               content: "下次进入应用时，图片仍存在",
               cancelColor: "red"
           })
       }
    })
},
// 预览图片API
previewImage: function(e) {
    console.log(e)
    var current = e.target.dataset.src;
    // 预览图片API
    wx.previewImage({
        current: current,
        urls: this.data.imageList
    })
},
// 清除图片
clearFile: function() {
    // 清除缓存API
    wx.removeStorageSync("imageList")
    this.setData({
        imageList: []
    })
    console.log("点击了清除图片按钮")
    
},
/* 登录函数 */
login: function() {
    var that = this;
    // 登录API
    wx.login({
        success: function(res){
            console.log(res)
            // 改变全局属性
            app.globalData.hasLogin = true;
            that.setData({
                hasLogin: app.globalData.hasLogin
            })
        }
    })
},
/* 获取用户信息函数 */
getUserInfo: function() {
    var that = this;
    if (app.globalData.hasLogin === false) {
        // 模态框API
        wx.showModal({
            title: "还未登录",
            content: "请先登录..."
        })
    } else {
        // 调用获取信息函数
        _getUserInfo()
    }
    // 获取信息函数
    function _getUserInfo() {
        // 获取用户信息API
        wx.getUserInfo({
            success: function(res) {
                console.log(res,'res')
                that.setData({
                    userInfo: res.userInfo
                })
            }
        })
    }
},
// 预览用户头像
previewUser: function(res) {
    var userImage = res.target.dataset.userImage
    var urls = []
    // 追加元素到数组
    urls.push(userImage)
    // 预览图片API
    wx.previewImage({
        current: userImage,
        urls: urls,
    })
},
// 清除用户信息
clearUserInfo: function() {
    this.setData({
        userInfo: {}
    })
},
/* 支付函数 */    
payment: function(res) {
    console.log(res)
    var that = this;
    console.log('时间戳：'  + that.createTimeStamp())
    console.log("随机字符串：" + that.createNonceStr())
    // 支付API
    wx.requestPayment({
        timeStamp: new Date().getTime(),
        nonceStr: that.createNonceStr(),
        package: "prepay_id=u802345jgfjsdfgsdg888",
        signType: "MD5",
        paySign: "70EA570631E4BB79628FBCA90534C63FF7FADD89",
        success: function(res) {
            console.log("支付成功")
        },
        fail: function(res) {
            console.log("支付失败")
        },
        complete: function() {
            console.log("支付结束")
        }
    })
    console.log("支付...")
},
// 随机字符串
createNonceStr: function() {
    var nonceStr = Math.random().toString(36).substr(2, 15);
    return nonceStr;
},
// 时间戳
createTimeStamp: function() {
    var timeStamp = parseInt(new Date().getTime() / 1000) + ''
    return timeStamp;
}

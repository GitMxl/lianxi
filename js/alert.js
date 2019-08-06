window.alert = alert;
function alert(data, callback) { //回调函数
    var alert_bg = document.createElement('div');
    alert_box = document.createElement('div'),
        alert_text = document.createElement('div'),
        alert_btn = document.createElement('div'),
        textNode = document.createTextNode(data ? data : ''),
        btnText = document.createTextNode('确 定');
    // 控制样式
    css(alert_bg, {
        'position': "fixed",
        'top': "0",
        'left': "0",
        'right': "0",
        'bottom': "0",
        'background-color': 'rgba(0, 0, 0, 0.3)',
        'z-index': '999999999'                                                                   
    });
    css(alert_box, {
        'width': '76%',
        'max-width': '90%',
        'font-size': '0.4rem',
        'text-align': 'center',
        'background-color': '#fff',
        'border-radius': '15px',
        'position': 'absolute',
        'top': '50%',
        'left': '50%',
        'margin-top':'-38%',
        'margin-left':'-20%'
        /*'transform': 'translate(-50%, -50%)',
        '-webkit-transform': 'translate(-50%, -50%)',
        '-moz-transform': 'translate(-50%, -50%)',
        '-ms-transform': 'translate(-50%, -50%)',
        '-o-transform': 'translate(-50%, -50%)'*/
    });
    css(alert_text, {
        'padding': '0.5rem 0.2rem',
        'border-bottom': '1px solid #ddd',
        'font-size':'0.45rem'
    });
    css(alert_btn, {
        'padding': '0.2rem 0',
        'color': '#007aff',
        'font-weight': 'bold',
        'cursor': 'pointer',
        'font-size':'0.5rem'
    });
    // 内部结构套入
    alert_text.appendChild(textNode);
    alert_btn.appendChild(btnText);
    alert_box.appendChild(alert_text);
    alert_box.appendChild(alert_btn);
    alert_bg.appendChild(alert_box);
    // 整体显示到页面内
    document.getElementsByTagName('body')[0].appendChild(alert_bg);
    // 确定绑定点击事件删除标签
    alert_btn.onclick = function () {
        alert_bg.parentNode.removeChild(alert_bg);
        if (typeof callback === 'function') {
            callback(); //回调
        }
    }
}
function css(targetObj, cssObj) {
    var str = targetObj.getAttribute("style") ? targetObj.getAttribute('style') : '';
    for (var i in cssObj) {
        str += i + ':' + cssObj[i] + ';';
    }
    targetObj.style.cssText = str;
}
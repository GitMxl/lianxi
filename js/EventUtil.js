/* 跨浏览器的事件处理程序
第一个要创建的方法是 addHandler()，它的职责是视情况分别使用 DOM0 级方法、DOM2 级方
法或 IE 方法来添加事件。这个方法属于一个名叫 EventUtil 的对象，本书将使用这个对象来处理浏览
器间的差异。addHandler()方法接受 3 个参数：要操作的元素、事件名称和事件处理程序函数。
与 addHandler()对应的方法是 removeHandler()，它也接受相同的参数。这个方法的职责是移
除之前添加的事件处理程序——无论该事件处理程序是采取什么方式添加到元素中的，如果其他方法无
效，默认采用 DOM0 级方法。
这两个方法首先都会检测传入的元素中是否存在 DOM2 级方法。如果存在 DOM2 级方法，则使用
该方法：传入事件类型、事件处理程序函数和第三个参数 false（表示冒泡阶段）。如果存在的是 IE 的
方法，则采取第二种方案。注意，为了在 IE8 及更早版本中运行，此时的事件类型必须加上"on"前缀。
最后一种可能就是使用 DOM0 级方法（在现代浏览器中，应该不会执行这里的代码）。此时，我们使用
的是方括号语法来将属性名指定为事件处理程序，或者将属性设置为 null。 */
var EventUtil = {
    addHandler: function (element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent) {
            element.attachEvent("on" + type, handler);
        } else {
            element["on" + type] = handler;
        }
    },
    removeHandler: function (element, type, handler) {
        if (element.removeEventListener) {
            element.removeEventListener(type, handler, false);
        } else if (element.detachEvent) {
            element.detachEvent("on" + type, handler);
        } else {
            element["on" + type] = null;
        }
    }
};
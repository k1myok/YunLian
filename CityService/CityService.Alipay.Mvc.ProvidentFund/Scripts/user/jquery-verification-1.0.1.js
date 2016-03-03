var config = {
    phone: /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/,
    idcard:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/
}

/* 判断是否正确的手机格式 */
function isPhone(value) {
    /* 判断数据不为空 */
    if (!isNullOrEmpty(value)) {
        return !config.phone.test(value);
    }
}

/* 判断是否正确的身份证号码 */
function isIdCard(value) {
    /* 判断数据不为空 */
    if (!isNullOrEmpty(value)) {
        return !config.idcard.test(value);
    }
}

/* 判断数据是否为空 */
function isNullOrEmpty(value) {
    if (value != null && value != "" && value != "undefined") {
        return false;
    }
    return true;
}
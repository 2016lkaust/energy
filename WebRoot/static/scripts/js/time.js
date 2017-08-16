/**
 * Created by LOOK on 2017/2/20 0020.
 */

$(function () {
    var myDate = new Date();
    myDate.getYear();      //获取当前年份(2位)
    var month = myDate.getMonth();      //获取当前月份(0-11,0代表1月)
    var day = myDate.getDate();      //获取当前日(1-31)
    var week = myDate.getDay();        //获取当前星期X(0-6,0代表星期天)
    var hour = myDate.getHours();      //获取当前小时数(0-23)
    var minute = myDate.getMinutes();    //获取当前分钟数(0-59)
    var weeks=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    var months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
    $("#month").html(months[month]);
    $("#weekday").html(weeks[week]);
    $("#day").html(day);
    $("#time").html(hour+":"+minute);
});
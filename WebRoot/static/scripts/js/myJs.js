/**
 * Created by LOOK on 2017/2/17 0017.
 */
$(function () {
    //加载环形进度条
    $('#indicatorContainer').radialIndicator();//获取对象实例
    var $radialObj = $('#indicatorContainer').data('radialIndicator');
    //下面的方法可以在初始化后获取一个参数的值或改变任何参数值。
    ////setter
    $radialObj.option('interpolate', true);
    $radialObj.option('radius', 60);
    //下面的方法可以获取或设置圆形指示器的刻度值。设置值是不会有动画效果的。
    //setter
    $radialObj.value(0);
    //下面的方法可以在为圆形指示器设置值时有动画效果
    $radialObj.animate(100);
    $(".items li:eq(0)").click(function () {
        $(".items li:eq(1)").toggle("fast");
        $(".items>li:eq(3)").hide("fast");
    });
    $(".items>li:eq(2)").click(function () {
        $(".items>li:eq(3)").toggle("fast");
        $(".items li:eq(1)").hide("fast");
    });
});
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>货物类型饼状图</title>
    <script src="js/echarts.min.js" type="text/javascript"></script>
</head>
<body>

<div id="main" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        legend: {
            top: 'bottom'
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '面积模式',
                type: 'pie',
                radius: [50, 250],
                center: ['50%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 8
                },
                data: [
                    {value: 40, name: '原材料类'},
                    {value: 38, name: '电子配件类'},
                    {value: 32, name: '五金类'},
                    {value: 30, name: '食品类'},
                    {value: 28, name: '化工类'},
                    {value: 26, name: '家居类'},
                    {value: 22, name: '日用品类'},
                    {value: 18, name: '服饰类'}
                ]
            }
        ]
    };

    option && myChart.setOption(option);
</script>


</body>
</html>

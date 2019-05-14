// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});
// table = $('#table_local').DataTable({
// // 通过ajax向后台controller请求数据
//     ajax: {
//         url: "queryPagePapers",
//         dataSrc: "data",
//         data: function (d) {
//             var searchContent = $(
//                 '#searchContent').val();
// // 添加额外的参数传给服务器
//             d.extra_search = searchContent;
//         }
//     },
//     "columnDefs": [{
// // 定义操作列,######以下是重点########
//         "targets": 3,//操作按钮目标列
//         "data": null,
//         "render": function (data, type, row) {
//             var id = '"' + row.id + '"';
//             var html = "<a href='javascript:void(0);'  class='delete btn btn-default btn-xs'  ><i class='fa fa-times'></i> 查看</a>"
//             html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'><i class='fa fa-arrow-up'></i> 编辑</a>"
//             html += "<a href='javascript:void(0);'   onclick='deleteThisRowPapser(" + id + ")'  class='down btn btn-default btn-xs'><i class='fa fa-arrow-down'></i> 删除</a>"
//             return html;
//         }
//     }],
// })
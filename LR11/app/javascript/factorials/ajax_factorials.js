function show_result(data) {
    let result_as_tbody = ""
    let row_index = 0;
    let row;
    let rows = data.table_rows
    for (row_index in rows) {
        row = rows[row_index]
        result_as_tbody += `<tr>
                            <td>${row[0]}</td>
                            <td>${row[1]}! = ${row[2] - 1} * ${row[2]} * ${row[2] + 1}</td>
                            </tr>`
    }
    $("#result").html(`
                    <em>${data.db_logs}</em>
                    <p>Найдено <span id="rows-number">${rows.length}</span> числа</p>
                    <table>
                      <thead>
                      <tr>
                        <th>ID</th>
                        <th>Factorial</th>
                      </tr>
                      </thead>
                      <tbody>
                        ${result_as_tbody}
                      </tbody>
                    </table>
                    `)
}

$(document).ready(function() {
    $("#factorials-form").on("ajax:success", function(event) {
        [data, status, xhr] = event.detail
        show_result(data)
    }).on("ajax:error", function(event) {
        $("#result").html("<p>Ошибка при AJAX-запросе</p>")
    })
})

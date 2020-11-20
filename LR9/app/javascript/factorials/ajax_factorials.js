function show_result(data) {
    let result_as_tbody = ""
    let row_index = 0;
    let row;
    for (row_index in data) {
        row = data[row_index]
        result_as_tbody += `<tr>
                            <td>${row[0]}</td>
                            <td>${row[1]}! = ${row[2] - 1} * ${row[2]} * ${row[2] + 1}</td>
                            </tr>`
    }
    $("#result").html(`
                    <p>Найдено <span id="rows-number">${data.length}</span> числа</p>
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
        show_result(data.table_rows)
    }).on("ajax:error", function(event) {
        $("#result").html("<p>Ошибка при AJAX-запросе</p>")
    })
})

function hideTable(value) {
    $(value).fadeToggle("fast");
}

//Удаление выделенных в чекбоксам элементов
function deleteCheckedItems(controller) {
    var checkboxes = $('input[type=checkbox]:checked');
    var route = controller + "/Delete";
    for (var i = 0; i < checkboxes.length; i++) {
        var ID = checkboxes[i].id;
        $.post(route, { id: ID }, function (data) { });
        alert(ID);
    }
    location.reload(true);
}

//Удаление элемента из карточки
function deleteItem(controller) { }
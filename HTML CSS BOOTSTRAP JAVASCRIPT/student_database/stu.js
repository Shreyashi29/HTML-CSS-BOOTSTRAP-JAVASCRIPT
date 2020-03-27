var students = [];
var counter = 1;
var selectedRow = null;

function checkFirst() {
    var userName = document.form1.firstName.value;
    var expression = /^[A-Za-z]+$/;
    if (expression.test(userName)) {
        console.log("Valid Name");
    } else {
        alert("Invalid Name");
    }
    if (expression == "") {
        alert("Please enter your name");
    }
}
function checkLast() {
    var userName1 = document.form1.lastName.value;
    var expression = /^[A-Za-z]+$/;
    if (expression.test(userName1)) {
        console.log("Valid Name");
    } else {
        alert("Invalid Name");
    }
    if (expression == "") {
        alert("Please enter your name");
    }
}

function addStudents() {
    var student = {};
    student.counter = counter;
    student.id = document.getElementById("id").value;
    student.firstName = document.getElementById("firstName").value;
    student.lastName = document.getElementById("lastName").value;
    student.email = document.getElementById("email").value;

    var table = document.getElementById("studentsTable").getElementsByTagName("tbody")[0];
    var row = table.insertRow(table.rows.length);

    var idCell = row.insertCell(0);
    var idFirstName = row.insertCell(1);
    var idLastName = row.insertCell(2);
    var idEmail = row.insertCell(3);
    var idBtn1 = row.insertCell(4);
    var idBtn2 = row.insertCell(5);

    idCell.innerText = student.id;
    idFirstName.innerText = student.firstName;
    idLastName.innerText = student.lastName;
    idEmail.innerText = student.email;
    idBtn1.innerHTML =
        idBtn1.innerHTML +
        '<button type="button" class="btn btn-success" onclick="updateStudents(this)">Edit</button>';
    idBtn2.innerHTML =
        idBtn2.innerHTML +
        '<button type="button" class="btn btn-danger" onclick="deleteStudents(this)">Delete</button>';

    reset();

    students.push;
    counter++;
    // console.log(counter);
    //reset();
}

function updateStudents(td) {
    selectedRow = td.parentElement.parentElement;
    document.getElementById("custom").disabled = false;
    document.getElementById("id").value = selectedRow.cells[0].innerHTML;
    document.getElementById("firstName").value = selectedRow.cells[1].innerHTML;
    document.getElementById("lastName").value = selectedRow.cells[2].innerHTML;
    document.getElementById("email").value = selectedRow.cells[3].innerHTML;
}

function updateRecord() {
    selectedRow.cells[0].innerHTML = document.getElementById("id").value;
    selectedRow.cells[1].innerHTML = document.getElementById("firstName").value;
    selectedRow.cells[2].innerHTML = document.getElementById("lastName").value;
    selectedRow.cells[3].innerHTML = document.getElementById("email").value;
    document.getElementById("custom").disabled = true;
}
function deleteStudents(td) {
    if (confirm("Are you sure you want to delete the data?")) {
        row = td.parentElement.parentElement;
        document.getElementById("studentsTable").deleteRow(row.rowIndex);
    }
}

function reset() {
    document.getElementById("id").value = "";
    document.getElementById("firstName").value = "";
    document.getElementById("lastName").value = "";
    document.getElementById("email").value = "";
}

function search() {
    var input = document.getElementById("search");
    var filter = input.value.toUpperCase();
    var table = document.getElementById("studentsTable");
    var tr = table.getElementsByTagName("tr");

    for (var i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        tdd = tr[i].getElementsByTagName("td")[1];
        if (td) {
            var txtValue = td.textContent || td.innerText;
            var txtValue2 = tdd.textContent || tdd.innerText;
            if (
                txtValue.toUpperCase().indexOf(filter) > -1 ||
                txtValue2.toUpperCase().indexOf(filter) > -1
            ) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

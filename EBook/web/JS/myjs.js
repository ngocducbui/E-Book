/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
const overlay = document.getElementById('overlay');

document.querySelector('#edit').addEventListener("click", function () {
    document.querySelector(".popup2").classList.add("active");
    overlay.style.display = 'block';
    popup = document.querySelector(".popup2");
    popup.style.zIndex = "1001";

});

document.querySelector(".popup2 .close-btn").addEventListener("click", function () {
    document.querySelector(".popup2").classList.remove("active");
    overlay.style.display = 'none';

});

overlay.addEventListener('click', () => {
    overlay.style.display = 'none';
    document.querySelector(".popup2").classList.remove("active");

});

document.addEventListener('keyup', function (event) {
    if (event.key === 'Escape') {
        overlay.style.display = 'none';
        document.querySelector(".popup2").classList.remove("active");
    }
});

document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        // Xử lý khi người dùng nhấn phím Esc ở đây
        overlay.style.display = 'none';
        document.querySelector(".popup2").classList.remove("active");
    }
});
/////////////////////
//const myButton = document.getElementById('myButton');
//const myForm = document.getElementById('myForm');
//
//myButton.addEventListener('click', () => {
//    const buttonValue = myButton.value;
//
//    // Use AJAX to send data to the server
//    const xhr = new XMLHttpRequest();
//    xhr.open('POST', '../EBook/AddBook', true);
//    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//    xhr.onreadystatechange = function () {
//        if (xhr.readyState === XMLHttpRequest.DONE) {
//            // Handle response from the server if needed
//        }
//    };
//
//    const dataToSend = `buttonValue=${encodeURIComponent(buttonValue)}`;
//    xhr.send(dataToSend);
//});
//
//
///////
//
//
//const myList = [1, 2, 3, 4, 5];
//const serializedList = myList.join(',');
//
//const url = 'http://localhost:8080/EBook/test.jsp?list=' + encodeURIComponent(serializedList);
//window.location.href = url;
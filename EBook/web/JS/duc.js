/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// Tạo một list
const myList = [1, 2, 3, 4, 5];
const serializedList = myList.join(',');

const url = 'http://localhost:8080/EBook/duc.jsp?list=' + encodeURIComponent(serializedList);
window.location.href = url;
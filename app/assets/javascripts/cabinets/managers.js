function appendNotificationCounter(elementId) {
    let requestBill = document.getElementById(elementId);
    requestBill.style.color = 'red';
    requestBill.append(' (+1)');
}
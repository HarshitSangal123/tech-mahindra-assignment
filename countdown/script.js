let timer;
let totalTime = 0;
let running = false;

function startTimer() {
    if (running) return;
    let minutes = parseInt(document.getElementById('minutes').value) || 0;
    let seconds = parseInt(document.getElementById('seconds').value) || 0;
    totalTime = minutes * 60 + seconds;
    if (totalTime <= 0) return;
    running = true;
    updateDisplay();
    timer = setInterval(() => {
        if (totalTime > 0) {
            totalTime--;
            updateDisplay();
        } else {
            clearInterval(timer);
            running = false;
            alert("Time's up!");
        }
    }, 1000);
}

function pauseTimer() {
    clearInterval(timer);
    running = false;
}

function resetTimer() {
    clearInterval(timer);
    running = false;
    totalTime = 0;
    updateDisplay();
}

function updateDisplay() {
    let min = Math.floor(totalTime / 60);
    let sec = totalTime % 60;
    document.getElementById('display').innerText = 
        (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec;
}

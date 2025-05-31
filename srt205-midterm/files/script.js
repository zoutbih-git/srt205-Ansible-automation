function updateClock() {
  const now = new Date();
  const timeString = now.toLocaleTimeString();
  document.getElementById('clock').textContent = timeString;
}

// Update clock every second
setInterval(updateClock, 1000);

// Run immediately on page load
updateClock();

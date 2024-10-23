// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from '@rails/ujs';
Rails.start();

document.addEventListener('DOMContentLoaded', function() {
  var modal = document.getElementById('studentModal');
  var btn = document.getElementById('openModal');
  var span = document.getElementsByClassName('close')[0];

  if (!btn) {
    console.error('Button with ID "openModal" not found.');
    return;
  }

  if (!modal) {
    console.error('Modal with ID "studentModal" not found.');
    return;
  }

  if (!span) {
    console.error('Close span not found.');
    return;
  }

  btn.onclick = function () {
    modal.style.display = 'block';
  };

  span.onclick = function () {
    modal.style.display = 'none';
  };

  window.onclick = function (event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  };
});

document.addEventListener("DOMContentLoaded", function() {
  const saveButtons = document.querySelectorAll(".smallbtn");

  saveButtons.forEach(button => {
    button.addEventListener("click", function() {
      const row = this.closest("tr");
      const studentId = this.dataset.studentId;

      const name = row.querySelector(".name").innerText;
      const subject = row.querySelector(".subject").innerText;
      const marks = row.querySelector(".marks").innerText;

      fetch(`/students/${studentId}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content")
        },
        body: JSON.stringify({ name: name, subject: subject, marks: marks })
      })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(data => {
        console.log("Update successful:", data);
      })
      .catch(error => {
        console.error("There was a problem with the fetch operation:", error);
      });
    });
  });
});

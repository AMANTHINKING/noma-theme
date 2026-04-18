(() => {
  const options = Array.from(document.querySelectorAll("[data-lens-option]"));
  const target = document.querySelector("[data-lens-display]");

  if (!options.length || !target) {
    return;
  }

  const render = (button) => {
    options.forEach((item) => item.classList.toggle("is-active", item === button));

    target.querySelector("[data-name]").textContent = button.dataset.name;
    target.querySelector("[data-tone]").textContent = button.dataset.tone;
    target.querySelector("[data-time]").textContent = button.dataset.time;
    target.querySelector("[data-level]").textContent = button.dataset.level;
    target.querySelector("[data-description]").textContent = button.dataset.description;
    target.querySelector("[data-usage]").textContent = button.dataset.usage;
  };

  options.forEach((button) => {
    button.addEventListener("click", () => render(button));
  });

  render(options[0]);
})();

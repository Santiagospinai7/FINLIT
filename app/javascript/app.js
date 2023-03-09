import { completion } from "./openai";

const searchLabel = document.querySelector('.search__label-init');
const submitBtn = document.querySelector('#submit-btn');

searchLabel.addEventListener('click', () => {
  setTimeout(() => {
    submitBtn.style.display = 'block';
  }, 2000);
});

submitBtn.addEventListener('click', () => {
  submitBtn.style.display = 'none';
});

const form = document.querySelector('chat-form');
const userInput = document.getElementById('user-input');
const chatContainer = document.getElementById('chat-container');

form.addEventListener('submit', async (event) => {
  event.preventDefault();
  const userMessage = userInput.value.trim();

  const chatBubbleUser = document.createElement('div');
  chatBubbleUser.classList.add('chat-bubble-user');
  chatBubbleUser.textContent = userMessage;
  chatContainer.appendChild(chatBubbleUser);

  const chatBubbleAI = document.createElement('div');
  chatBubbleAI.classList.add('chat-bubble-ai');
  chatBubbleAI.textContent = response.choices[0].text.trim();
  chatContainer.appendChild(chatBubbleAI);

  userInput.value = '';
});

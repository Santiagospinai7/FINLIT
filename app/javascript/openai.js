const OPENAI_API_KEY = "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";

// const { Configuration, OpenAIApi } = require("openai");

// const configuration = new Configuration({
//   apiKey: OPENAI_API_KEY,
// });
// const openai = new OpenAIApi(configuration);

// const completion = await openai.createChatCompletion({
//   model: "gpt-3.5-turbo",
//   messages: [{role: "user", content: "Hello world"}],
// });

// export default completion;


const { Configuration, OpenAIApi } = require("openai");

const configuration = new Configuration({
  apiKey: OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const form = document.querySelector('#chat-form');
const userInput = document.querySelector('#user-input');
const chatContainer = document.querySelector('#chat-container');

form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const input = userInput.value;

  const completion = await openai.createChatCompletion({
    model: "gpt-3.5-turbo",
    messages: [{role: "user", content: input}],
  });

  const chatBubbleUser = `<div class="chat-bubble chat-bubble-user">${input}</div>`;
  const chatBubbleAssistant = `<div class="chat-bubble chat-bubble-assistant">${completion.choices[0].text}</div>`;

  chatContainer.innerHTML += chatBubbleUser + chatBubbleAssistant;

  userInput.value = '';
});

export default completion;

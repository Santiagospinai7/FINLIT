import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["chatForm", "userInput", "chatContainer"];

  async submitForm() {
    const { Configuration, OpenAIApi } = require("openai");
    const configuration = new Configuration({
      apiKey: OPENAI_API_KEY,
    });
    const openai = new OpenAIApi(configuration);

    const userMessage = this.userInputTarget.value.trim();
    if (userMessage.length === 0) return;

    const chatBubbleUser = document.createElement("div");
    chatBubbleUser.classList.add("chat-bubble", "chat-bubble-user");
    chatBubbleUser.textContent = userMessage;
    this.chatContainerTarget.appendChild(chatBubbleUser);

    const completion = await openai.createChatCompletion({
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: userMessage }],
    });

    const chatBubbleAI = document.createElement("div");
    chatBubbleAI.classList.add("chat-bubble", "chat-bubble-ai");
    chatBubbleAI.textContent = completion.choices[0].text.trim();
    this.chatContainerTarget.appendChild(chatBubbleAI);

    this.userInputTarget.value = "";
  }
}

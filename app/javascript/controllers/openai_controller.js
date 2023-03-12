import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "container", "chat", "input" ]

  connect() {
    console.log("Connecting to OpenAI...");
    const apiKey = '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';
    const userInputValue = this.inputTarget.value;
    // const userInput = document.getElementById('user-input');
    console.log(userInputValue);
    const data = {
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: userInputValue }]
    };

    fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      const messageContent = data.choices[0].text;
      console.log(messageContent);
      this.chatTarget.textContent = messageContent;
    })
    .catch(error => console.error(error));
  }
}









// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="openai"
// export default class extends Controller {

//   static targets = [ "container", "chat" ]

//   connect() {
//     console.log("Connecting to OpenAI...");
//     const apiKey = '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';
//     const data = {
//       model: 'gpt-3.5-turbo',
//       messages: [{ role: 'user', content: 'What is a mortgage?' }]
//     };

//     fetch('https://api.openai.com/v1/chat/completions', {
//       method: 'POST',
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': `Bearer ${apiKey}`
//       },
//       body: JSON.stringify(data)
//     })
//     .then(response => response.json())
//     .then(data => {
//       const messageContent = data.choices[0].message.content;
//       console.log(messageContent);
//       this.chatTarget.textContent = messageContent;
//     })
//     .catch(error => console.error(error));

//   }
// }

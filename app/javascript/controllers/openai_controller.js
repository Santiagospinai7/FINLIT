// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {

//   static targets = [ "container", "chat", "input" ]

//   connect() {
//     console.log("Connecting to OpenAI...");
//     const apiKey = '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';
//     const userInput = this.inputTarget.value;
//     console.log(userInput);
//     const data = {
//       model: 'gpt-3.5-turbo',
//       messages: [{ role: 'user', content: userInput }]
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
//       console.log(data);
//       const messageContent = data.choices[0].message.content;
//       this.chatTarget.textContent = messageContent;
//     })
//     .catch(error => console.error(error));

//   }
// }

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "form", "container", "chat", "input" ]

  connect() {
    console.log("Connecting to OpenAI...");
    this.formTarget.addEventListener('submit', this.submit.bind(this));

    const img = this.element.querySelector('#search-img');
    const trigger = this.element.querySelector('#trigger');

    trigger.addEventListener('change', () => {
      img.hidden = !trigger.checked;
    });

  }

  submit(event) {
    event.preventDefault();
    const apiKey = '';
    const userInput = this.inputTarget.value;
    console.log(userInput);
    const data = {
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: userInput }]
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
      console.log(data);
      const messageContent = data.choices[0].message.content;
      const lines = messageContent.split('\n');
      const formattedLines = lines.map(line => {
        if (/^\d+\./.test(line)) {
          return `<p>• ${line}</p>`;
        }
        return `<p>${line}</p>`;
      });
      const formattedContent = formattedLines.join('');
      this.chatTarget.innerHTML = formattedContent;
    })
    .catch(error => console.error(error));
  }
}

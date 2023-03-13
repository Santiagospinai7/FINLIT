import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "container", "chat", "input", "loader" ]
  static values = {
    key: String
  }

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
    const accessKey = this.keyValue;
    console.log("SUCCESS ~CONNECTED~");
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
        'Authorization': `Bearer ${accessKey}`
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      console.log("API RESPONSE INBOUND");
      const messageContent = data.choices[0].message.content;
      const lines = messageContent.split('\n').filter(line => line.trim() !== ''); // Add filter to remove empty lines
      const formattedLines = lines.map(line => {
        if (/^\d+\./.test(line)) {
          return `<p class="chat-bubbles">• ${line}</p>`;
        }
        return `<p class="chat-bubbles">${line}</p>`;
      });
      const formattedContent = formattedLines.join('');
      this.chatTarget.innerHTML = formattedContent;
    })
    .catch(error => console.error(error));
  }
}





// WORKING API
// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = [ "form", "container", "chat", "input" ]
//   static values = {
//     key: String
//   }

//   connect() {
//     console.log("Connecting to OpenAI...");
//     this.formTarget.addEventListener('submit', this.submit.bind(this));

//     const img = this.element.querySelector('#search-img');
//     const trigger = this.element.querySelector('#trigger');

//     trigger.addEventListener('change', () => {
//       img.hidden = !trigger.checked;
//     });
//   }

//   submit(event) {
//     event.preventDefault();
//     const accessKey = this.keyValue;
//     console.log("SUCCESS ~CONNECTED~");
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
//         'Authorization': `Bearer ${accessKey}`
//       },
//       body: JSON.stringify(data)
//     })
//     .then(response => response.json())
//     .then(data => {
//       console.log("API RESPONSE INBOUND");
//       const messageContent = data.choices[0].message.content;
//       const lines = messageContent.split('\n').filter(line => line.trim() !== ''); // Add filter to remove empty lines
//       const formattedLines = lines.map(line => {
//         if (/^\d+\./.test(line)) {
//           return `<p class="chat-bubbles">• ${line}</p>`;
//         }
//         return `<p class="chat-bubbles">${line}</p>`;
//       });
//       const formattedContent = formattedLines.join('');
//       this.chatTarget.innerHTML = formattedContent;
//     })
//     .catch(error => console.error(error));
//   }
// }

const OPENAI_API_KEY = "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";

const { Configuration, OpenAIApi } = require("openai");

const configuration = new Configuration({
  apiKey: OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const completion = await openai.createChatCompletion({
  model: "gpt-3.5-turbo",
  messages: [{role: "user", content: "Hello world"}],
});

export default completion;

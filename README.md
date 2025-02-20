## Getting Started

To get started with this script, you need to:

### 1. Create an Account on WeatherAPI
Go to [weatherapi.com](https://weatherapi.com) and create an account to obtain your API key.

### 2. Configure the API Key
Once you have the API key, follow these steps:

- Navigate to the `config.lua` file in the project.
- Paste your API key into the appropriate section, like so:

```lua
Config.API_KEY = "API_KEY_HERE"
```

### 3. Set location

- Set the location in the `config.lua` file as well to your liking.

## How it works

- Every minute the server will do a request to the API to get the latest weather information from the location you set.

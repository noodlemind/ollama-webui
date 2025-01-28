#!/bin/bash

# Start Ollama in the background
/bin/ollama serve &
pid=$!

# Wait for Ollama to start
sleep 10

# Pull your desired models
echo "🔄 Pulling DeepSeek R1 7B model..."
ollama pull deepseek-r1:7b

# Wait for Ollama process
wait $pid

#!/bin/bash

# Inicializar Tailwind CSS
npx tailwindcss init -p

# Configurar tailwind.config.js
cat <<EOL > tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

# Agregar las directivas de Tailwind a index.css
cat <<EOL > src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL
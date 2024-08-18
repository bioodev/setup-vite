#!/bin/bash

# Función para preguntar al usuario
preguntar() {
    local pregunta="$1"
    local respuesta

    read -p "$pregunta (y/n): " respuesta
    echo "$respuesta"
}

# Preguntar por el nombre del proyecto
PROJECT_NAME=$(preguntar "Ingrese el nombre del proyecto: ")

# Preguntar si desea levantar el servidor de desarrollo
RESPUESTA_INICIAR_SERVIDOR=$(preguntar "¿Desea iniciar el servidor de desarrollo ahora?")

# Crear un nuevo proyecto Vite
npm create vite@latest "$PROJECT_NAME" -- --template react

# Cambiar al directorio del proyecto
cd "$PROJECT_NAME" || exit

# Instalar Tailwind CSS y sus dependencias
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest

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

# Mejorar el código de App.js
cat <<EOL > src/App.jsx
import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="text-center">
      <h1 className="text-4xl font-bold text-blue-600">VITE/REACT/TAILWIND</h1>
      <div className="mt-4">
        <button 
          className="bg-blue-500 text-white px-4 py-2 rounded" 
          onClick={() => setCount(count + 1)}
        >
          Count: {count}
        </button>
      </div>
    </div>
  );
}

export default App;
EOL


if [ "$RESPUESTA_INICIAR_SERVIDOR" = "y" ]; then
    npm install
    npm run dev &

    # Abrir el navegador por defecto
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:5173
    elif command -v open &> /dev/null; then
        open http://localhost:5173
    else
        echo "Por favor, abre tu navegador en http://localhost:5173"
    fi
else
    echo "Para iniciar el servidor de desarrollo, ejecuta:"
    echo "cd $PROJECT_NAME"
    echo "npm install"
    echo "npm run dev"
fi

echo "¡Proyecto creado exitosamente!"
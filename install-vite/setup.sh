#!/bin/bash

# Función para preguntar al usuario
preguntar() {
    local pregunta="$1"
    local respuesta

    read -p "$pregunta (s/n): " respuesta
    echo "$respuesta"
}

# Preguntar por el nombre del proyecto
read -p "Ingrese el nombre del proyecto: " PROJECT_NAME

# Preguntar si desea levantar el servidor de desarrollo
RESPUESTA_INICIAR_SERVIDOR=$(preguntar "¿Desea iniciar el servidor de desarrollo ahora?")

# Preguntar por las bibliotecas de TanStack
RESPUESTA_QUERY=$(preguntar "¿Desea instalar TanStack Query?")
RESPUESTA_ROUTER=$(preguntar "¿Desea instalar TanStack Router?")
RESPUESTA_TABLE=$(preguntar "¿Desea instalar TanStack Table?")
RESPUESTA_FORM=$(preguntar "¿Desea instalar TanStack Form?")

# Crear un nuevo proyecto Vite
npm create vite@latest "$PROJECT_NAME" -- --template react

# Cambiar al directorio del proyecto
cd "$PROJECT_NAME" || exit

# Instalar dependencias y configurar Tailwind CSS
source ../scripts/install_dependencies.sh
source ../scripts/configure_tailwind.sh

# Mejorar el código de App.js
cat <<EOL > src/App.jsx
import { useState } from 'react';
import './App.css';
import { QueryClientWrapper } from './components/QueryClient';
import { RouterWrapper } from './components/Router';

function App() {
  const [count, setCount] = useState(0);

  return (
    <QueryClientWrapper>
      <RouterWrapper>
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
      </RouterWrapper>
    </QueryClientWrapper>
  );
}

export default App;
EOL

# Crear la carpeta de componentes
mkdir -p src/components

# Configurar TanStack Query
if [ "$RESPUESTA_QUERY" = "s" ]; then
    source ../scripts/configure_tanstack_query.sh
fi

# Configurar TanStack Router
if [ "$RESPUESTA_ROUTER" = "s" ]; then
    source ../scripts/configure_tanstack_router.sh
fi

# Configurar TanStack Table
if [ "$RESPUESTA_TABLE" = "s" ]; then
    source ../scripts/configure_tanstack_table.sh
fi

# Configurar TanStack Form
if [ "$RESPUESTA_FORM" = "s" ]; then
    source ../scripts/configure_tanstack_form.sh
fi

if [ "$RESPUESTA_INICIAR_SERVIDOR" = "s" ]; then
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
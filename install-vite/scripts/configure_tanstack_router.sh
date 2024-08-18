#!/bin/bash

# Instalar TanStack Router
npm install @tanstack/router
npm i -D @tanstack/router-plugin @tanstack/router-devtools
echo "TanStack Router instalado."

# Configuración de TanStack Router
cat <<EOL > vite.config.ts
import { defineConfig } from 'vite';
import viteReact from '@vitejs/plugin-react';
import { TanStackRouterVite } from '@tanstack/router-plugin/vite';

export default defineConfig({
  plugins: [
    TanStackRouterVite(),
    viteReact(),
  ],
});
EOL

mkdir -p src/routes

# Crear __root.tsx
cat <<EOL > src/routes/__root.tsx
import { createRootRoute, Link, Outlet } from '@tanstack/react-router';
import { TanStackRouterDevtools } from '@tanstack/router-devtools';

export const Route = createRootRoute({
  component: () => (
    <>
      <div className="p-2 flex gap-2">
        <Link to="/" className="[&.active]:font-bold">Home</Link>
        <Link to="/about" className="[&.active]:font-bold">About</Link>
      </div>
      <hr />
      <Outlet />
      <TanStackRouterDevtools />
    </>
  ),
});
EOL

# Crear index.lazy.tsx
cat <<EOL > src/routes/index.lazy.tsx
import { createLazyFileRoute } from '@tanstack/react-router';

export const Route = createLazyFileRoute('/')({
  component: Index,
});

function Index() {
  return (
    <div className="p-2">
      <h3>Welcome Home!</h3>
    </div>
  );
}
EOL

# Crear about.lazy.tsx
cat <<EOL > src/routes/about.lazy.tsx
import { createLazyFileRoute } from '@tanstack/react-router';

export const Route = createLazyFileRoute('/about')({
  component: About,
});

function About() {
  return <div className="p-2">Hello from About!</div>;
}
EOL

# Crear main.tsx
cat <<EOL > src/main.tsx
import React, { StrictMode } from 'react';
import ReactDOM from 'react-dom/client';
import { RouterProvider, createRouter } from '@tanstack/react-router';

// Importa el árbol de rutas generado
import { routeTree } from './routeTree.gen';

// Crea una nueva instancia de router
const router = createRouter({ routeTree });

// Registra la instancia del router para la seguridad de tipos
declare module '@tanstack/react-router' {
  interface Register {
    router: typeof router;
  }
}

// Renderiza la aplicación
const rootElement = document.getElementById('root')!;
if (!rootElement.innerHTML) {
  const root = ReactDOM.createRoot(rootElement);
  root.render(
    <StrictMode>
      <RouterProvider router={router} />
    </StrictMode>
  );
}
EOL

# Crear index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite App</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOL
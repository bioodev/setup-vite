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

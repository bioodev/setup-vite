#!/bin/bash

# Instalar TanStack Query
npm install @tanstack/react-query
echo "TanStack Query instalado."

# Asegúrate de que el directorio de componentes existe
mkdir -p ../src/components

# Configuración de TanStack Query
cat <<EOL > ../src/components/QueryClient.jsx
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient();

export const QueryClientWrapper = ({ children }) => {
  return (
    <QueryClientProvider client={queryClient}>
      {children}
    </QueryClientProvider>
  );
};
EOL
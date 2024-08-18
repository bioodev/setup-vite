#!/bin/bash

# Instalar TanStack Form
npm install @tanstack/react-form
echo "TanStack Form instalado."

# Asegúrate de que el directorio de componentes existe
mkdir -p src/components

# Ejemplo de configuración de TanStack Form
cat <<EOL > src/components/FormComponent.jsx
import { useForm } from '@tanstack/react-form';

const FormComponent = () => {
  const form = useForm({
    initialValues: {
      name: '',
      age: '',
    },
    onSubmit: (values) => {
      console.log(values);
    },
  });

  return (
    <form onSubmit={form.handleSubmit}>
      <input {...form.getInputProps('name')} placeholder="Name" />
      <input {...form.getInputProps('age')} placeholder="Age" />
      <button type="submit">Submit</button>
    </form>
  );
};

export default FormComponent;
EOL
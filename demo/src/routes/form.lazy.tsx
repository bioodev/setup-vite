import { createLazyFileRoute } from '@tanstack/react-router'
import FormComponent from "../components/FormComponent"

export const Route = createLazyFileRoute('/form')({
  component: () => <FormComponent />
})
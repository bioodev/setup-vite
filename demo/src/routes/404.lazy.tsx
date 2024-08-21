import { createLazyFileRoute } from '@tanstack/react-router'

export const Route = createLazyFileRoute('/404')({
  component: () => <div>Hello /404!</div>
})
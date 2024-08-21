import { createLazyFileRoute } from '@tanstack/react-router'
import TableComponent from "../components/TableComponent"

export const Route = createLazyFileRoute('/table')({
  component: () => <TableComponent data={[{ name: 'John', age: 30 }, { name: 'Jane', age: 25 }]} />,
})
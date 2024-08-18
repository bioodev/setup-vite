#!/bin/bash

# Instalar TanStack Table
npm install @tanstack/react-table
echo "TanStack Table instalado."

# Asegúrate de que el directorio de componentes existe
mkdir -p ../src/components

# Ejemplo de configuración de TanStack Table
cat <<EOL > ../src/components/TableComponent.jsx
import { useTable } from '@tanstack/react-table';

const TableComponent = ({ data }) => {
  const columns = [
    {
      header: 'Name',
      accessor: 'name',
    },
    {
      header: 'Age',
      accessor: 'age',
    },
  ];

  const { getTableProps, getTableBodyProps, headerGroups, rows, prepareRow } = useTable({ columns, data });

  return (
    <table {...getTableProps()}>
      <thead>
        {headerGroups.map(headerGroup => (
          <tr {...headerGroup.getHeaderGroupProps()}>
            {headerGroup.headers.map(column => (
              <th {...column.getHeaderProps()}>{column.render('Header')}</th>
            ))}
          </tr>
        ))}
      </thead>
      <tbody {...getTableBodyProps()}>
        {rows.map(row => {
          prepareRow(row);
          return (
            <tr {...row.getRowProps()}>
              {row.cells.map(cell => (
                <td {...cell.getCellProps()}>{cell.render('Cell')}</td>
              ))}
            </tr>
          );
        })}
      </tbody>
    </table>
  );
};

export default TableComponent;
EOL
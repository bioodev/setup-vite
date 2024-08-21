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

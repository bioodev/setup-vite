import { createRootRoute, Link, Outlet } from '@tanstack/react-router';
import { TanStackRouterDevtools } from '@tanstack/router-devtools';

export const Route = createRootRoute({
  component: () => (
    <>
      <div className="p-2 flex gap-2">
        <Link to="/" className="[&.active]:font-bold">Home</Link>
        <Link to="/about" className="[&.active]:font-bold">About</Link>
        <Link to="/form" className="[&.active]:font-bold">Form</Link>
        <Link to="/table" className="[&.active]:font-bold">Table</Link>
      </div>
      <hr />
      <Outlet />
      <TanStackRouterDevtools />
    </>
  ),
});

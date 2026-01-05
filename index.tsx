<<<<<<< HEAD
// Entry point for the frontend app

=======
>>>>>>> 6466315e1e273bc05b5afc7f3b80cf4ac718d9d3
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';

<<<<<<< HEAD
const rootElement = document.getElementById('root');
if (rootElement) {
  const root = ReactDOM.createRoot(rootElement);
  root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>
  );
} else {
  console.error('Root element not found');
}

<script type="module" src="/index.tsx"></script>
=======
ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
>>>>>>> 6466315e1e273bc05b5afc7f3b80cf4ac718d9d3

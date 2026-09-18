import { useState } from 'react';

const personas = [
  { name: 'Maya', detail: 'Budget-conscious parent', goal: 'Keep a weekly shop under $100.' },
  { name: 'Leo', detail: 'First-time visitor', goal: 'Understand the offer before committing.' },
  { name: 'Jordan', detail: 'Busy parent', goal: 'Compare options quickly.' },
];

const journey = [
  ['00:00', 'Opened the target page', 'The page loaded and the main navigation was visible.'],
  ['00:12', 'Scanned the options', 'The categories were easy to find, but the choice set was broad.'],
  ['00:31', 'Compared two options', 'Price details were separated from the comparison view.'],
];

export default function App() {
  const [selected, setSelected] = useState(personas[0]);
  const [task, setTask] = useState('Find a family-friendly product and compare two options.');
  const [status, setStatus] = useState('ready');

  function invokePersona() {
    setStatus('running');
    setTimeout(() => setStatus('complete'), 900);
  }

  return (
    <main className="page-shell">
      <header>
        <p className="brand">Persona Lab</p>
        <h1>Try a simulated journey.</h1>
        <p className="intro">A deliberately rough workshop starter. Improve the experience with Codex.</p>
      </header>

      <section className="workbench" aria-label="Persona simulation setup">
        <div className="setup">
          <h2>1. Pick a persona</h2>
          <div className="persona-list">
            {personas.map((persona) => (
              <button
                className={selected.name === persona.name ? 'persona selected' : 'persona'}
                key={persona.name}
                onClick={() => setSelected(persona)}
              >
                <strong>{persona.name}</strong>
                <span>{persona.detail}</span>
                <small>{persona.goal}</small>
              </button>
            ))}
          </div>

          <label htmlFor="task">2. Give {selected.name} a task</label>
          <textarea id="task" value={task} onChange={(event) => setTask(event.target.value)} />
          <button className="invoke" onClick={invokePersona} disabled={status === 'running'}>
            {status === 'running' ? 'Persona is looking…' : 'Invoke persona'}
          </button>
        </div>

        <aside className="results" aria-live="polite">
          <p className="label">SIMULATION STATUS</p>
          {status === 'ready' && <p>Choose a persona, write a task, then invoke the simulation.</p>}
          {status === 'running' && <p>Running a local sample journey for {selected.name}…</p>}
          {status === 'complete' && <Journey persona={selected} task={task} />}
        </aside>
      </section>

      <footer>
        This demo is a simulated-persona hypothesis, not human user research. The rationale below is synthetic and linked to a sample journey.
      </footer>
    </main>
  );
}

function Journey({ persona, task }) {
  return (
    <>
      <h2>{persona.name}'s journey</h2>
      <p className="task">Task: {task}</p>
      <ol className="journey">
        {journey.map(([time, action, note]) => (
          <li key={time}>
            <time>{time}</time>
            <div><strong>{action}</strong><span>{note}</span></div>
          </li>
        ))}
      </ol>
      <div className="rationale"><strong>Synthetic rationale</strong><p>“I could compare the choices, but I had to open each option before I could see the price difference.”</p></div>
      <div className="finding"><strong>Possible friction</strong><p>Expose comparison details before the detail page.</p></div>
    </>
  );
}

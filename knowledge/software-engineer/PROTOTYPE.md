1. Project Objective: Build a functional UI prototype for the Governed
      Action Proxy (GAP) to demonstrate deterministic tool interception.
2. Primary Use Case: Wire Transfer. Actions > $10,000 must be escalated for
      Human-in-the-Loop (HITL) approval.
3. UI Architecture (3-Pane Layout):
    * Left (Action Pane): Intercepted tool calls, policy status, and
         escalation triggers.
    * Center (Chat UI): Mocked LLM interaction flow.
    * Right (Agent Pane): Supervisor Agent reasoning and confidence scores.
4. Tech Stack: Astro v6, Tailwind v4, pnpm monorepo.
5. Execution Constraint: No live LLM integration in Phase 1; use
      deterministic mock data to explain the "GAP" mechanics.
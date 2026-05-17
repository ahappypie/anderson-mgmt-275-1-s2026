# What is this Repository?
This is the development environment, agent context and prototype for the final group assignment for UCLA Anderson's MGMT 275 Product Delivery class for the Spring 2026 quarter.

## Group Members
- Brian Bagdasarian, FTMBA 2027
- Shen Liu, FTMBA 2027
- Natalie Saltiel, FTMBA 2027
- Daniel Sam, FTMBA 2027

## Functional Prototype
The primary assignment is to design, document and build a new feature for an AI native product. This feature is for *learning purposes only*.

### Claude Governed Action Proxy
GAP detects high-risk tool calls (like `execute_wire_transfer`) and runs them through a deterministic policy engine (static, in this prototype). If the policy engine detects that the tool call requires escalation, it asks the appropriate supervisor (in this prototype, it is shown in the left sidebar, the `Action Pane`). Any action Claude takes is automatically logged (the right sidebar, the `Agent Pane`).

#### Usage
[Prototype Link](https://claude-gap-prototype.watershed.technology)

On first page load, you will see a suggested message. You can try other messages of this variety: `Transfer $AMOUNT to $RECIPIENT`. The automatic approval threshold is currently set at $10,000. In the future, when the policy engine is attached, complex rules can be written to extend the actions supported and complexity of the approval flow.

## Source of Truth MD File(s)
- [`AGENTS.md`](./AGENTS.md), [`.agents/*`](./.agents/) and [`.gemini/agents/*`](./.gemini/agents/) define the agentic harness used for this project, including the primary agent (software engineer) and product manager subagent.
- [`knowledge/*`](./knowledge/) includes memory files for each agent that persists relevant knowledge (including background context and prototype design) across sessions.
- [`PLAN.md`](./PLAN.md) acts as the prompt history for the agents during prototype development. Agents are directed to use the planfile as the primary source of direction by using a custom skill.
- [`designs/*`](./designs/) holds experimental and evaluation tests to conduct in the future.
- [`PR-FAQ.pdf`](./PR-FAQ.pdf) is a copy of the press release and frequently asked questions for distribution.

## Navigating the Project
This project uses a `pnpm` monorepo-style structure. The single artifact is currently the prototype, at [`apps/prototype-web`](./apps/prototype-web/). It uses the Astro web framework and is deployed as a static site on Cloudflare.

### Viewing the Prototype
Either view the deployed prototype at the link above, or follow these instructions:
- Install NodeJS (>=v24) and `pnpm` (>=v10)
- At project root, `pnpm install --frozen-lockfile`
- Then, `cd apps/prototype-web` and `pnpm dev`

### Contributing
This repository uses Nix development environments with preset environments for shell dependencies or a complete IDE experience. Install Nix for your operating system, then use either `direnv` (if installed) or `nix develop` (shell only) or `nix develop .#vscode` (IDE).

This repository is trunk-based (i.e. Gitflow). Contribute new features on `feat/$NEW_FEATURE` branches and fixes on `fix/$YOUR_FIX` branches. After creating a Pull Request, Cloudflare will automatically build and deploy a preview branch.

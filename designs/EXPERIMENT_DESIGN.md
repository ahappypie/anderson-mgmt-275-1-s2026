# Experiment Design: GAP Agentic Supervision vs. Human Bottlenecks

## Pre-experiment Write-up

### 0.0 Overview
The Governed Action Proxy (GAP) successfully intercepts high-risk tool calls, but the current Human-in-the-Loop (HITL) requirement has created a Human Bottleneck. Enterprise agents are frequently paused for hours awaiting manual supervisor approval for routine, policy-compliant actions. This experiment tests Agentic Supervision, using a specialized, high-reasoning Supervisor Claude instance to auto-approve low complexity, high confidence tool calls that strictly match deterministic policies, only escalating ambiguous cases to humans.

### 1.1 Experiment Duration  
Total Duration: 21 days, to capture enough high-risk events for statistical significance.

### 1.2 What is Changing for the Customer?
- **Control:** All high-risk tool calls (i.e. `execute_wire_transfer`) are placed in a manual queue. A human supervisor must review and click Approve for every single action.
- **Treatment:** High-risk tool calls are first reviewed by the **GAP Supervisor Agent**. If the action is 100% compliant with deterministic policies and the agent's confidence score is >98%, the action is auto-approved and executed. Only ambiguous or extreme risk actions are escalated to the human queue.

### 1.3 Why is this better for the Customer?
It unlocks *Velocity*. By removing the manual review for routinely approved actions, the primary agent can complete complex workflows in minutes instead of days. This makes the Claude viable for high-volume operations like claims processing where human-per-action review is economically impossible.

### 1.4 What are the key metrics to monitor in this experiment?
- **Target Metric: Mean Time to Action (MTTA).** The elapsed time from the primary agent's tool request to the moment of execution. This measures the removal of the bottleneck.
- **Guardrail Metric 1: Downstream Incident Rate (DIR).** The percentage of approved actions that result in a system rollback, error, or manual override within 24 hours. We must ensure the Supervisor Agent isn't approving dangerous or incorrect actions.
- **Guardrail Metric 2: Deflection Rate.** The % of total intercepted tool calls that are auto-resolved by the Supervisor Agent in the treatment group. If this is too low (<50%), the extra inference cost of the supervisor isn't justified by the labor savings.

### 1.5 How do we expect the key metrics to change?
- **MTTA:** Significant decrease. We expect a 90%+ reduction for auto-approved tasks.
- **DIR:** Neutral. We aim for no statistically significant increase in incidents compared to the human baseline.
- **Deflection Rate:** Increase. We expect the Supervisor Agent to handle the majority (75%+) of routine tasks, significantly reducing the volume of manual reviews.

### 1.6 Launch Criteria 
- **Main objective:** Greater than 70% reduction in Mean Time to Action (MTTA) for low complexity tool calls.
- **Guardrails:** 
    - Downstream Incident Rate must be equal to, better than, or within the margin (-1%) compared to the human baseline.
    - Deflection Rate must be greater than 50%.

### 1.7 Risks and Potential Impact
- **Silent Failure Risk:** If the Supervisor Agent and the Primary Agent share the same reasoning bias, the supervisor might hallucinate that a dangerous action is compliant.
- **Supervisor Fatigue:** If the Agent escalates too many false alarms to humans, the supervisors may start ignoring the flags, increasing risk.
- **Cost Overrun:** Running a high-reasoning model as a supervisor adds inference cost to every action. We must ensure the labor savings outweigh the API spend.

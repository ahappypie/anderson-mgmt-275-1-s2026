# What is this Repository?
This is the development environment, agent context and prototype for the final group assignment for UCLA Anderson's MGMT 275 Product Delivery class for the Spring 2026 quarter.

## Primary Assignment
The primary assignment is to design, document and build a new feature for an AI native product. This feature is for *learning purposes only*.

### Claude Governed Action Proxy
GAP detects high-risk tool calls (like `execute_wire_transfer`) and runs them through a deterministic policy engine (static, in this prototype). If the policy engine detects that the tool call requires escalation, it asks the appropriate supervisor (in this prototype, it is shown in the left sidebar, the `Action Pane`). Any action Claude takes is automatically logged (the right sidebar, the `Agent Pane`).

#### Usage
On first page load, you will see a suggested message. You can try other messages of this variety: `Transfer $AMOUNT to $RECIPIENT`. The automatic approval threshold is currently set at $10,000. In the future, when the policy engine is attached, complex rules will be written there.
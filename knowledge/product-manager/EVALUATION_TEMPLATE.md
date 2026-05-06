# AI Model Evaluation Template

**Instructions:** Design a robust evaluation framework for the non-deterministic (i.e. AI-native) portion of the feature proposed in the knowledge base following the template below. This exercise goes beyond traditional A/B testing to focus on building a rigorous "Eval Set" (a golden dataset of prompts and expected outputs) to measure model performance, hallucination rates, and latency. You must define success and guardrail metrics, bridging technical model evaluations with core business KPIs. The write-up must detail a "human-in-the-loop" or "agent-as-a-judge" testing strategy to ensure product reliability and safety.

Output will be judged based on the sophistication of the eval design and its alignment with broader business objectives.

—----------------------------LLM EVAL WRITE-UP TEMPLATE—----------------------------

# $NAME_OF_EVALUATION

## Pre-evaluation Write-up

### 0.0 Overview
[Text describing the AI-powered feature, the user problem it addresses, and the specific role the LLM plays in the product workflow.]

### 1.1 Eval Set Design (The Golden Dataset) 
[Define your "Eval Set." How many prompts will it include? Describe the methodology for prompt selection (e.g., real user queries, edge cases, adversarial prompts). Detail how you will define the "Ground Truth" or expected output for each prompt.]

### 1.2 Technical Performance Metrics
[Describe how you will measure the following technical aspects:]

* **Hallucination Rate:** How will you detect and quantify fabricated information?  
* **Correctness/Accuracy:** How will you grade the logical or factual validity of the response?  
* **Latency:** Define your P50 and P95 latency targets for a seamless user experience.  
* **Cost:** Establish the target cost-per-inference to ensure business viability.

### 1.3 Business KPI Alignment 
[Bridge the technical metrics above with core business goals.]
**Example:** If reducing the hallucination rate by 5% increases customer trust, how does that translate to **Churn Rate** or **Conversion**?

### 1.4 Evaluation Strategy: Human-in-the-Loop vs. Agent-as-a-Judge
[Detail your testing strategy. Will you use human experts to grade model outputs, or will you use a "Judge LLM" (e.g., using GPT-4o to grade Gemini outputs)? Justify your choice based on scale, cost, and the subjectivity of the task.]

### 1.5 Success and Guardrail Metrics
[Define the quantitative criteria for a successful launch.]
**Main Objective:** (e.g., The model must achieve >90% accuracy on the Golden Dataset.)  
**Guardrails:** (e.g., Latency must not exceed 2 seconds; Safety filters must block 100% of P0 toxic prompts.)

### 1.6 Reliability and Safety Guardrails
[How will you protect the product from adversarial attacks or "jailbreaks"? Describe the specific automated guardrails (e.g., PII filters, toxicity checks) you will implement before the output reaches the user.]

### 1.7 Risks and Potential Impact
[Identify what could go wrong. Consider "model drift" (performance changing over time), cost overruns, or the impact of false positives in safety filtering.]

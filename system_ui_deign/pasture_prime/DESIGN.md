# Design System Document

## 1. Overview & Creative North Star
**Creative North Star: "The Modern Agrarian"**
This design system moves away from the utilitarian, spreadsheet-heavy aesthetics typical of agricultural software. Instead, it embraces a high-end editorial feel that reflects the prestige and intentionality of modern dairy management. By leveraging the rich, organic greens and sun-drenched yellows of the brand, we create an experience that feels as professional as a financial institution yet as grounded as the earth itself.

The system breaks the "template" look through **Tonal Layering** and **Intentional Asymmetry**. We avoid rigid boxes in favor of breathable layouts where data isn't just displayed—it's curated. We use large-scale typography and overlapping surface elements to provide a sense of depth and architectural structure.

---

## 2. Colors
Our palette is rooted in the lush pastures and golden sunlight of the JUKAM logo.

*   **Primary (`#206223`) & Tertiary (`#1d622b`):** These represent the core brand. Use Primary for high-importance actions and Tertiary for subtle data accents or secondary success states.
*   **Secondary (`#795900`) & Secondary Container (`#fec330`):** These represent warmth and alertness. Use sparingly for highlights, status warnings, or key call-outs.
*   **The "No-Line" Rule:** We do not use 1px solid borders to define sections. Layout boundaries must be created through background shifts. A `surface-container-low` (`#f4f4ef`) section should sit directly against a `background` (`#fafaf5`) to create a clean, modern break.
*   **Surface Hierarchy:** 
    *   **Base:** `background` (#fafaf5)
    *   **Sections:** `surface-container-low` (#f4f4ef)
    *   **Elevated Content (Cards):** `surface-container-lowest` (#ffffff)
*   **Glass & Gradient Rule:** For main dashboard CTAs or hero sections, use a subtle linear gradient from `primary` (#206223) to `primary_container` (#3a7b3a). Floating navigation elements should utilize Glassmorphism (semi-transparent `surface` with a 12px backdrop-blur) to maintain a sense of lightness.

---

## 3. Typography
The typography strategy pairs the structural authority of **Manrope** with the approachable clarity of **Work Sans**.

*   **Display & Headline (Manrope):** These are our editorial anchors. Use `display-lg` to `headline-sm` for large data summaries (e.g., total milk yield) and page titles. The high x-height of Manrope conveys a modern, trustworthy "Digital Curator" vibe.
*   **Title & Body (Work Sans):** Chosen for its exceptional legibility at smaller scales. `title-lg` should be used for card headings, while `body-md` is the workhorse for data tables and dairy logs.
*   **Label (Work Sans):** Use `label-md` in all-caps with a 5% letter-spacing for category headers and metadata to provide an "architectural" feel to the interface.

---

## 4. Elevation & Depth
In this system, depth is a product of light and layering, not heavy shadows.

*   **The Layering Principle:** Stack surfaces to create focus. A card (`surface-container-lowest`) placed on a section (`surface-container-low`) creates a natural lift.
*   **Ambient Shadows:** For floating elements like dropdowns or modals, use a "Botanical Shadow": a 24px blur, 8% opacity, using the `on-surface` color (#1a1c19) shifted slightly toward green. It should feel like a soft glow, not a dark smudge.
*   **The "Ghost Border" Fallback:** If accessibility requires a border, use `outline-variant` (#bfcaba) at 20% opacity. This provides a "suggestion" of a line without cluttering the editorial space.
*   **Glassmorphism:** Apply a 60% opacity to `surface-container-lowest` for floating sidebar navigations or top bars, paired with a `backdrop-filter: blur(10px)`.

---

## 5. Components

### Sidebar Navigation
*   **Structure:** No vertical divider line. The sidebar is defined by a `surface-container` background.
*   **Active State:** Use a "pill" shape (`rounded-full`) with `primary-fixed` (#acf4a4) background and `on-primary-fixed` (#002203) text.
*   **Spacing:** Use `spacing-6` (1.5rem) between navigation items to ensure a premium, spacious feel.

### Cards & Tables
*   **Cards:** No borders. Use `rounded-xl` (0.75rem). Content should be padded with `spacing-5`.
*   **Tables:** Forbid the use of divider lines between rows. Use alternating row colors (zebra striping) with `surface-container-low` and `background`, or simply use `spacing-4` of vertical white space to separate entries. 
*   **Header:** Table headers should use `label-md` and `on-surface-variant` color.

### Buttons
*   **Primary:** `rounded-md` (0.375rem). Gradient background (`primary` to `primary_container`). 
*   **Secondary:** `rounded-md`. No fill. Ghost border (20% `outline-variant`).
*   **Interaction:** On hover, primary buttons should shift 2px upward with an ambient shadow.

### Input Fields
*   **Style:** Minimalist "Underline" or "Soft Box" style. Avoid heavy borders.
*   **States:** Focus state uses a 2px bottom border of `primary` (#206223). Error states use `error` (#ba1a1a) text and a `error_container` background tint.

### Relevant Dairy Management Components
*   **Livestock Status Chips:** Use `tertiary_fixed` (#abf4ac) for healthy status and `secondary_fixed` (#ffdfa0) for attention needed.
*   **Yield Sparklines:** Minimalist, no-axis line charts in `primary` color, nested within cards to show milk production trends at a glance.

---

## 6. Do's and Don'ts

### Do
*   **Do** use white space as a structural element. If a layout feels crowded, increase spacing tokens rather than adding lines.
*   **Do** use asymmetrical layouts (e.g., a wide 2/3 column for a main graph and a narrow 1/3 column for quick stats) to break the "standard dashboard" feel.
*   **Do** ensure all text on `primary` backgrounds uses `on-primary` (#ffffff) for AA accessibility.

### Don't
*   **Don't** use 100% black for text. Use `on-surface` (#1a1c19) to maintain the organic, premium tone.
*   **Don't** use default browser shadows. Always use our soft, diffused ambient shadows.
*   **Don't** use sharp corners. Everything in the dairy world is organic; stick to the `rounded-md` to `rounded-xl` scale to keep the UI feeling "friendly yet professional."
---
name: Poultry Management Design System
colors:
  surface: '#fbf9f8'
  surface-dim: '#dcd9d9'
  surface-bright: '#fbf9f8'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f3f3'
  surface-container: '#f0eded'
  surface-container-high: '#eae8e7'
  surface-container-highest: '#e4e2e1'
  on-surface: '#1b1c1c'
  on-surface-variant: '#41493e'
  inverse-surface: '#303030'
  inverse-on-surface: '#f2f0f0'
  outline: '#717a6d'
  outline-variant: '#c0c9bb'
  surface-tint: '#2a6b2c'
  primary: '#00450d'
  on-primary: '#ffffff'
  primary-container: '#1b5e20'
  on-primary-container: '#90d689'
  inverse-primary: '#91d78a'
  secondary: '#4a654e'
  on-secondary: '#ffffff'
  secondary-container: '#c9e7ca'
  on-secondary-container: '#4e6952'
  tertiary: '#363d33'
  on-tertiary: '#ffffff'
  tertiary-container: '#4d5449'
  on-tertiary-container: '#c1c8ba'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#acf4a4'
  primary-fixed-dim: '#91d78a'
  on-primary-fixed: '#002203'
  on-primary-fixed-variant: '#0c5216'
  secondary-fixed: '#cceacd'
  secondary-fixed-dim: '#b1ceb2'
  on-secondary-fixed: '#07200e'
  on-secondary-fixed-variant: '#334d37'
  tertiary-fixed: '#dee5d6'
  tertiary-fixed-dim: '#c2c9bb'
  on-tertiary-fixed: '#171d14'
  on-tertiary-fixed-variant: '#42493e'
  background: '#fbf9f8'
  on-background: '#1b1c1c'
  surface-variant: '#e4e2e1'
typography:
  display:
    fontFamily: Manrope
    fontSize: 40px
    fontWeight: '800'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  h1:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.3'
  h2:
    fontFamily: Manrope
    fontSize: 24px
    fontWeight: '700'
    lineHeight: '1.3'
  h3:
    fontFamily: Manrope
    fontSize: 20px
    fontWeight: '600'
    lineHeight: '1.4'
  body-lg:
    fontFamily: Manrope
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Manrope
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  body-sm:
    fontFamily: Manrope
    fontSize: 14px
    fontWeight: '400'
    lineHeight: '1.5'
  label-bold:
    fontFamily: Manrope
    fontSize: 12px
    fontWeight: '700'
    lineHeight: '1'
    letterSpacing: 0.05em
  label-md:
    fontFamily: Manrope
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 24px
  lg: 40px
  xl: 64px
  gutter: 24px
  margin: 32px
---

## Brand & Style

The design system is anchored in a "Modern Agrarian" aesthetic—balancing the grit of agricultural operations with the precision of modern data science. It is designed to evoke a sense of reliability, growth, and cleanliness, which are critical in poultry management and biosecurity environments. 

The style utilizes **Minimalism** as its core framework, leaning on heavy whitespace to reduce cognitive load for users who may be managing thousands of data points across multiple barns. By combining corporate professionalism with organic color accents, the UI feels both high-tech and grounded in the physical world.

## Colors

The palette is inspired by lush pastures and professional instrumentation.
- **Primary (Deep Emerald):** Used for primary actions, navigation headers, and critical branding elements. It provides the "weight" and authority needed for a professional SaaS.
- **Secondary (Soft Lime):** Used for highlighting growth, positive trends, and active states. It acts as a breath of fresh air against the deeper greens.
- **Surface & Backgrounds:** We use a very subtle off-white with a hint of green tint (#F9FBF9) for the main background to reduce eye strain compared to pure white, while keeping card surfaces pure white for maximum contrast.
- **Status Tints:** Success states leverage the soft lime, while warnings and errors use muted ambers and soft reds to maintain the calm, professional atmosphere without being jarring.

## Typography

This design system utilizes **Manrope** for its exceptional balance between geometric modernism and humanist readability. 

The hierarchy is strictly enforced to ensure that high-fidelity metrics (like bird weight or temperature) are immediately legible. **Display** and **H1** styles are reserved for dashboard summaries and page titles. We use a slightly tighter letter spacing on larger headlines to give them a premium, editorial feel, while body text remains open and accessible for long-form data tables.

## Layout & Spacing

The design system employs a **12-column fluid grid** for the main content area, allowing the dashboard to scale from tablets to wide-screen monitoring stations. 

A strict 8px rhythm (the "Base" unit) governs all spacing decisions. 
- **Margins:** 32px standard page margins ensure the content feels framed and intentional.
- **Gutters:** 24px gutters between cards provide significant "breathing room," reinforcing the minimalist aesthetic.
- **Component Padding:** Internal card padding is set to 24px (md) to ensure high-fidelity summary metrics are not cramped.

## Elevation & Depth

To achieve a clean and airy feel, this design system avoids heavy borders in favor of **Ambient Shadows** and **Tonal Layers**.

1.  **Level 0 (Background):** #F9FBF9 — The lowest layer.
2.  **Level 1 (Cards/Surface):** White (#FFFFFF) with a very soft, diffused shadow: `0px 10px 30px rgba(27, 94, 32, 0.05)`. Note the subtle Emerald tint in the shadow to maintain the agrarian color story.
3.  **Level 2 (Hover/Modals):** A slightly more pronounced shadow with a wider blur radius: `0px 20px 40px rgba(27, 94, 32, 0.10)`.

This approach creates a "floating" effect for metrics cards, making the data feel lightweight and manageable.

## Shapes

The shape language is defined by extreme approachability and softness. We use **2xl rounded corners** as a signature element of this design system.

- **Standard Containers:** 24px (1.5rem) corner radius for all primary dashboard cards and main containers.
- **Buttons & Inputs:** 12px (0.75rem) corner radius to provide a slight distinction from the larger cards while remaining soft.
- **Badges/Tags:** Fully pill-shaped (100px) to differentiate them from interactive elements and status containers.

These generous curves mirror organic forms found in nature, contrasting against the rigid data they contain.

## Components

### Buttons
- **Primary:** Deep Emerald background with White text. High-contrast, 12px radius.
- **Secondary:** Soft Lime background with Deep Emerald text. Low-contrast, used for secondary actions.
- **Ghost:** No background, Deep Emerald border or text only.

### Metrics Cards
The "High-Fidelity" summary cards should feature a large Display-style number, a small trend sparkline (using the Secondary lime or an Alert red), and a clear Body-sm label. Padding should be generous (24px) to emphasize the metric.

### Data Tables
Tables should avoid vertical borders entirely. Use horizontal dividers in a very light grey (#EEEEEE). Table headers use the `label-bold` style. Rows should have a subtle Soft Lime hover state to help the user track data across wide screens.

### Status Indicators & Badges
- **Badges:** Small, pill-shaped indicators with low-opacity background tints (e.g., a 10% opacity Soft Lime background for a "Healthy" status badge with 100% opacity Deep Emerald text).
- **Status Icons:** Use simple geometric shapes (dots) with the ambient shadow style for real-time barn status (e.g., "Active," "Standby," "Alert").

### Input Fields
Inputs should use a 1px border in a soft neutral, which transitions to a 2px Deep Emerald border on focus. The 12px corner radius should be consistent across all text entries.
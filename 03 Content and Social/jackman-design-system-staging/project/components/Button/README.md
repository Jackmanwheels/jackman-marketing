Buttons set the next action. Provide the label text and the click handler; the component supplies the styling.

- **Primary** is a `highlight` fill with `on-highlight` text (11.6:1). Use at most one per view. This is where the yellow earns its place.
- **Secondary** is transparent with a 2px `bronze` outline and `ink` text. Use for the supporting action beside a primary.
- **Text** is `ink` with a 2px `bronze` underline, used for in-copy links and the lowest-priority action.
- Labels are ALL CAPS, Poppins Bold 14px, 0.18em tracking. Keep them to one to three words and make them verbs: "Find your fit," not "Click here."
- Padding is `space-3` by `space-6`; corners are `radius-sm`. Focus shows a 2px solid `focus` ring offset 3px.
- Disabled uses `ink-muted` text and outline, not reduced opacity.
- **Don't** put a primary on a light surface with yellow text, set bronze text inside a button, or place a primary and secondary in different colors from these.

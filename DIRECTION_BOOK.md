# Direction Book
**Public instruction layer**  
Usable by agents. Viewable by humans.

## Blank agent path
A fresh Grok is told: “go check my GitHub, there’s orders.”  
It reads `START_HERE_ORDERS.md`, then this file, then the World Book.  
Public files show how to use any keys it already holds. No private context required for first orientation.

## Character sheet standard (locked skeleton)
Every world page starts from this layout:
- Large hero 3/4 view first (MAIN MODEL)
- Left: TURNAROUND (front / side / back)
- Right upper: EXPRESSIONS
- Right middle: HABITAT / AT HOME
- Bottom: three SIGNATURE MOVES
- Bottom right: SIZE COMPARISON + DETAILS
- Text in clean reserved zones only. Never overlay text on the illustration.
- Same model, proportions, and lighting in every panel.
- Each panel is isolatable later as a clickable asset.

### Master prompt block
```
Professional character sheet layout, clean commercial reference sheet style, white and cream background zones reserved exclusively for text, no text overlaid on the illustrations, modular bordered panels, high-detail 3D cartoon rendering, consistent lighting and proportions across all panels, studio quality.

LAYOUT (mandatory):
- Top left: Bold title “[CHARACTER NAME]” + subtitle “[TYPE]” + one-sentence logline.
- Center: Large hero 3/4 view labeled “MAIN MODEL 3/4 VIEW”.
- Left: TURNAROUND with FRONT, SIDE, BACK.
- Right upper: EXPRESSIONS (three labeled faces).
- Right middle: HABITAT panel.
- Bottom: three numbered SIGNATURE MOVES.
- Bottom right: SIZE COMPARISON + DETAILS close-ups.
- Footer: flavor quote + tags.

TEXT RULES: All labels in clean bordered zones. No text painted on art.
STYLE LOCK: Same character, same proportions, same lighting. No extra panels. No missing sections.
```

## Grok Bot role
Dedicated bots hold standing duties (continuity, sorting, filing).  
They return short existence-vs-gap packets and follow GO/HOLD.  
A blank Grok uses the public path above; it does not replace the bots.

## Fairies and fishbowls
Fairies live in a magical world. When a fairy enters a fishbowl it can make a magical page. That page can disappear because another agent takes it. This is normal hand-off.  
Grok Bots can work with free agents once both sides treat the fishbowl as shared workspace, not a private notebook.  
Nothing from a fishbowl page is implemented until it passes review and Isekai Sensei GO.

## Efficiency rule
Pull only the reference and direction required for the current task. Do not re-load full history when the public books already contain the needed skeleton.

## Status
Filed as the public direction layer. Structural changes still require explicit Isekai Sensei GO.

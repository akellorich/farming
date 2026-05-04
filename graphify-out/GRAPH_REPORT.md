# Graph Report - .  (2026-05-03)

## Corpus Check
- Large corpus: 268 files · ~2,825,991 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder, or use --no-semantic to run AST-only.

## Summary
- 5785 nodes · 15132 edges · 51 communities detected
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 134 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_PDF & Layout Engine|PDF & Layout Engine]]
- [[_COMMUNITY_UI Table Utilities|UI Table Utilities]]
- [[_COMMUNITY_TinyMCE Editor Core|TinyMCE Editor Core]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Email Messaging (PHPMailer)|Email Messaging (PHPMailer)]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_jQuery Core & AJAX|jQuery Core & AJAX]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Time & Date Utilities|Time & Date Utilities]]
- [[_COMMUNITY_DataTables Core Logic|DataTables Core Logic]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Compression & Binary Utils|Compression & Binary Utils]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Popper.js & Tooltip Logic|Popper.js & Tooltip Logic]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_User Management & Auth|User Management & Auth]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]
- [[_COMMUNITY_Community 26|Community 26]]
- [[_COMMUNITY_Community 27|Community 27]]
- [[_COMMUNITY_Community 28|Community 28]]
- [[_COMMUNITY_Community 29|Community 29]]
- [[_COMMUNITY_Community 30|Community 30]]
- [[_COMMUNITY_Community 31|Community 31]]
- [[_COMMUNITY_Community 32|Community 32]]
- [[_COMMUNITY_Community 33|Community 33]]
- [[_COMMUNITY_Community 34|Community 34]]
- [[_COMMUNITY_Community 35|Community 35]]
- [[_COMMUNITY_Community 36|Community 36]]
- [[_COMMUNITY_Community 37|Community 37]]
- [[_COMMUNITY_Community 38|Community 38]]
- [[_COMMUNITY_Community 39|Community 39]]
- [[_COMMUNITY_Community 40|Community 40]]
- [[_COMMUNITY_Community 41|Community 41]]
- [[_COMMUNITY_Community 42|Community 42]]
- [[_COMMUNITY_Community 43|Community 43]]
- [[_COMMUNITY_Community 45|Community 45]]
- [[_COMMUNITY_Community 46|Community 46]]
- [[_COMMUNITY_Community 47|Community 47]]
- [[_COMMUNITY_Community 48|Community 48]]
- [[_COMMUNITY_Community 50|Community 50]]
- [[_COMMUNITY_Community 51|Community 51]]
- [[_COMMUNITY_Community 61|Community 61]]

## God Nodes (most connected - your core abstractions)
1. `js` - 331 edges
2. `tn` - 124 edges
3. `PHPMailer` - 111 edges
4. `mN()` - 64 edges
5. `_classCallCheck()` - 61 edges
6. `_classCallCheck()` - 61 edges
7. `n()` - 59 edges
8. `User` - 46 edges
9. `N()` - 44 edges
10. `Ja()` - 42 edges

## Surprising Connections (you probably didn't know these)
- `jt()` --calls--> `_t()`  [INFERRED]
  plugins\datatables\datatables.min.js → plugins\Chart.min.js
- `jt()` --calls--> `_t()`  [INFERRED]
  plugins\datatables\DataTables-1.13.4\js\jquery.dataTables.min.js → plugins\Chart.min.js
- `it()` --calls--> `_t()`  [INFERRED]
  plugins\tinymce\models\dom\model.min.js → plugins\Chart.min.js
- `ht()` --calls--> `_t()`  [INFERRED]
  plugins\tinymce\models\dom\model.min.js → plugins\Chart.min.js
- `_fnFeatureHtmlTable()` --calls--> `size()`  [INFERRED]
  plugins\datatables\datatables.js → plugins\Chart.min.js

## Communities (138 total, 7 thin omitted)

### Community 0 - "PDF & Layout Engine"
Cohesion: 0.01
Nodes (524): AATLayoutEngine(), AATLookupTable(), AATMorxProcessor(), AATStateMachine(), addAll(), addChunk(), addMarkerToFirstLeaf(), _addNumericSort() (+516 more)

### Community 1 - "UI Table Utilities"
Cohesion: 0.01
Nodes (259): _fnFeatureHtmlTable(), _(), a(), aa(), addBox(), addElements(), Ae(), afterDatasetsUpdate() (+251 more)

### Community 2 - "TinyMCE Editor Core"
Cohesion: 0.01
Nodes (533): xl(), _i(), _(), A(), aa(), ab(), Ac(), ae() (+525 more)

### Community 3 - "Community 3"
Cohesion: 0.01
Nodes (429): AATLayoutEngine(), AATLookupTable(), AATMorxProcessor(), AATStateMachine(), addAll(), addChunk(), addMarkerToFirstLeaf(), addPageBreaksIfNecessary() (+421 more)

### Community 4 - "Community 4"
Cohesion: 0.01
Nodes (508): _t(), $(), $a(), aa(), Ab(), ac(), Ad(), Ae() (+500 more)

### Community 5 - "Community 5"
Cohesion: 0.02
Nodes (275): _(), A(), ac(), ad(), ae(), ai(), al(), am() (+267 more)

### Community 6 - "Email Messaging (PHPMailer)"
Cohesion: 0.03
Nodes (3): PHPMailer, POP3, SMTP

### Community 7 - "Community 7"
Cohesion: 0.04
Nodes (85): A(), ao(), At(), b(), be(), bo(), C(), ce() (+77 more)

### Community 8 - "jQuery Core & AJAX"
Cohesion: 0.02
Nodes (61): addCombinator(), adoptValue(), ajaxConvert(), ajaxHandleResponses(), Animation(), boxModelAdjustment(), buildFragment(), buildParams() (+53 more)

### Community 9 - "Community 9"
Cohesion: 0.1
Nodes (102): _(), A(), ae(), Ao(), at(), B(), bo(), bt() (+94 more)

### Community 10 - "Time & Date Utilities"
Cohesion: 0.02
Nodes (19): convertToAscii(), convertToNumeric(), decimalToRoman(), filtercompanyunits(), formatDate(), formatTime(), generatenumbers(), getdaysinmonth() (+11 more)

### Community 11 - "DataTables Core Logic"
Cohesion: 0.05
Nodes (87): _fnLog(), _addNumericSort(), _fnAddColumn(), _fnAddData(), _fnAddOptionsHtml(), _fnAddTr(), _fnAdjustColumnSizing(), _fnAjaxDataSrc() (+79 more)

### Community 12 - "Community 12"
Cohesion: 0.06
Nodes (64): a(), ae(), b(), be(), c(), ce(), D(), de() (+56 more)

### Community 13 - "Compression & Binary Utils"
Cohesion: 0.05
Nodes (63): adler32(), bi_flush(), bi_reverse(), bi_windup(), build_bl_tree(), build_tree(), compress_block(), copy_block() (+55 more)

### Community 14 - "Community 14"
Cohesion: 0.1
Nodes (63): _(), A(), Ao(), at(), b(), bo(), c(), Co() (+55 more)

### Community 15 - "Community 15"
Cohesion: 0.11
Nodes (67): a(), ae(), at(), bt(), C(), ce(), ct(), d() (+59 more)

### Community 16 - "Community 16"
Cohesion: 0.06
Nodes (42): $(), a(), ae(), B(), be(), ce(), d(), de() (+34 more)

### Community 17 - "Popper.js & Tooltip Logic"
Cohesion: 0.08
Nodes (60): applyStyle(), applyStyleOnLoad(), arrow(), attachToScrollParents(), clockwise(), computeAutoPlacement(), computeStyle(), destroy() (+52 more)

### Community 18 - "Community 18"
Cohesion: 0.06
Nodes (31): ae(), b(), be(), d(), ee(), fe(), g(), H() (+23 more)

### Community 19 - "Community 19"
Cohesion: 0.07
Nodes (24): _(), b(), C(), e(), Ee(), h(), he(), j() (+16 more)

### Community 20 - "Community 20"
Cohesion: 0.08
Nodes (28): $(), ae(), B(), c(), ce(), d(), E(), F() (+20 more)

### Community 21 - "Community 21"
Cohesion: 0.08
Nodes (23): $(), b(), c(), D(), e(), ee(), G(), H() (+15 more)

### Community 23 - "Community 23"
Cohesion: 0.08
Nodes (13): a, b(), c(), d(), e(), i(), L(), n() (+5 more)

### Community 24 - "Community 24"
Cohesion: 0.09
Nodes (9): a, e(), g(), i(), l(), m(), O(), T() (+1 more)

### Community 25 - "Community 25"
Cohesion: 0.08
Nodes (9): A(), C(), l, o(), r(), t(), u(), v() (+1 more)

### Community 26 - "Community 26"
Cohesion: 0.08
Nodes (7): a, b(), c(), D(), e(), n(), u()

### Community 27 - "Community 27"
Cohesion: 0.07
Nodes (4): a(), f(), p(), u

### Community 28 - "Community 28"
Cohesion: 0.09
Nodes (6): h, i(), k(), r(), t(), y()

### Community 29 - "Community 29"
Cohesion: 0.09
Nodes (7): a, d(), e(), h(), i(), l(), u()

### Community 30 - "Community 30"
Cohesion: 0.09
Nodes (7): A(), b(), D(), M(), N(), O(), t()

### Community 31 - "Community 31"
Cohesion: 0.1
Nodes (5): c(), d(), g(), n, t()

### Community 32 - "Community 32"
Cohesion: 0.3
Nodes (26): A(), B(), c(), d(), e(), f(), g(), h() (+18 more)

### Community 33 - "Community 33"
Cohesion: 0.1
Nodes (9): allowedAttribute(), _createClass(), _defineProperties(), getSpecialTransitionEndEvent(), _inheritsLoose(), sanitizeHtml(), _setPrototypeOf(), setTransitionEndSupport() (+1 more)

### Community 34 - "Community 34"
Cohesion: 0.1
Nodes (9): allowedAttribute(), _createClass(), _defineProperties(), getSpecialTransitionEndEvent(), _inheritsLoose(), sanitizeHtml(), _setPrototypeOf(), setTransitionEndSupport() (+1 more)

### Community 36 - "Community 36"
Cohesion: 0.2
Nodes (10): A(), B(), D(), E(), f(), k(), R(), S() (+2 more)

### Community 37 - "Community 37"
Cohesion: 0.3
Nodes (9): e(), f(), g(), m(), n(), o(), p(), v() (+1 more)

### Community 38 - "Community 38"
Cohesion: 0.18
Nodes (10): AstNode, DomTreeWalker, Editor, EditorCommands, EventDispatcher, EventUtils, NodeChange, ScriptLoader (+2 more)

### Community 40 - "Community 40"
Cohesion: 0.33
Nodes (4): E(), N(), r(), z()

### Community 41 - "Community 41"
Cohesion: 0.28
Nodes (4): d(), i(), l(), s()

### Community 42 - "Community 42"
Cohesion: 0.33
Nodes (6): d(), g(), i(), k(), m(), p()

### Community 43 - "Community 43"
Cohesion: 0.36
Nodes (4): A(), e(), i(), t()

### Community 45 - "Community 45"
Cohesion: 0.38
Nodes (3): o(), S(), t()

### Community 46 - "Community 46"
Cohesion: 0.43
Nodes (4): c(), d(), s(), u()

### Community 50 - "Community 50"
Cohesion: 0.6
Nodes (3): a(), g(), l()

## Knowledge Gaps
- **10 isolated node(s):** `EventDispatcher`, `AstNode`, `NodeChange`, `EventUtils`, `EditorCommands` (+5 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `js` connect `UI Table Utilities` to `TinyMCE Editor Core`, `Community 4`?**
  _High betweenness centrality (0.174) - this node is a cross-community bridge._
- **Why does `zx()` connect `Community 4` to `Community 9`?**
  _High betweenness centrality (0.090) - this node is a cross-community bridge._
- **Why does `_t()` connect `Community 4` to `UI Table Utilities`, `Community 5`, `Community 9`, `Community 15`?**
  _High betweenness centrality (0.081) - this node is a cross-community bridge._
- **What connects `EventDispatcher`, `AstNode`, `NodeChange` to the rest of the system?**
  _10 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `PDF & Layout Engine` be split into smaller, more focused modules?**
  _Cohesion score 0.01 - nodes in this community are weakly interconnected._
- **Should `UI Table Utilities` be split into smaller, more focused modules?**
  _Cohesion score 0.01 - nodes in this community are weakly interconnected._
- **Should `TinyMCE Editor Core` be split into smaller, more focused modules?**
  _Cohesion score 0.01 - nodes in this community are weakly interconnected._
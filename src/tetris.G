;GIL-3
(
(
	:type                   :base-window
	:name                   window
	:owner                  nil
	:width                  281
	:height                 361
	:background-color       ""
	:foreground-color       ""
	:label                  "BloX 1.0"
	:label-type             :string
	:initial-state          :open
	:show-footer            t
	:resizable              nil
	:icon-file              "../include/tetris.icon"
	:icon-label             ""
	:icon-mask-file         "../include/tetris.mask.icon"
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :control-area
	:name                   controls1
	:owner                  window
	:help                   ""
	:x                      0
	:y                      0
	:width                  281
	:height                 41
	:background-color       ""
	:foreground-color       ""
	:initial-state          :visible
	:show-border            nil
	:menu                   nil
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :button
	:name                   start_button
	:owner                  controls1
	:help                   ""
	:x                      8
	:y                      8
	:width                  28
	:height                 26
	:constant-width         t
	:button-type            :normal
	:foreground-color       ""
	:label                  "../include/start.button"
	:label-type             :glyph
	:initial-state          :active
	:menu                   nil
	:notify-handler         start_handler
	:event-handler          nil
	:user-data              ()
	:actions                (
		(
		:from                   (window start_button)
		:when                   (Notify )
		:to                     (window start_button)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (start_handler)
		)
	)
)
(
	:type                   :setting
	:name                   type_setting
	:owner                  controls1
	:help                   ""
	:x                      60
	:y                      8
	:width                  52
	:height                 26
	:value-x                60
	:value-y                8
	:rows                   1
	:columns                0
	:layout-type            :horizontal
	:foreground-color       ""
	:setting-type           :exclusive
	:selection-required     t
	:label                  ""
	:label-type             :string
	:notify-handler         type_notify
	:event-handler          nil
	:choices                ("../include/blox.button" "../include/tetris.button" )
	:choice-label-types     (:glyph :glyph )
	:choice-colors          ("" "" )
	:initial-selections     (t nil )
	:initial-state          :active
	:user-data              ()
	:actions                (
		(
		:from                   (window type_setting)
		:when                   (Notify )
		:to                     (window type_setting)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (type_notify)
		)
	)
)
(
	:type                   :setting
	:name                   size_setting
	:owner                  controls1
	:help                   ""
	:x                      116
	:y                      8
	:width                  52
	:height                 26
	:value-x                116
	:value-y                8
	:rows                   1
	:columns                0
	:layout-type            :horizontal
	:foreground-color       ""
	:setting-type           :exclusive
	:selection-required     t
	:label                  ""
	:label-type             :string
	:notify-handler         size_notify
	:event-handler          nil
	:choices                ("../include/small.button" "../include/big.button" )
	:choice-label-types     (:glyph :glyph )
	:choice-colors          ("" "" )
	:initial-selections     (t nil )
	:initial-state          :active
	:user-data              ()
	:actions                (
		(
		:from                   (window size_setting)
		:when                   (Notify )
		:to                     (window size_setting)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (size_notify)
		)
	)
)
(
	:type                   :setting
	:name                   color_setting
	:owner                  controls1
	:help                   ""
	:x                      172
	:y                      8
	:width                  52
	:height                 26
	:value-x                172
	:value-y                8
	:rows                   1
	:columns                0
	:layout-type            :horizontal
	:foreground-color       ""
	:setting-type           :exclusive
	:selection-required     t
	:label                  ""
	:label-type             :string
	:notify-handler         color_notify
	:event-handler          nil
	:choices                ("../include/color.button" "../include/mono.button" )
	:choice-label-types     (:glyph :glyph )
	:choice-colors          ("" "" )
	:initial-selections     (t nil )
	:initial-state          :active
	:user-data              ()
	:actions                (
		(
		:from                   (window color_setting)
		:when                   (Notify )
		:to                     (window color_setting)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (color_notify)
		)
	)
)
(
	:type                   :button
	:name                   help_button
	:owner                  controls1
	:help                   ""
	:x                      236
	:y                      8
	:width                  28
	:height                 26
	:constant-width         t
	:button-type            :normal
	:foreground-color       ""
	:label                  "../include/help.button"
	:label-type             :glyph
	:initial-state          :active
	:menu                   nil
	:notify-handler         help_button_handler
	:event-handler          nil
	:user-data              ()
	:actions                (
		(
		:from                   (window help_button)
		:when                   (Notify )
		:to                     (window help_button)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (help_button_handler)
		)
	)
)
(
	:type                   :control-area
	:name                   controls2
	:owner                  window
	:help                   ""
	:x                      0
	:y                      41
	:width                  121
	:height                 320
	:background-color       ""
	:foreground-color       ""
	:initial-state          :visible
	:show-border            nil
	:menu                   nil
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   score_message
	:owner                  controls2
	:help                   ""
	:x                      44
	:y                      4
	:width                  37
	:height                 13
	:foreground-color       ""
	:label                  "Score"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   score
	:owner                  controls2
	:help                   ""
	:x                      36
	:y                      20
	:width                  56
	:height                 13
	:foreground-color       ""
	:label                  "0000000"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   lines_message
	:owner                  controls2
	:help                   ""
	:x                      44
	:y                      40
	:width                  38
	:height                 13
	:foreground-color       ""
	:label                  "Lines"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   lines
	:owner                  controls2
	:help                   ""
	:x                      60
	:y                      56
	:width                  8
	:height                 13
	:foreground-color       ""
	:label                  "0"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   level_message
	:owner                  controls2
	:help                   ""
	:x                      44
	:y                      72
	:width                  37
	:height                 13
	:foreground-color       ""
	:label                  "Level"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   level
	:owner                  controls2
	:help                   ""
	:x                      60
	:y                      88
	:width                  8
	:height                 13
	:foreground-color       ""
	:label                  "0"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :setting
	:name                   level_setting
	:owner                  controls2
	:help                   ""
	:x                      24
	:y                      108
	:width                  72
	:height                 86
	:value-x                24
	:value-y                125
	:rows                   0
	:columns                3
	:layout-type            :vertical
	:foreground-color       ""
	:setting-type           :exclusive
	:selection-required     t
	:label                  "Level:"
	:label-type             :string
	:notify-handler         level_notify
	:event-handler          nil
	:choices                ("1" "4" "7" "2" "5" "8" "3" "6" "9" )
	:choice-label-types     (:string :string :string :string :string :string :string :string :string )
	:choice-colors          ("" "" "" "" "" "" "" "" "" )
	:initial-selections     (nil nil nil nil nil nil t nil nil )
	:initial-state          :active
	:user-data              ()
	:actions                (
		(
		:from                   (window level_setting)
		:when                   (Notify )
		:to                     (window level_setting)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (level_notify)
		)
	)
)
(
	:type                   :setting
	:name                   height_setting
	:owner                  controls2
	:help                   ""
	:x                      12
	:y                      200
	:width                  96
	:height                 109
	:value-x                12
	:value-y                217
	:rows                   0
	:columns                3
	:layout-type            :vertical
	:foreground-color       ""
	:setting-type           :exclusive
	:selection-required     t
	:label                  "Height:"
	:label-type             :string
	:notify-handler         height_notify
	:event-handler          nil
	:choices                (" 0" " 3" " 6" " 9" " 1" " 4" " 7" "10" " 2" " 5" " 8" "11" )
	:choice-label-types     (:string :string :string :string :string :string :string :string :string :string :string :string )
	:choice-colors          ("" "" "" "" "" "" "" "" "" "" "" "" )
	:initial-selections     (nil nil nil nil nil nil nil nil nil nil nil nil )
	:initial-state          :active
	:user-data              ()
	:actions                (
		(
		:from                   (window height_setting)
		:when                   (Notify )
		:to                     (window height_setting)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (height_notify)
		)
	)
)
(
	:type                   :canvas-pane
	:name                   canvas
	:owner                  window
	:help                   ""
	:x                      121
	:y                      41
	:width                  160
	:height                 320
	:background-color       "Black"
	:foreground-color       "Black"
	:initial-state          :visible
	:draggable              nil
	:droppable              nil
	:default-drop-site      nil
	:menu                   nil
	:horizontal-scrollbar   nil
	:scrollable-width       160
	:vertical-scrollbar     nil
	:scrollable-height      320
	:repaint-proc           nil
	:event-handler          canvas_events
	:drawing-model          :xwindows
	:user-data              ()
	:actions                (
		(
		:from                   (window canvas)
		:when                   (AnyEvent )
		:to                     (window canvas)
		:function_type          CallFunction
		:arg_type               ()
		:action                 (canvas_events)
		)
	)
)
(
	:type                   :popup-window
	:name                   popup
	:owner                  window
	:width                  495
	:height                 770
	:background-color       ""
	:foreground-color       ""
	:label                  "BloX: Help"
	:label-type             :string
	:initial-state          :invisible
	:show-footer            nil
	:resizable              nil
	:pinned                 t
	:done-handler           nil
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :control-area
	:name                   controls3
	:owner                  popup
	:help                   ""
	:x                      0
	:y                      0
	:width                  495
	:height                 770
	:background-color       ""
	:foreground-color       ""
	:initial-state          :visible
	:show-border            nil
	:menu                   nil
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message39
	:owner                  controls3
	:help                   ""
	:x                      429
	:y                      4
	:width                  64
	:height                 64
	:foreground-color       "BG3"
	:label                  "../include/vixen.shades.icon"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message41
	:owner                  controls3
	:help                   ""
	:x                      428
	:y                      69
	:width                  64
	:height                 64
	:foreground-color       "Dim Gray"
	:label                  "../include/vixen.text.icon"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group15
	:x                      428
	:y                      4
	:group-type             nil
	:members                (message39 message41 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message1
	:owner                  controls3
	:help                   ""
	:x                      8
	:y                      8
	:width                  54
	:height                 13
	:foreground-color       ""
	:label                  "BloX 1.0"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message4
	:owner                  controls3
	:help                   ""
	:x                      72
	:y                      8
	:width                  64
	:height                 64
	:foreground-color       ""
	:label                  "../include/tetris.icon"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message40
	:owner                  controls3
	:help                   ""
	:x                      192
	:y                      32
	:width                  142
	:height                 13
	:foreground-color       ""
	:label                  "\"All WORK and no PLAY"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message42
	:owner                  controls3
	:help                   ""
	:x                      196
	:y                      48
	:width                  153
	:height                 13
	:foreground-color       ""
	:label                  "makes SPARC a dull toy!\""
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message10
	:owner                  controls3
	:help                   ""
	:x                      16
	:y                      96
	:width                  41
	:height                 13
	:foreground-color       ""
	:label                  "Game:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message11
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      96
	:width                  370
	:height                 13
	:foreground-color       ""
	:label                  "Game is over when no more blocks can fall down the screen."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message14
	:owner                  controls3
	:help                   ""
	:x                      16
	:y                      116
	:width                  54
	:height                 13
	:foreground-color       ""
	:label                  "Scoring:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message15
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      116
	:width                  216
	:height                 13
	:foreground-color       ""
	:label                  "Object reaches bottom  = 32 points"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message16
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      132
	:width                  230
	:height                 13
	:foreground-color       ""
	:label                  "First horizontal line      = 100 points  "
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message27
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      148
	:width                  230
	:height                 13
	:foreground-color       ""
	:label                  "Second horizontal line  = 200 points  "
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message30
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      164
	:width                  232
	:height                 13
	:foreground-color       ""
	:label                  "Third horizontal line     = 400 points  "
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message33
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      180
	:width                  231
	:height                 13
	:foreground-color       ""
	:label                  "Fourth horizontal line   = 800 points  "
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message5
	:owner                  controls3
	:help                   ""
	:x                      16
	:y                      204
	:width                  105
	:height                 13
	:foreground-color       ""
	:label                  "Mouse Buttons:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message9
	:owner                  controls3
	:help                   ""
	:x                      172
	:y                      204
	:width                  64
	:height                 64
	:foreground-color       ""
	:label                  "../include/mouse.icon"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message6
	:owner                  controls3
	:help                   ""
	:x                      112
	:y                      224
	:width                  59
	:height                 13
	:foreground-color       ""
	:label                  "Move Left"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message8
	:owner                  controls3
	:help                   ""
	:x                      240
	:y                      224
	:width                  68
	:height                 13
	:foreground-color       ""
	:label                  "Move Right"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message7
	:owner                  controls3
	:help                   ""
	:x                      184
	:y                      268
	:width                  39
	:height                 13
	:foreground-color       ""
	:label                  "Rotate"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group2
	:x                      112
	:y                      204
	:group-type             nil
	:members                (message9 message6 message8 message7 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message19
	:owner                  controls3
	:help                   ""
	:x                      16
	:y                      288
	:width                  147
	:height                 13
	:foreground-color       ""
	:label                  "Keyboard Commands:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message20
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      304
	:width                  247
	:height                 13
	:foreground-color       ""
	:label                  "SPACE BAR = Accelerate block to bottom."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message21
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      320
	:width                  114
	:height                 13
	:foreground-color       ""
	:label                  "A or J  = Move Left."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message22
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      336
	:width                  128
	:height                 13
	:foreground-color       ""
	:label                  "S or K = Rotate Block."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message23
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      352
	:width                  122
	:height                 13
	:foreground-color       ""
	:label                  "D or L = Move Right."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message47
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      384
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/start.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message48
	:owner                  controls3
	:help                   ""
	:x                      40
	:y                      387
	:width                  3
	:height                 13
	:foreground-color       ""
	:label                  ":"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group6
	:x                      20
	:y                      384
	:group-type             nil
	:members                (message47 message48 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message54
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      387
	:width                  99
	:height                 13
	:foreground-color       ""
	:label                  "Starts the game."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group11
	:x                      20
	:y                      384
	:group-type             nil
	:members                (group6 message54 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message12
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      404
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/blox.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message24
	:owner                  controls3
	:help                   ""
	:x                      40
	:y                      404
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/tetris.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message25
	:owner                  controls3
	:help                   ""
	:x                      60
	:y                      407
	:width                  3
	:height                 13
	:foreground-color       ""
	:label                  ":"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group4
	:x                      20
	:y                      404
	:group-type             nil
	:members                (message12 message24 message25 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message51
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      408
	:width                  356
	:height                 13
	:foreground-color       ""
	:label                  "Switches between BloX objects and Russian based objects."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group8
	:x                      20
	:y                      404
	:group-type             nil
	:members                (group4 message51 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message26
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      425
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/small.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message38
	:owner                  controls3
	:help                   ""
	:x                      40
	:y                      425
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/big.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message43
	:owner                  controls3
	:help                   ""
	:x                      60
	:y                      428
	:width                  3
	:height                 13
	:foreground-color       ""
	:label                  ":"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group3
	:x                      20
	:y                      425
	:group-type             nil
	:members                (message26 message38 message43 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message52
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      429
	:width                  281
	:height                 13
	:foreground-color       ""
	:label                  "Switches between little blocks and big blocks."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group9
	:x                      20
	:y                      425
	:group-type             nil
	:members                (group3 message52 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message44
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      446
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/color.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message45
	:owner                  controls3
	:help                   ""
	:x                      40
	:y                      446
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/mono.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message46
	:owner                  controls3
	:help                   ""
	:x                      60
	:y                      449
	:width                  3
	:height                 13
	:foreground-color       ""
	:label                  ":"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group5
	:x                      20
	:y                      446
	:group-type             nil
	:members                (message44 message45 message46 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message53
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      449
	:width                  257
	:height                 13
	:foreground-color       ""
	:label                  "Switches between color and monochrome."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group10
	:x                      20
	:y                      446
	:group-type             nil
	:members                (group5 message53 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message49
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      466
	:width                  16
	:height                 16
	:foreground-color       ""
	:label                  "../include/help.button"
	:label-type             :glyph
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message50
	:owner                  controls3
	:help                   ""
	:x                      40
	:y                      469
	:width                  3
	:height                 13
	:foreground-color       ""
	:label                  ":"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group7
	:x                      20
	:y                      466
	:group-type             nil
	:members                (message49 message50 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message55
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      469
	:width                  156
	:height                 13
	:foreground-color       ""
	:label                  "Brings up this help panel."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group12
	:x                      20
	:y                      466
	:group-type             nil
	:members                (group7 message55 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message34
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      486
	:width                  40
	:height                 13
	:foreground-color       ""
	:label                  "Level:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message36
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      486
	:width                  339
	:height                 13
	:foreground-color       ""
	:label                  "Level determines speed.  Level increases every 15 lines."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group14
	:x                      20
	:y                      486
	:group-type             nil
	:members                (message34 message36 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message35
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      503
	:width                  48
	:height                 13
	:foreground-color       ""
	:label                  "Height:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message37
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      503
	:width                  353
	:height                 13
	:foreground-color       ""
	:label                  "Height places obstacles on the field up to selected height."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group13
	:x                      20
	:y                      503
	:group-type             nil
	:members                (message35 message37 )
	:rows                   0
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message3
	:owner                  controls3
	:help                   ""
	:x                      20
	:y                      528
	:width                  105
	:height                 13
	:foreground-color       ""
	:label                  "Command Line:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message57
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      544
	:width                  99
	:height                 13
	:foreground-color       ""
	:label                  "-b =  Big blocks."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message58
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      561
	:width                  155
	:height                 13
	:foreground-color       ""
	:label                  "-m = Monochrome mode."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message59
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      578
	:width                  130
	:height                 13
	:foreground-color       ""
	:label                  "-t =  Russian objects."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message56
	:owner                  controls3
	:help                   ""
	:x                      76
	:y                      595
	:width                  155
	:height                 13
	:foreground-color       ""
	:label                  "-s =  Sun Logos in blocks."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message13
	:owner                  controls3
	:help                   ""
	:x                      32
	:y                      624
	:width                  120
	:height                 13
	:foreground-color       ""
	:label                  "Bugs & Upgrades:"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message28
	:owner                  controls3
	:help                   ""
	:x                      92
	:y                      640
	:width                  357
	:height                 13
	:foreground-color       ""
	:label                  "To register your copy and receive notices for upgrades and"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message29
	:owner                  controls3
	:help                   ""
	:x                      92
	:y                      656
	:width                  82
	:height                 13
	:foreground-color       ""
	:label                  "new releases,"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message17
	:owner                  controls3
	:help                   ""
	:x                      184
	:y                      656
	:width                  267
	:height                 13
	:foreground-color       ""
	:label                  "send $10 and the name of this program to: "
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group1
	:x                      92
	:y                      656
	:group-type             nil
	:members                (message29 message17 )
	:rows                   1
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message18
	:owner                  controls3
	:help                   ""
	:x                      160
	:y                      680
	:width                  103
	:height                 13
	:foreground-color       "Black"
	:label                  "viXen Software"
	:label-type             :string
	:label-bold             t
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message31
	:owner                  controls3
	:help                   ""
	:x                      160
	:y                      696
	:width                  85
	:height                 13
	:foreground-color       "Black"
	:label                  "P.O. Box 7974"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message32
	:owner                  controls3
	:help                   ""
	:x                      160
	:y                      712
	:width                  159
	:height                 13
	:foreground-color       "Black"
	:label                  "Fremont, CA 94537-7974"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message2
	:owner                  controls3
	:help                   ""
	:x                      116
	:y                      736
	:width                  206
	:height                 13
	:foreground-color       ""
	:label                  "Copyright (c)1992 viXen Software"
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
(
	:type                   :group
	:name                   group16
	:x                      116
	:y                      736
	:group-type             nil
	:members                (message2 )
	:rows                   1
	:row-alignment          :top-edges
	:columns                0
	:column-alignment       :left-edges
	:horizontal-spacing     10
	:vertical-spacing       10
	:anchor-object          nil
	:anchor-point           :north-west
	:reference-point        :north-west
	:horizontal-offset      0
	:vertical-offset        0
	:user-data              ()
	:actions                ()
)
(
	:type                   :message
	:name                   message60
	:owner                  controls3
	:help                   ""
	:x                      32
	:y                      756
	:width                  393
	:height                 13
	:foreground-color       ""
	:label                  "The Sun logo is a registered trademark of Sun Microsystems, Inc."
	:label-type             :string
	:label-bold             nil
	:initial-state          :active
	:event-handler          nil
	:user-data              ()
	:actions                ()
)
)

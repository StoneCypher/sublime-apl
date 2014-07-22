⍝  This is the code found in the example screenshots in the
⍝  readme.  It's code extracted from a solitaire dealing
⍝  example, comments removed, from the APL wiki, found at
⍝
⍝  http://aplwiki.com/SolitaireGame
⍝
⍝  This code appears to be by Stephen Taylor and is used 
⍝  in the belief that it has been released to public domain.
⍝  This is not valid standalone code.





∇ Move(this dst);src;leave;card
  :Access Public
  card←identify if notref this
  :If card=⊃Discards
      (dst⊃Table),←card
      Discards↓⍨←1
  :ElseIf card∊⊃¨Stacks
      (dst⊃Table),←card
      src←SUITS⍳card.Suit
      (src⊃Stacks)↓⍨←1
  :Else
      src←1⍳⍨card∘∊¨Table
      leave←1-⍨(src⊃Table)⍳card
      (dst⊃Table),←leave↓src⊃Table
      (src⊃Table)↑⍨←leave
      (⊃⌽src⊃Table).FaceUp←1
  :EndIf
  Arrange
∇

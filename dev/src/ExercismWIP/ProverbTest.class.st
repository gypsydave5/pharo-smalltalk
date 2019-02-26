"
# Proverb

For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list `[""nail"", ""shoe"", ""horse"", ""rider"", ""message"", ""battle"", ""kingdom""]`, you will output the full text of this proverbial rhyme:

```text
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
```

Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.

## Hint

TBD

"
Class {
	#name : #ProverbTest,
	#superclass : #ExercismTest,
	#instVars : [
		'proverbCalculator'
	],
	#category : #'ExercismWIP-Proverb'
}

{ #category : #config }
ProverbTest class >> uuid [
	"Answer a unique id for this exercise"
	^'b721ead9-2b3f-0d00-a2c3-cf7209f0590c'
]

{ #category : #config }
ProverbTest class >> version [
	"Generated from specification: 26 February 2019"
	^'1.1.0'
]

{ #category : #setup }
ProverbTest >> setUp [
	proverbCalculator := Proverb new
]

{ #category : #test }
ProverbTest >> testFourPiecesModernized [
	| result |

	result := proverbCalculator reciteStrings: #('pin' 'gun' 'soldier' 'battle' ) .
	self assert: result equals: #('For want of a pin the gun was lost.' 'For want of a gun the soldier was lost.' 'For want of a soldier the battle was lost.' 'And all for the want of a pin.' )
]

{ #category : #test }
ProverbTest >> testFullProverb [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' 'horse' 'rider' 'message' 'battle' 'kingdom' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'For want of a shoe the horse was lost.' 'For want of a horse the rider was lost.' 'For want of a rider the message was lost.' 'For want of a message the battle was lost.' 'For want of a battle the kingdom was lost.' 'And all for the want of a nail.' )
]

{ #category : #test }
ProverbTest >> testOnePiece [
	| result |

	result := proverbCalculator reciteStrings: #('nail' ) .
	self assert: result equals: #('And all for the want of a nail.' )
]

{ #category : #test }
ProverbTest >> testThreePieces [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' 'horse' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'For want of a shoe the horse was lost.' 'And all for the want of a nail.' )
]

{ #category : #test }
ProverbTest >> testTwoPieces [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'And all for the want of a nail.' )
]

{ #category : #test }
ProverbTest >> testZeroPieces [
	| result |

	result := proverbCalculator reciteStrings: #() .
	self assert: result equals: #()
]
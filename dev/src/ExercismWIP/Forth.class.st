Class {
	#name : #Forth,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'ExercismWIP-Forth'
}

{ #category : #validating }
Forth >> checkStack [
	stack ifEmpty: [ self error: 'empty stack' ].
	stack size = 1
		ifTrue: [ self error: 'only one value on the stack' ]
]

{ #category : #evaluating }
Forth >> evaluateInstructions: aCollection [
	aCollection do: [ :string |
		(string splitOn: Character space)
			do: [ :each | stack push: (self evaluateWord: each) ] ].
	^ stack reverse asArray
]

{ #category : #evaluating }
Forth >> evaluateWord: aString [ 
	(self isSignedInteger: aString)
		ifTrue: [ ^ aString asInteger ]
		ifFalse: [
			aString = '+' ifTrue: [ ^ self performAddition ].
			aString = '-' ifTrue: [ ^ self performSubtraction ].
			aString = '*' ifTrue: [ ^ self performMultiplication ].
			^ aString ]
]

{ #category : #initialization }
Forth >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #testing }
Forth >> isSignedInteger: aString [ 
	^ aString isAllDigits
		or: [ aString first = $-
			and: [ aString allButFirst isAllDigits ] ]
]

{ #category : #operating }
Forth >> performAddition [
	stack size < 2 ifTrue: [ self error: 'empty stack' ].
	^ stack pop + stack pop
]

{ #category : #operating }
Forth >> performMultiplication [
	stack size < 2 ifTrue: [ self error: 'empty stack' ].
	^ stack pop * stack pop
]

{ #category : #operating }
Forth >> performSubtraction [
	stack size < 2 ifTrue: [ self error: 'empty stack' ].
	^ stack pop negated + stack pop
]
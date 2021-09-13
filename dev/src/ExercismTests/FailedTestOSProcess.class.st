Class {
	#name : #FailedTestOSProcess,
	#superclass : #OSSUnixSubprocess,
	#category : #'ExercismTests-UnitTests'
}

{ #category : #settings }
FailedTestOSProcess >> command: aString [
	
	^ self
]

{ #category : #testing }
FailedTestOSProcess >> isSuccess [
	"Answers whether the process has been completed successfuly (to our best knowledge)"
	^ false
]

{ #category : #enumerating }
FailedTestOSProcess >> runAndWaitOnExitDo: anExitClosure [
	anExitClosure cull: self cull: 'standard out string' cull: 'standard error string'
	
]

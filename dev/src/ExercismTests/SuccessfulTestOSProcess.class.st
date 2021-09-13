Class {
	#name : #SuccessfulTestOSProcess,
	#superclass : #OSSUnixSubprocess,
	#category : #'ExercismTests-UnitTests'
}

{ #category : #accessing }
SuccessfulTestOSProcess >> command: aString [
	
	^ self
]

{ #category : #status }
SuccessfulTestOSProcess >> isSuccess [
	"Answers whether the process has been completed successfuly (to our best knowledge)"
	^ true
]

{ #category : #running }
SuccessfulTestOSProcess >> runAndWaitOnExitDo: anExitClosure [
	anExitClosure cull: self cull: 'standard out string' cull: 'standard error string'
	
]

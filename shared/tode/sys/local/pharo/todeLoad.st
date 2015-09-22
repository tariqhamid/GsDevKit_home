[ 
  "todeClient pharo todeLoad.st"
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    get.
  Metacello new
    baseline: 'Metacello';
    repository: 'github://dalehenrich/metacello-work:master/repository';
    onConflict: [:ex | ex allow];
    load.
  false ifTrue: [
    "To avoid GitHub API rate limits, edit and define github username/password in tode client image"
    "Change `false` to `true` execute this block"
    Smalltalk at: #MCGitHubRepository ifPresent: [:cls |
      cls
        siteUsername: '';
        sitePassword: ''] ].
  Smalltalk snapshot: true andQuit: false. "for debugging"
  Metacello new
    baseline: 'Tode';
    repository: 'filetree:///opt/git/tode/repository';
    get;
    load ]
      on: Warning, MetacelloSkipDirtyPackageLoad
      do: [:ex | 
        (ex isKindOf: MetacelloSkipDirtyPackageLoad)
          ifTrue: [ 
            "Load over dirty packages"
            ex resume: false ]
          ifFalse: [
            Transcript cr; show: ex description.
            ex resume: true ] ].
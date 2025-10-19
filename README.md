# hai welcome to the helm charts repo :3

## what even is this lol

this is where I keep all our helm charts for kubernetes

<img src="https://oldschool.runescape.wiki/images/thumb/Frog_%28Zanaris%29.png/800px-Frog_%28Zanaris%29.png" alt="LeafdBot" width="250" />

## meet leafdbot!! 

leafdbot manages all the releases using [release-please](https://github.com/googleapis/release-please)

it watches ur commits and goes "oh snap they did a thing" and then it releases and versions the charts

## how 2 write commits ( if you are gonna contribute please read this bit its important)

ok so release-please needs u to write ur commits in a specific way (its called [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) but dont worry its not that scary)

here's what u need to know:

**`fix:`** - u fixed a bug!! this bumps the patch version (1.2.3 -> 1.2.4)

**`feat:`** - u added a new feature!! this bumps the minor version (1.2.3 -> 1.3.0)

**`feat!:`** or **`fix!:`**  - OH NO U DID A BREAKING CHANGE!!! the `!` means u broke stuff (on purpose hopefully) and this version is no longer compatible with the previous ones. This triggers a bump to a major version (1.2.3 -> 2.0.0)

**`chore:`** - u did boring maintenance stuff (updates deps, fixes typos, etc). 

for example:
```
feat: add cool thingy
fix: change broken thingy
feat!: rewrite thingy completely 
chore: change readme
```

`Pretty Please: write ur commits in infinitive form!!! (like "add thing" not "added thing" or "adds thing")`

## where do the charts go???

they get deployed to TWO places:
- an oci registry (fancy!!)
- **helm.hackclub.leafd.dev** (sorry for the domain I'll get in on a hackclub one soon :) )

both are good, both are valid, i love them equally

## help i have questions

got questions? confused? wanna say hi?

email: **sebastian@hackclub.com**

slack: dm **@lfd** 

---

*made with <3 by a leaf*
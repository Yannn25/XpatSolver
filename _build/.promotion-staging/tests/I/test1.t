Ce fichier de test est au format CRAM.
Voir https://dune.readthedocs.io/en/stable/tests.html#cram-tests

Fichier solution vide:

  $ ../../src/XpatSolver.exe FreeCell.123 -check empty.sol | tail -n 1
  C'est tout pour l'instant. TODO: continuer...

Idem, mais cette fois-ci essayons le code d'erreur

  $ ../../src/XpatSolver.exe FreeCell.123 -check empty.sol > /dev/null

Fichier solution d'une seul ligne (non adaptée à la partie)

  $ ../../src/XpatSolver.exe FreeCell.123 -check oneline.sol | tail -n 1
  C'est tout pour l'instant. TODO: continuer...

Fichier solution correct

  $ ../../src/XpatSolver.exe FreeCell.123 -check fc123.sol | tail -n 1
  C'est tout pour l'instant. TODO: continuer...

Idem, mais cette fois-ci essayons le code d'erreur

  $ ../../src/XpatSolver.exe FreeCell.123 -check fc123.sol > /dev/null

D'autres règles du jeu:

  $ ../../src/XpatSolver.exe Seahaven.12345 -check st12345.sol | tail -n 1
  C'est tout pour l'instant. TODO: continuer...

  $ ../../src/XpatSolver.exe BakersDozen.123456 -check bd123456.sol | tail -n 1
  C'est tout pour l'instant. TODO: continuer...

Un numero de partie non accepté initialement par XpatRandom.shuffle:

  $ ../../src/XpatSolver.exe MidnightOil.12345678 -check mo12345678.sol | tail -n 1
  Fatal error: exception Failure("shuffle : unsupported number (TODO)")

TODO: tester d'autres fichiers solutions (corrects / incomplets / mauvais coup / trop longs)
et plus de variété de jeux et de numeros.

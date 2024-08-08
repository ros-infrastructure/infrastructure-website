---
title: Style guide
---
# Style guide

Recommended conventions for written communication and canonical terms in the Infrastructure project documentation.

## Markup language

Markdown is the preferred markup language for site contents and documentation.

### Semantic line breaks

Unless content is intended to be rendered as GitHub-flavored Markdown (GFM), use one sentence per line (sometimes called "semantic line breaks") to support easier review with diff-based source code version control.

## Typography

### Sentence case for titles

Use "sentence case" for titles: Capitalize a title as you would a sentence in English.
Sentence case titles may still have multiple capitalized words.
For example if each word of the title is part of a proper noun such as "Open Robotics Infrastructure Project" each word of the title is capitalized.

## Terminology

* __Infrastructure project__: The Infrastructure project is an OSRF project for which management has been assigned to the OSRA.
  When the Open Robotics / OSRF / OSRA context is clear use "the Infrastructure Project" and otherwise use "the Open Robotics Infrastructure Project".
  When referring to the formal charted body, capitalize "Infrastructure Project" but when referring to the project as a collective organization or effort leave project uncapitalized.
  Examples:
    - The Infrastructure project is preparing to transition all server infrastructure to Ubuntu 22.04.
    - A new project representative from the Infrastructure Project must be appointed.

* __Build farm__: Prefer the two word "build farm" to the compound "buildfarm" except when referring to project / repository names that use the compound word such as `cookbook-ros-buildfarm` or `ros_buildfarm`.

;;; packages.el --- customfont layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <perillamint@nimrodel.quendi.moe>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `customfont-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `customfont/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `customfont/pre-init-PACKAGE' and/or
;;   `customfont/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst customfont-packages
  '((customfont :location local))
  "The list of Lisp packages required by the customfont layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun customfont/init-customfont ()
  ;;TODO: Find way to emulate fixedwidth
  (let ((hangulfont (font-spec
                     :family "Noto Sans CJK KR"
                     :weight 'normal
                     :width 'normal))
        (emojifont (font-spec
                    :family "Noto Emoji"
                    :weight 'normal
                    :width 'normal)))
    ;; Hangul
    ;; Hangul Syllables
    (set-fontset-font "fontset-default"
                      '(#xAC00 . #xD7A3)
                      hangulfont)
    ;; Hangul Jamo
    (set-fontset-font "fontset-default"
                      '(#x1100 . #x11FF)
                      hangulfont)
    ;; Hangul Compatibility Jamo
    (set-fontset-font "fontset-default"
                      '(#x3130 . #x318F)
                      hangulfont)
    ;; Hangul Jamo Extended-A
    (set-fontset-font "fontset-default"
                      '(#xA960 . #xA97F)
                      hangulfont)
    ;; Hangul Jamo Extended-B
    (set-fontset-font "fontset-default"
                      '(#xD7B0 . #xD7FF)
                      hangulfont)

    ;; Emojies
    ;; Miscellaneous Symbols and Pictographs block
    (set-fontset-font "fontset-default"
                      '(#x1F300 . #x1F5FF)
                      emojifont)
    ;; Supplemental Symbols and Pictographs block
    (set-fontset-font "fontset-default"
                      '(#x1F900 . #x1F9FF)
                      emojifont)
    ;; Emoticons block
    (set-fontset-font "fontset-default"
                      '(#x1F600 . #x1F64F)
                      emojifont)
    ;; Transport and Map Symbols block
    (set-fontset-font "fontset-default"
                      '(#x1F680 . #x1F6FF)
                      emojifont)
    ;; Miscellaneous Symbols block
    (set-fontset-font "fontset-default"
                      '(#x2600 . #x26FF)
                      emojifont)
    ;; Dingbats block
    (set-fontset-font "fontset-default"
                      '(#x2700 . #x27FF)
                      emojifont)
    )
  )

;;; packages.el ends here

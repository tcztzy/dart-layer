;;; packages.el --- Dart Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Tang Ziya <tcztzy@gmail.com>
;; URL: https://github.com/tcztzy/dart-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq dart-packages
      '(
        company
        flycheck
        helm
        (dart-mode :location (recipe
                              :fetcher github
                              :repo "nex3/dart-mode"))
        (helm-dart :location (recipe
                              :fetcher github
                              :repo "sid-kurias/dart-mode"
                              :files ("helm-dart.el")))
        (company-dart :require company
                      :location (recipe
                                 :fetcher github
                                 :repo "sid-kurias/company-dart"))))


(defun dart/post-init-flycheck ()
  (spacemacs/enable-flycheck 'dart-mode))

(defun dart/post-init-company ()
  (spacemacs|add-company-hook dart-mode))

(defun dart/init-dart-mode ()
  (use-package dart-mode
    :defer t
    :init
    (progn
      (push 'company-dart company-backends-dart-mode)
      (add-hook 'dart-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))))
    :config
    (progn
        (spacemacs/set-leader-keys
        ;; (spacemacs/set-leader-keys-for-major-mode 'dart-mode
          "mj" 'dart-jump-to-defn
          "mf" 'dartfmt
          "mi" 'dart-imports
          "ms" 'dart-sort-members)
        (use-package helm-dart
          :config
          (progn
            (spacemacs/set-leader-keys
              "mq" 'helm-dart-quick-fix))))))

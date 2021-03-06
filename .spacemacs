;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
    dotspacemacs-distribution 'spacemacs
    dotspacemacs-enable-lazy-installation 'unused
    dotspacemacs-ask-for-lazy-installation t
    dotspacemacs-configuration-layer-path '()
    dotspacemacs-configuration-layers '(
      nginx
      purescript
      haskell
      yaml
      shell-scripts
      ;; elixir
      ruby
      javascript
      helm
      ;; ivy
      ;; (auto-completion :disabled-for org git)
      emacs-lisp
      git
      markdown
      org
      typescript
      react
      ocaml
      reason
      nixos
      extra-langs
      ;; itome-react
      ;; (syntax-checking :disabled-for org git)
      ;; spotify
      (org :variables org-enable-reveal-js-support t)
      (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
    )
    dotspacemacs-additional-packages '(
      all-the-icons
      monokai-theme
      doom-molokai
      (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
      solidity-mode
    )
    dotspacemacs-frozen-packages '()
    dotspacemacs-excluded-packages '()
    dotspacemacs-install-packages 'used-only
  )
)

(defun dotspacemacs/init ()
  (setq-default
    dotspacemacs-elpa-https t
    dotspacemacs-elpa-timeout 5
    dotspacemacs-check-for-update nil
    dotspacemacs-elpa-subdirectory nil
    dotspacemacs-editing-style 'vim
    dotspacemacs-verbose-loading nil
    dotspacemacs-startup-banner 'official
    dotspacemacs-startup-lists '((recents . 5) (projects . 7))
    dotspacemacs-startup-buffer-responsive t
    dotspacemacs-scratch-mode 'text-mode
    dotspacemacs-themes '(
      doom-molokai
      monokai
      spacemacs-dark
      spacemacs-light
    )
    dotspacemacs-colorize-cursor-according-to-state t
    dotspacemacs-default-font '(
      "Inconsolata for Powerline"
      ;; "Fira Mono"
      ;; "DejaVu Sans Mono for Powerline"
      :size 15
      :weight normal
      :width normal
      :powerline-scale 1.1
    )
    dotspacemacs-leader-key "SPC"
    dotspacemacs-emacs-command-key "SPC"
    dotspacemacs-ex-command-key ":"
    dotspacemacs-emacs-leader-key "M-m"
    dotspacemacs-major-mode-leader-key ","
    dotspacemacs-major-mode-emacs-leader-key "C-M-m"
    dotspacemacs-distinguish-gui-tab nil
    dotspacemacs-remap-Y-to-y$ nil
    dotspacemacs-retain-visual-state-on-shift t
    dotspacemacs-visual-line-move-text nil
    dotspacemacs-ex-substitute-global nil
    dotspacemacs-default-layout-name "Default"
    dotspacemacs-display-default-layout nil
    dotspacemacs-auto-resume-layouts nil
    dotspacemacs-large-file-size 1
    dotspacemacs-auto-save-file-location 'cache
    dotspacemacs-max-rollback-slots 5
    dotspacemacs-helm-resize nil
    dotspacemacs-helm-no-header nil
    dotspacemacs-helm-position 'bottom
    dotspacemacs-helm-use-fuzzy 'always
    dotspacemacs-enable-paste-transient-state nil
    dotspacemacs-which-key-delay 0.2
    dotspacemacs-which-key-position 'bottom
    dotspacemacs-loading-progress-bar t
    dotspacemacs-fullscreen-at-startup nil
    dotspacemacs-fullscreen-use-non-native nil
    dotspacemacs-maximized-at-startup t
    dotspacemacs-active-transparency 90
    dotspacemacs-inactive-transparency 90
    dotspacemacs-show-transient-state-title t
    dotspacemacs-show-transient-state-color-guide t
    dotspacemacs-mode-line-unicode-symbols t
    dotspacemacs-smooth-scrolling nil
    dotspacemacs-line-numbers t
    dotspacemacs-folding-method 'evil
    dotspacemacs-smartparens-strict-mode nil
    dotspacemacs-smart-closing-parenthesis nil
    dotspacemacs-highlight-delimiters 'all
    dotspacemacs-persistent-server nil
    dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
    dotspacemacs-default-package-repository nil
    dotspacemacs-whitespace-cleanup nil
  )
)

(defun is-in-terminal()
  (not (display-graphic-p))
)

(defmacro when-term (&rest body)
  "Works just like `progn' but will only evaluate expressions in VAR when Emacs is running in a terminal else just nil."
  `(when (is-in-terminal) ,@body)
)

(defun dotspacemacs/user-init ()
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(helm . "melpa-stable") package-pinned-packages)
)

(defun dotspacemacs/user-config ()
  (spaceline-compile)
  (global-vi-tilde-fringe-mode -1)
  (menu-bar-mode -1)
  (evil-snipe-mode 1)
  ;; (set-face-attribute 'org-level-1 nil :height 1.0)
  ;; (set-face-attribute 'org-level-2 nil :height 1.0)
  ;; (set-face-attribute 'org-level-3 nil :height 1.0)

  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (setq
    powerline-default-separator nil
    neo-theme 'ascii
    ;; neo-theme 'icons
    ;; neo-autorefresh t
    js2-strict-missing-semi-warning nil
    js2-strict-trailing-comma-warning nil
    typescript-indent-level 2
    tab-width 2
    org-bullets-bullet-list '("✺" "✹" "✸" "✷" "✶" "✭" "✦")
    ;; projectile-enable-caching t
    spacemacs-buffer--warnings nil
    neo-force-change-root t
    web-mode-enable-auto-quoting nil
  )
  (setq-default
    indent-tabs-mode nil
    js2-basic-offset 2
    js-indent-level 2
    css-indent-offset 2
    web-mode-markup-indent-offset 2
    web-mode-css-indent-offset 2
    web-mode-code-indent-offset 2
    web-mode-attr-indent-offset 2
  )

  (when-term
    ;; (global-flycheck-mode -1)
    ;; (global-linum-mode 0)
    (setq linum-format "%d ")
  )

  ;; (define-key evil-normal-state-map (kbd "z") 'avy-goto-word-0)

  (custom-set-faces
    '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
    '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
    '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
    '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
    '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
  )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (solidity-mode nginx-mode org-mime thrift stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode nix-mode helm-nixos-options company-nixos-options nixos-options ghub utop tuareg caml ocp-indent merlin doom-tomorrow-night-theme company-cabal wgrep smex ivy-hydra counsel-projectile counsel swiper ivy evil-snipe evil-easymotion flycheck-haskell intero hlint-refactor hindent helm-hoogle haskell-snippets company-ghci company-ghc ghc haskell-mode cmm-mode psci psc-ide purescript-mode spotify helm-spotify multi rjsx-mode molokai-theme-theme csv-mode alchemist ob-elixir flycheck-mix flycheck-credo elixir-mode yaml-mode ox-reveal stylus-mode zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme flycheck-pos-tip pos-tip all-the-icons memoize font-lock+ web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data tide org-category-capture rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby typescript-mode flycheck insert-shebang fish-mode company-shell smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode magit-gitflow launchctl htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit magit-popup git-commit with-editor company-tern dash-functional tern company-statistics company auto-yasnippet ac-ispell auto-complete ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode coffee-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async org-plus-contrib evil-unimpaired f s dash)))
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

-- | OpenCode Page - Multi-Model Routing
module Straylight.Pages.OpenCode where

import Prelude

import Halogen as H
import Halogen.HTML as HH

import Straylight.UI (cls, rail, keyword, sectionHeader, codeBlock, inlineCode, blockCursor)
import Straylight.Components.Callout as Callout

-- ============================================================
-- COMPONENT
-- ============================================================

openCodePage :: forall q i o m. H.Component q i o m
openCodePage = H.mkComponent
  { initialState: const unit
  , render: const render
  , eval: H.mkEval H.defaultEval
  }

-- ============================================================
-- RENDER
-- ============================================================

render :: forall w i. HH.HTML w i
render =
  HH.div_
    [ hero
    , install
    , routing
    , pricing
    , phases
    ]

-- ============================================================
-- SECTIONS
-- ============================================================

hero :: forall w i. HH.HTML w i
hero =
  HH.section
    [ cls [ "py-24 pb-16 text-right" ] ]
    [ rail
    , HH.h1
        [ cls [ "text-text text-[2rem] font-medium mt-6" ] ]
        [ HH.span [ cls [ "text-primary" ] ] [ HH.text "//" ]
        , HH.text " opencode "
        , HH.span [ cls [ "text-primary" ] ] [ HH.text "//" ]
        , HH.text " pure openrouter "
        , HH.span [ cls [ "text-primary" ] ] [ HH.text "//" ]
        ]
    , HH.div [ cls [ "h-[3px] rail mt-6" ] ] []
    
    , HH.p
        [ cls [ "mt-12 text-left text-lg text-muted-foreground hover:text-text transition-colors duration-200 cursor-default" ] ]
        [ HH.text "nitpick → creative routing. burn gcp credits." ]
    , HH.p
        [ cls [ "mt-6 text-left italic text-base02 text-[0.95rem] hover:text-text transition-colors duration-200 cursor-default" ] ]
        [ HH.text "\"Get just what you paid for. Nothing more, nothing less.\"" ]
    ]

install :: forall w i. HH.HTML w i
install =
  HH.section
    [ cls [ "py-12 border-t border-border" ] ]
    [ sectionHeader "install"
    , codeBlock
        [ inlineCode "razorgirl on railgun ~"
        , HH.text "\n"
        , inlineCode "❯ "
        , HH.code
            [ cls [ "text-text" ] ]
            [ HH.text "curl -fsSL straylight.dev/install-opencode.sh | sh" ]
        , blockCursor
        ]
    , HH.p
        [ cls [ "mt-6 text-muted-foreground text-[0.9rem]" ] ]
        [ HH.text "phase-based installer with full rollback. every mutation is reversible." ]
    ]

routing :: forall w i. HH.HTML w i
routing =
  HH.section
    [ cls [ "py-12 border-t border-border" ] ]
    [ sectionHeader "routing"
    , HH.p
        [ cls [ "mb-6" ] ]
        [ keyword 1 "layer 1"
        , HH.text " — adversarial review, spec validation, test generation."
        ]
    , HH.div
        [ cls [ "grid grid-cols-[140px_1fr] gap-4 mb-4" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "gpt-5.2" ]
        , HH.span_ [ HH.text "nitpick. find flaws. be uncharitable." ]
        ]
    , HH.div
        [ cls [ "grid grid-cols-[140px_1fr] gap-4 mb-8" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "o3-pro" ]
        , HH.span_ [ HH.text "heavy reasoning. formal spec derivation." ]
        ]
    , HH.p
        [ cls [ "mb-6" ] ]
        [ keyword 2 "layer 2"
        , HH.text " — creative coding, implementation, exploration."
        ]
    , HH.div
        [ cls [ "grid grid-cols-[140px_1fr] gap-4 mb-4" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "opus 4.5" ]
        , HH.span_ [ HH.text "primary. reliable workhorse." ]
        ]
    , HH.div
        [ cls [ "grid grid-cols-[140px_1fr] gap-4 mb-4" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "gemini 3 pro" ]
        , HH.span_ [ HH.text "dark horse. gcp credits via openrouter." ]
        ]
    , HH.div
        [ cls [ "grid grid-cols-[140px_1fr] gap-4" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "kimi k2.5" ]
        , HH.span_ [ HH.text "guest rotation. 9x cheaper." ]
        ]
    ]

pricing :: forall w i. HH.HTML w i
pricing =
  HH.section
    [ cls [ "py-12 border-t border-border" ] ]
    [ sectionHeader "pricing"
    , HH.div
        [ cls [ "grid grid-cols-[140px_100px_1fr] gap-4 mb-2 text-[0.85rem]" ] ]
        [ HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "model" ]
        , HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "$/M" ]
        , HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text "layer" ]
        ]
    , pricingRow "opus 4.5" "$5/$25" "creative"
    , pricingRow "kimi k2.5" "$0.50/$2.80" "creative"
    , pricingRow "gemini 3" "$1.25/$10" "creative"
    , pricingRow "gpt-5.2" "$1.25/$10" "nitpick"
    , Callout.tip "Pure OpenRouter"
        [ HH.p_
            [ HH.text "all models via openrouter. K2.5 is "
            , HH.strong_ [ HH.text "9x cheaper" ]
            , HH.text " than Opus. gemini burns gcp credits. one key, all models."
            ]
        ]
    ]

pricingRow :: forall w i. String -> String -> String -> HH.HTML w i
pricingRow model price layer =
  HH.div
    [ cls [ "grid grid-cols-[140px_100px_1fr] gap-4 py-2 border-t border-border" ] ]
    [ HH.span [ cls [ "text-text" ] ] [ HH.text model ]
    , HH.span [ cls [ "text-primary" ] ] [ HH.text price ]
    , HH.span [ cls [ "text-muted-foreground" ] ] [ HH.text layer ]
    ]

phases :: forall w i. HH.HTML w i
phases =
  HH.section
    [ cls [ "py-12 border-t border-border" ] ]
    [ sectionHeader "phases"
    , HH.p
        [ cls [ "mb-6 text-[0.9rem]" ] ]
        [ HH.text "every phase is reversible. no mutation without snapshot." ]
    , HH.div
        [ cls [ "flex flex-col gap-2" ] ]
        [ phaseItem 3 "snapshot" "capture current state (read-only)"
        , phaseItem 4 "stage" "collect credentials, write staged config"
        , phaseItem 5 "entry" "activate staged config (atomic)"
        , phaseItem 6 "verify" "confirm activation, test connectivity"
        , phaseItem 7 "abort" "full rollback to snapshot"
        ]
    , codeBlock
        [ inlineCode "# to undo"
        , HH.text "\n"
        , inlineCode "❯ "
        , HH.code
            [ cls [ "text-text" ] ]
            [ HH.text "curl -fsSL straylight.dev/install-opencode.sh | sh -s abort" ]
        , blockCursor
        ]
    ]

phaseItem :: forall w i. Int -> String -> String -> HH.HTML w i
phaseItem n name desc =
  HH.div
    [ cls [ "grid grid-cols-[100px_1fr] gap-4" ] ]
    [ keyword n name
    , HH.span_ [ HH.text desc ]
    ]

" GUI color definitions
let s:gui00 = "272822"
let s:gui01 = "383830"
let s:gui02 = "49483e"
let s:gui03 = "75715e"
let s:gui04 = "a59f85"
let s:gui05 = "f8f8f2"
let s:gui06 = "f5f4f1"
let s:gui07 = "f9f8f5"
let s:gui08 = "f92672"
let s:gui09 = "fd971f"
let s:gui0A = "f4bf75"
let s:gui0B = "a6e22e"
let s:gui0C = "a1efe4"
let s:gui0D = "66d9ef"
let s:gui0E = "ae81ff"
let s:gui0F = "cc6633"

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

let s:gc00 = ['#' . s:gui00, s:cterm00] " ~black 
let s:gc01 = ['#' . s:gui01, s:cterm01] " dark grey
let s:gc02 = ['#' . s:gui02, s:cterm02] " light grey
let s:gc03 = ['#' . s:gui03, s:cterm03] " dark green?
let s:gc04 = ['#' . s:gui04, s:cterm04] " light green?
let s:gc05 = ['#' . s:gui05, s:cterm05] " whiteish
let s:gc06 = ['#' . s:gui06, s:cterm06] " whiteish
let s:gc07 = ['#' . s:gui07, s:cterm07] " silver
let s:gc08 = ['#' . s:gui08, s:cterm08] " red
let s:gc09 = ['#' . s:gui09, s:cterm09] " orange
let s:gc0A = ['#' . s:gui0A, s:cterm0A] " orangey yellow
let s:gc0B = ['#' . s:gui0B, s:cterm0B] " bright green
let s:gc0C = ['#' . s:gui0C, s:cterm0C] " aqua
let s:gc0D = ['#' . s:gui0D, s:cterm0D] " cyan
let s:gc0E = ['#' . s:gui0E, s:cterm0E] " purple
let s:gc0F = ['#' . s:gui0F, s:cterm0F] " dark orange

let g:lightline#colorscheme#monokai#palette = lightline#colorscheme#flatten({
\  'normal': {
\    'left': [[s:gc00, s:gc0D], [s:gc0D, s:gc00]],
\    'middle': [[s:gc0B, s:gc00]],
\    'right': [[s:gc0E, s:gc00], [s:gc00, s:gc0E]],
\    'error': [[s:gc08, s:gc00]],
\    'warning': [[s:gc0A, s:gc00]]
\  },
\  'insert': {
\    'left': [[s:gc00, s:gc0B], [s:gc0B, s:gc00]]
\  },
\  'visual': {
\    'left': [[s:gc00, s:gc09], [s:gc09, s:gc00]]
\  },
\  'replace': {
\    'left': [[s:gc00, s:gc08], [s:gc08, s:gc00]]
\  },
\  'inactive': {
\    'left': [[s:gc0E, s:gc00], [s:gc05, s:gc00]],
\    'middle': [[s:gc02, s:gc00]],
\    'right': [[s:gc05, s:gc0E], [s:gc0E, s:gc00]]
\  },
\  'tabline': {
\    'left': [[s:gc0E, s:gc00]],
\    'middle': [[s:gc0E, s:gc00]],
\    'right': [[s:gc0E, s:gc00], [s:gc00, s:gc0E]],
\    'tabsel': [[s:gc00, s:gc0E]]
\  }
\})


" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07 s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
unlet s:gc00 s:gc01 s:gc02 s:gc03  s:gc04  s:gc05  s:gc06  s:gc07 s:gc08  s:gc09 s:gc0A  s:gc0B  s:gc0C  s:gc0D  s:gc0E  s:gc0F

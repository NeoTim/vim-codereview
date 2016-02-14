" Copyright 2014 Google Inc. All rights reserved.
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

function s:ViewSummary(remote) abort
  call maktaba#ensure#IsString(a:remote)
  echomsg 'Viewing changes relative to remote ' . a:remote
  let [l:repo_type, l:repo] = split(a:remote, ':')
  " https://api.github.com/repos/google/vim-maktaba/pulls
  " https://api.github.com/repos/google/vim-maktaba/pulls/151/comments
  if l:repo_type is# 'github'
    let l:pulls_json = maktaba#syscall#Create([
        \ 'curl',
        \ 'https://api.github.com/repos/' . l:repo . '/pulls']).Call().stdout
    let l:pulls = maktaba#json#Parse(l:pulls_json)
    echomsg "Pulls:"
    for l:pr in l:pulls
      echomsg printf("  #%d: %s", l:pr.number, l:pr.title)
    endfor
  else
    call maktaba#error#Shout('Unrecognized repo type "%s"', l:repo_type)
  endif
endfunction

""
" View pull requests / pending changes between local and {remote}.
" Currently only supports github specs of the form "github:user/repo".
command -nargs=1 CodeReview call s:ViewSummary(<f-args>)

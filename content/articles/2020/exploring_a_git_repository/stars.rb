#!/usr/bin/env ruby

require 'json'

user = ARGV[0] || 'wschenk'
stars = `curl https://api.github.com/users/#{user}/starred`

require 'pp'
pp JSON.parse( stars )

"https://github.com/hundredrabbits/Dotgrid.git",
"https://github.com/plotly/plotly.js.git",
"https://github.com/mouse-reeve/fedireads.git",
"https://github.com/alpinejs/alpine.git",
"https://github.com/trailofbits/algo.git",
"https://github.com/lovasoa/dezoomify.git",
"https://github.com/szymonkaliski/archivist.git",
"https://github.com/pikapkg/snowpack-init.git",
"https://github.com/dominictarr/scalable-secure-scuttlebutt.git",
"https://github.com/fpereiro/backendlore.git",
"https://github.com/yusefnapora/pixelbook-linux.git",
"https://github.com/sissbruecker/linkding.git",
"https://github.com/hakimel/reveal.js.git",
"https://github.com/automaticmode/active_workflow.git",
"https://github.com/z0al/unread.git",
"https://github.com/ipfs-shipyard/react-ipfs-url.git",
"https://github.com/3b1b/manim.git",
"https://github.com/mathieudutour/medium-to-own-blog.git",
"https://github.com/marylychee/ssb-website-2.0.git",
"https://github.com/ianstormtaylor/slate.git",
"https://github.com/dangerousbeans/secret-islands.git",
"https://github.com/davedx/mars-power.git",
"https://github.com/dangerousbeans/vue-ssb.git",
"https://github.com/cimryan/teslausb.git",
"https://github.com/GoogleChromeLabs/comlink.git",
"https://github.com/minamarkham/formation.git",
"https://github.com/ipfs-shipyard/ipfs-deploy.git",
"https://github.com/0x20/hackerspace-blueprint.git",
"https://github.com/vadimdemedes/pastel.git",
"https://github.com/cjdelisle/cjdns.git",

overlay add fnm.nu

let-env PATH = (
  $env.PATH | prepend '/home/gitpod/.local/share/pnpm'
)

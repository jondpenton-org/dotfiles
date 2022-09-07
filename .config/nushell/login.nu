let-env PATH = (
  $env.PATH | prepend `/home/gitpod/.local/share/pnpm`
)

if `NU_INITIAL_OVERLAYS` in $env {
  let active_overlays = (
    overlay list
  )
  let inactive_initial_overlays = (
    $env.NU_INITIAL_OVERLAYS
      | split row `,`
      | where not $it in $active_overlays
  )

  if not (
    $inactive_initial_overlays | empty?
  ) {
    bash -c $'echo "" >> ($nu.config-path)'

    $inactive_initial_overlays
      | each { |it|
          if $it ends-with `.nu` {
            $it
          } else {
            $'($it).nu'
          }
            | bash -c $'echo "overlay use ($in)" >> ($nu.config-path)'
        };
    nu-reload
  }
}

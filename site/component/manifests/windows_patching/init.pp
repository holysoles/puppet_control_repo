class component::windows_patching(
  Boolean $enabled = true,
){
  if $enabled {
    include component::windows_patching::install
    include component::windows_patching::scheduled_task
  }
}

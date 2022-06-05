class component::windows_patching(
  Boolean $enabled = true,
){
  if $enabled {
    include component::windows_patching::ps_package
    include component::windows_patching::scheduled_task
  }
}

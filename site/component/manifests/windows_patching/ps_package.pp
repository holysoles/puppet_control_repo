class component::windows_patching::ps_package(
  Boolean $ensure  = 'latest',
  String $provider = 'windowspowershell',
){
  # Ensure we have the PS module
  package { 'PSWindowsUpdate':
    ensure   => $ensure,
    source   => 'PSGallery',
    provider => $provider,
  }
}

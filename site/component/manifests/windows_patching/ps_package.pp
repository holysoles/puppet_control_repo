class component::windows_patching::ps_package(
  [Enum['present','absent','latest']] $ensure  = 'latest',
  String $provider = 'windowspowershell',
){
  # Ensure we have the PS module
  package { 'PSWindowsUpdate':
    ensure   => $ensure,
    source   => 'PSGallery',
    provider => $provider,
  }
}

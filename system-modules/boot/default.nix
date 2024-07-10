{ pkgs, config, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams =
      [ "amd_iommu=on" "amd_iommu=pt" "amd_pstate=active" "kvm.ignore_mrs=1" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    plymouth = { enable = true; };
  };
}

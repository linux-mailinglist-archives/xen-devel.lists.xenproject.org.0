Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C349A932D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 00:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823949.1238035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30ih-0007iy-2i; Mon, 21 Oct 2024 22:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823949.1238035; Mon, 21 Oct 2024 22:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30ig-0007gQ-VP; Mon, 21 Oct 2024 22:17:46 +0000
Received: by outflank-mailman (input) for mailman id 823949;
 Mon, 21 Oct 2024 22:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwn9=RR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t30if-0007gK-W0
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 22:17:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aeac4f3-8ffa-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 00:17:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31DBC5C5BF8;
 Mon, 21 Oct 2024 22:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6448EC4CEC3;
 Mon, 21 Oct 2024 22:17:41 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4aeac4f3-8ffa-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729549062;
	bh=2hiR4oyMJvoVTbdyuZQU95NrRzovdc9RZ3+Huh5lD40=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CC1VtEsCGPBIITanpktMUagkU6quVsK+t5cCKOd24Egr5ogkKzSqV/efKnqTJzxmd
	 GckZLPZGoXRQtwF7OOtyi+ggIGy03WhLNV8XUeE+9humT3i7TjBm3TuuQ3Noe9o0jE
	 FrAPt3qTPKyKGCwlSQFoVtUatweH2e7GkmItJ7aFpxnJa6rASjHspo+hIABiUGa1WK
	 1OjESQndHJ76nA7AQqHk38EywQf3vasgvWlvKiqYeGyZmaSCDzLZF0N+vcuGckEjNS
	 95K4cdVuxi/CB99xpsSn+QeBtIgxE+aLcmKFcxBHAaBKgbnqWSlypaf3yY5AC/aCJ9
	 nKFoMFlJDT6jA==
Date: Mon, 21 Oct 2024 15:17:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] CI: Minor cleanup to qubes-x86-64.sh
In-Reply-To: <20241021143539.3898995-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410211515030.3833@ubuntu-linux-20-04-desktop>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com> <20241021143539.3898995-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-624098942-1729549062=:3833"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-624098942-1729549062=:3833
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 21 Oct 2024, Andrew Cooper wrote:
>  * List all the test_variants and summerise what's going on
>  * Use case rather than an if/else chain for $test_variant
>  * Fix indentation inside the case block
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> ---
>  automation/scripts/qubes-x86-64.sh | 84 ++++++++++++++++++------------
>  1 file changed, 50 insertions(+), 34 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index bfa60c912a64..306304e9219f 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -2,6 +2,13 @@
>  
>  set -ex
>  
> +# One of:
> +#  - ""             PV dom0,  PVH domU
> +#  - dom0pvh        PVH dom0, PVH domU
> +#  - dom0pvh-hvm    PVH dom0, HVM domU
> +#  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
> +#  - pci-pv         PV dom0,  PV domU + PCI Passthrough
> +#  - s3             PV dom0,  S3 suspend/resume
>  test_variant=$1
>  
>  ### defaults
> @@ -19,17 +26,18 @@ vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
>  
> -### test: smoke test & smoke test PVH & smoke test HVM
> -if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
> -    passed="ping test passed"
> -    domU_check="
> +case "${test_variant}" in
> +    ### test: smoke test & smoke test PVH & smoke test HVM
> +    ""|"dom0pvh"|"dom0pvh-hvm")
> +        passed="ping test passed"
> +        domU_check="
>  ifconfig eth0 192.168.0.2
>  until ping -c 10 192.168.0.1; do
>      sleep 1
>  done
>  echo \"${passed}\"
>  "
> -    dom0_check="
> +        dom0_check="
>  set +x
>  until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
>      sleep 1
> @@ -37,12 +45,12 @@ done
>  set -x
>  echo \"${passed}\"
>  "
> -if [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
> -    extra_xen_opts="dom0=pvh"
> -fi
> +        if [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
> +            extra_xen_opts="dom0=pvh"
> +        fi
>  
> -if [ "${test_variant}" = "dom0pvh-hvm" ]; then
> -    domU_config='
> +        if [ "${test_variant}" = "dom0pvh-hvm" ]; then
> +            domU_config='
>  type = "hvm"
>  name = "domU"
>  kernel = "/boot/vmlinuz"
> @@ -52,17 +60,18 @@ memory = 512
>  vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
> -fi
> -
> -### test: S3
> -elif [ "${test_variant}" = "s3" ]; then
> -    passed="suspend test passed"
> -    wait_and_wakeup="started, suspending"
> -    domU_check="
> +        fi
> +        ;;
> +
> +    ### test: S3
> +    "s3")
> +        passed="suspend test passed"
> +        wait_and_wakeup="started, suspending"
> +        domU_check="
>  ifconfig eth0 192.168.0.2
>  echo domU started
>  "
> -    dom0_check="
> +        dom0_check="
>  until grep 'domU started' /var/log/xen/console/guest-domU.log; do
>      sleep 1
>  done
> @@ -79,19 +88,20 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
>  ping -c 10 192.168.0.2 || exit 1
>  echo \"${passed}\"
>  "
> +        ;;
>  
> -### test: pci-pv, pci-hvm
> -elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
> +    ### test: pci-pv, pci-hvm
> +    "pci-pv"|"pci-hvm")
>  
> -    if [ -z "$PCIDEV" ]; then
> -        echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
> -        echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
> -        exit 1
> -    fi
> +        if [ -z "$PCIDEV" ]; then
> +            echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
> +            echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
> +            exit 1
> +        fi
>  
> -    passed="pci test passed"
> +        passed="pci test passed"
>  
> -    domU_config='
> +        domU_config='
>  type = "'${test_variant#pci-}'"
>  name = "domU"
>  kernel = "/boot/vmlinuz"
> @@ -104,7 +114,7 @@ pci = [ "'$PCIDEV',seize=1" ]
>  on_reboot = "destroy"
>  '
>  
> -    domU_check="
> +        domU_check="
>  set -x -e
>  interface=eth0
>  ip link set \"\$interface\" up
> @@ -115,22 +125,28 @@ echo domU started
>  pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
>  lspci -vs \$pcidevice
>  "
> -    if [ -n "$PCIDEV_INTR" ]; then
> -        domU_check="$domU_check
> +        if [ -n "$PCIDEV_INTR" ]; then
> +            domU_check="$domU_check
>  lspci -vs \$pcidevice | fgrep '$PCIDEV_INTR: Enable+'
>  "
> -    fi
> -    domU_check="$domU_check
> +        fi
> +        domU_check="$domU_check
>  echo \"${passed}\"
>  "
>  
> -    dom0_check="
> +        dom0_check="
>  tail -F /var/log/xen/qemu-dm-domU.log &
>  until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
>      sleep 1
>  done
>  "
> -fi
> +        ;;
> +
> +    *)
> +        echo "Unrecognised test_variant '${test_variant}'" >&2
> +        exit 1
> +        ;;
> +esac
>  
>  # DomU
>  mkdir -p rootfs
> -- 
> 2.39.5
> 
--8323329-624098942-1729549062=:3833--


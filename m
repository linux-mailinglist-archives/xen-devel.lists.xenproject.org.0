Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A23398444
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 10:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135889.252224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loMN3-0008Fg-C4; Wed, 02 Jun 2021 08:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135889.252224; Wed, 02 Jun 2021 08:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loMN3-0008Cm-8w; Wed, 02 Jun 2021 08:37:01 +0000
Received: by outflank-mailman (input) for mailman id 135889;
 Wed, 02 Jun 2021 08:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm/u=K4=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1loMN1-0008Cf-Ap
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 08:36:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d7f00a0a-6fb3-41bf-b986-732cc9e4e95c;
 Wed, 02 Jun 2021 08:36:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-7ydU6i1XMsy7U_gprRY6fg-1; Wed, 02 Jun 2021 04:36:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D788015F5;
 Wed,  2 Jun 2021 08:36:53 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-42.ams2.redhat.com
 [10.36.114.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 587016A03A;
 Wed,  2 Jun 2021 08:36:51 +0000 (UTC)
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
X-Inumbo-ID: d7f00a0a-6fb3-41bf-b986-732cc9e4e95c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622623017;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MONz85R9Mj+QEfj5djA2pIXnRHcnv5ZAisbRFvQPcUI=;
	b=fTnXmDeHzf1Vg5YfZLz54N+lI8zLPoppR4E0Wg7h+CAtaCkRK3AwB4kOk73ra41jpf/UIu
	t2wzSkWYQ8X0Ja9T1Dn5gyfJgGuj4OkUstkyI+N/gpbsqlOBGOEs3Q8mgupIP4TgTeZTB0
	u5KOsAZMXZmt0AYoOD10fr7FAY3rocg=
X-MC-Unique: 7ydU6i1XMsy7U_gprRY6fg-1
Subject: Re: [edk2-devel] [PATCH 00/43] OvmfPkg: remove Xen support from
 OvmfPkg*.dsc, in favor of OvmfXen.dsc
From: Laszlo Ersek <lersek@redhat.com>
Cc: devel@edk2.groups.io, Ard Biesheuvel <ardb+tianocore@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Reply-To: devel@edk2.groups.io, lersek@redhat.com
References: <20210526201446.12554-1-lersek@redhat.com>
To: Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <71da2a3b-aab1-4ecf-7e01-16b537d841a2@redhat.com>
Date: Wed, 2 Jun 2021 10:36:49 +0200
MIME-Version: 1.0
In-Reply-To: <20210526201446.12554-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Anthony, Julien,

(or anyone else subscribed to xen-devel -- CC'd now),

On 05/26/21 22:14, Laszlo Ersek wrote:
> Bugzilla: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
> Repo:     https://pagure.io/lersek/edk2.git
> Branch:   xen_split_bz_2122

can you please build the OvmfXen platform on this branch, and check if
there are any regressions?

Thanks,
Laszlo

> 
> This patch set removes dynamic Xen enlightenment from the following
> platforms:
> 
>   OvmfPkg/OvmfPkgIa32.dsc
>   OvmfPkg/OvmfPkgIa32X64.dsc
>   OvmfPkg/OvmfPkgX64.dsc
> 
> In Xen guests, the following platform should be used:
> 
>   OvmfPkg/OvmfXen.dsc
> 
> Please see more details / references in the bugzilla ticket.
> 
> NOOPT build savings:
> 
> - Ia32:    PEIFV 1536 bytes, DXEFV 130288 bytes
> - Ia32X64: PEIFV 1536 bytes, DXEFV 140912 bytes
> - X64:     PEIFV 1664 bytes, DXEFV 140912 bytes
> - Xen:     PEIFV  256 bytes, DXEFV  69504 bytes
> 
> Functional testing:
> 
> - Booted a Fedora guest on OvmfPkgIa32X64 on QEMU/KVM, compared verbose
>   logs before-after. Memory allocations were satisfied at different
>   addresses, as expected, plus the Xen drivers were absent. No
>   differences otherwise.
> 
> - Booted a RHEL guest on ArmVirtQemu on AARCH64. Memory allocations were
>   satisfied at different addresses, as expected.
> 
> - Xen regression-testing was not done; I'm requesting feedback.
> 
> Build testing / bisectability: at every stage, the series builds with
> the following script:
> 
>> #!/bin/bash
>> set -e -u -C
>>
>> build -b DEBUG -t GCC5 -p ArmVirtPkg/ArmVirtKvmTool.dsc            -a AARCH64
>> build -b DEBUG -t GCC5 -p ArmVirtPkg/ArmVirtKvmTool.dsc    -a ARM
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc               -a AARCH64
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtQemu.dsc       -a ARM
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc         -a AARCH64
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc -a ARM
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtXen.dsc                -a AARCH64
>> build -b NOOPT -t GCC5 -p ArmVirtPkg/ArmVirtXen.dsc        -a ARM
>> build -b NOOPT -t GCC5 -p OvmfPkg/AmdSev/AmdSevX64.dsc             -a X64
>> build -b NOOPT -t GCC5 -p OvmfPkg/Bhyve/BhyveX64.dsc               -a X64
>> build -b NOOPT -t GCC5 -p OvmfPkg/OvmfPkgIa32.dsc          -a IA32
>> build -b NOOPT -t GCC5 -p OvmfPkg/OvmfPkgIa32X64.dsc       -a IA32 -a X64
>> build -b NOOPT -t GCC5 -p OvmfPkg/OvmfPkgX64.dsc                   -a X64
>> build -b NOOPT -t GCC5 -p OvmfPkg/OvmfXen.dsc                      -a X64
> 
> The patches in the series were formatted with the following options, for
> posting:
> 
>   --stat=1000 --stat-graph-width=20 --find-copies-harder -U6
> 
> (The option "--find-copies-harder" is not the best for presenting every
> single patch in the series, in isolation, but taken globally for the
> entire series, it is the most helpful option.)
> 
> Some patches advance with really small steps, in order to cut down on a
> subsequent "meaty" patch. Personally I don't like reviewing code
> movement patches, so I did my best to (a) keep that to a minimum, and
> (b) present it as unintrusively as possible.
> 
> The CC list is a bit long; the reason is that I kept touching up
> "Maintainers.txt", and the "OvmfPkg/Bhyve" and "OvmfPkg/AmdSev"
> platforms as well (whenever it made sense).
> 
> Cc: Andrew Fish <afish@apple.com>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
> Cc: Brijesh Singh <brijesh.singh@amd.com>
> Cc: Erdem Aktas <erdemaktas@google.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Jiewen Yao <jiewen.yao@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Michael D Kinney <michael.d.kinney@intel.com>
> Cc: Min Xu <min.m.xu@intel.com>
> Cc: Peter Grehan <grehan@freebsd.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Rebecca Cran <rebecca@bsdio.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Thanks,
> Laszlo
> 
> Laszlo Ersek (43):
>   OvmfPkg: remove the Xen drivers from the IA32, IA32X64, and X64
>     platforms
>   OvmfPkg: remove the Xen drivers from the AmdSev platform
>   OvmfPkg: switch IA32, IA32X64, X64 to the fw_cfg-only ACPI platform
>     driver
>   OvmfPkg: switch the AmdSev platform to the fw_cfg-only ACPI platform
>     driver
>   OvmfPkg/README: bump minimum QEMU version to 1.7.1, machine types to
>     1.7
>   OvmfPkg/AcpiPlatformDxe: fix header file warts
>   OvmfPkg/AcpiPlatformDxe: sort #includes and [LibraryClasses]
>   OvmfPkg/AcpiPlatformDxe/QemuLoader.h: remove QemuFwCfgLib class
>     dependency
>   OvmfPkg/AcpiPlatformDxe: move "QemuLoader.h" to IndustryStandard
>   OvmfPkg/AcpiPlatformDxe: consolidate #includes and [LibraryClasses]
>   OvmfPkg/XenAcpiPlatformDxe: create from AcpiPlatformDxe
>   OvmfPkg/AcpiPlatformDxe: remove the "AcpiPlatformDxe.inf" driver
>   OvmfPkg/XenAcpiPlatformDxe: remove the QEMU ACPI linker/loader client
>   OvmfPkg/XenAcpiPlatformDxe: remove QEMU fw_cfg dependency
>   OvmfPkg/XenAcpiPlatformDxe: remove the InstallAcpiTable() helper
>     function
>   OvmfPkg/XenAcpiPlatformDxe: remove OVMF's built-in ACPI tables
>   OvmfPkg/Bhyve/AcpiPlatformDxe: fix file path typo in comment
>   OvmfPkg/AcpiTables: remove unused module
>   OvmfPkg/OvmfXen: make "PcdPciDisableBusEnumeration" Fixed-at-Build
>   OvmfPkg/XenAcpiPlatformDxe: remove delayed ACPI table installation
>   OvmfPkg/PlatformPei: remove Xen support
>   OvmfPkg: drop PcdPciDisableBusEnumeration from the IA32, IA32X64, X64
>     DSCs
>   OvmfPkg: drop PcdPciDisableBusEnumeration from the AmdSev platform
>   OvmfPkg/Bhyve: make "PcdPciDisableBusEnumeration" Fixed-at-Build
>   OvmfPkg/OvmfXen: remove IncompatiblePciDeviceSupport DXE driver
>   OvmfPkg/Bhyve: remove IncompatiblePciDeviceSupport DXE driver
>   OvmfPkg/IncompatiblePciDeviceSupportDxe: remove
>     PcdPciDisableBusEnumeration
>   OvmfPkg/PciHostBridgeLib: consolidate #includes and INF file sections
>   OvmfPkg/PciHostBridgeLibScan: create from PciHostBridgeLib
>   OvmfPkg/Bhyve: consume PciHostBridgeLibScan
>   OvmfPkg/OvmfXen: consume PciHostBridgeLibScan
>   OvmfPkg/PciHostBridgeLib: remove Bhyve and Xen support
>   OvmfPkg/PciHostBridgeLibScan: remove QEMU (fw_cfg) support
>   OvmfPkg/PciHostBridgeLibScan: remove PcdOvmfHostBridgePciDevId
>   OvmfPkg/PciHostBridgeLibScan: clean up file names and file-top
>     comments
>   OvmfPkg/SmbiosPlatformDxe: clean up #includes and INF
>   OvmfPkg/SmbiosPlatformDxe: return EFI_NOT_FOUND if there is no SMBIOS
>     data
>   OvmfPkg/SmbiosPlatformDxe: locate SMBIOS protocol in
>     InstallAllStructures()
>   OvmfPkg/SmbiosPlatformDxe: split GetXenSmbiosTables() decl. to new
>     header
>   OvmfPkg/SmbiosPlatformDxe: declare InstallAllStructures() in header
>     file
>   OvmfPkg/SmbiosPlatformDxe: create Xen-specific module INF file
>   OvmfPkg/SmbiosPlatformDxe: split Xen entry point from QEMU entry point
>   OvmfPkg: restrict XenPlatformLib to BdsDxe in the IA32, IA32X64, X64
>     DSCs
> 
>  Maintainers.txt                                                                                          |  10 +-
>  OvmfPkg/AcpiPlatformDxe/AcpiPlatform.c                                                                   | 262 --------
>  OvmfPkg/AcpiPlatformDxe/AcpiPlatform.h                                                                   |  50 +-
>  OvmfPkg/AcpiPlatformDxe/AcpiPlatformDxe.inf                                                              |  71 --
>  OvmfPkg/AcpiPlatformDxe/BootScript.c                                                                     |   7 +-
>  OvmfPkg/AcpiPlatformDxe/EntryPoint.c                                                                     |   7 +-
>  OvmfPkg/AcpiPlatformDxe/PciDecoding.c                                                                    |   4 +-
>  OvmfPkg/AcpiPlatformDxe/Qemu.c                                                                           | 511 ---------------
>  OvmfPkg/AcpiPlatformDxe/QemuFwCfgAcpi.c                                                                  |  21 +-
>  OvmfPkg/AcpiPlatformDxe/QemuFwCfgAcpiPlatformDxe.inf                                                     |   5 +-
>  OvmfPkg/AcpiTables/AcpiTables.inf                                                                        |  38 --
>  OvmfPkg/AcpiTables/Dsdt.asl                                                                              | 692 --------------------
>  OvmfPkg/AcpiTables/Facp.aslc                                                                             |  89 ---
>  OvmfPkg/AcpiTables/Facs.aslc                                                                             |  78 ---
>  OvmfPkg/AcpiTables/Madt.aslc                                                                             | 153 -----
>  OvmfPkg/AcpiTables/Platform.h                                                                            |  68 --
>  OvmfPkg/AcpiTables/Ssdt.asl                                                                              |  13 -
>  OvmfPkg/AmdSev/AmdSevX64.dsc                                                                             |   9 +-
>  OvmfPkg/AmdSev/AmdSevX64.fdf                                                                             |  12 +-
>  OvmfPkg/Bhyve/AcpiPlatformDxe/AcpiPlatform.c                                                             |   2 +-
>  OvmfPkg/Bhyve/BhyveX64.dsc                                                                               |   5 +-
>  OvmfPkg/Bhyve/BhyveX64.fdf                                                                               |   1 -
>  OvmfPkg/Bhyve/PlatformPei/PlatformPei.inf                                                                |   1 -
>  OvmfPkg/{AcpiPlatformDxe => Include/IndustryStandard}/QemuLoader.h                                       |   8 +-
>  OvmfPkg/IncompatiblePciDeviceSupportDxe/IncompatiblePciDeviceSupport.c                                   |  10 +-
>  OvmfPkg/IncompatiblePciDeviceSupportDxe/IncompatiblePciDeviceSupport.inf                                 |   2 -
>  OvmfPkg/Library/PciHostBridgeLib/PciHostBridgeLib.c                                                      |  28 +-
>  OvmfPkg/Library/PciHostBridgeLib/PciHostBridgeLib.inf                                                    |   8 +-
>  OvmfPkg/Library/{PciHostBridgeLib => PciHostBridgeLibScan}/PciHostBridge.h                               |   4 +-
>  OvmfPkg/Library/PciHostBridgeLibScan/PciHostBridgeLib.c                                                  |  74 +++
>  OvmfPkg/Library/{PciHostBridgeLib/PciHostBridgeLib.inf => PciHostBridgeLibScan/PciHostBridgeLibScan.inf} |  24 +-
>  OvmfPkg/Library/{PciHostBridgeLib/XenSupport.c => PciHostBridgeLibScan/ScanForRootBridges.c}             |  27 +-
>  OvmfPkg/OvmfPkgIa32.dsc                                                                                  |  10 +-
>  OvmfPkg/OvmfPkgIa32.fdf                                                                                  |  12 +-
>  OvmfPkg/OvmfPkgIa32X64.dsc                                                                               |  10 +-
>  OvmfPkg/OvmfPkgIa32X64.fdf                                                                               |  12 +-
>  OvmfPkg/OvmfPkgX64.dsc                                                                                   |  10 +-
>  OvmfPkg/OvmfPkgX64.fdf                                                                                   |  12 +-
>  OvmfPkg/OvmfXen.dsc                                                                                      |  10 +-
>  OvmfPkg/OvmfXen.fdf                                                                                      |  12 +-
>  OvmfPkg/PlatformPei/MemDetect.c                                                                          |  10 +-
>  OvmfPkg/PlatformPei/Platform.c                                                                           | 162 +++--
>  OvmfPkg/PlatformPei/Platform.h                                                                           |  17 -
>  OvmfPkg/PlatformPei/PlatformPei.inf                                                                      |   4 -
>  OvmfPkg/PlatformPei/Xen.c                                                                                | 222 -------
>  OvmfPkg/PlatformPei/Xen.h                                                                                |  39 --
>  OvmfPkg/README                                                                                           |  43 +-
>  OvmfPkg/SmbiosPlatformDxe/ArmXen.c                                                                       |   2 +-
>  OvmfPkg/SmbiosPlatformDxe/Qemu.c                                                                         |  41 +-
>  OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c                                                            |  79 +--
>  OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.h                                                            |  37 +-
>  OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.inf                                                          |  23 +-
>  OvmfPkg/SmbiosPlatformDxe/X86Xen.c                                                                       |   8 +-
>  OvmfPkg/SmbiosPlatformDxe/Xen.c                                                                          |  49 ++
>  OvmfPkg/SmbiosPlatformDxe/{ArmXen.c => XenSmbiosPlatformDxe.h}                                           |  20 +-
>  OvmfPkg/SmbiosPlatformDxe/{SmbiosPlatformDxe.inf => XenSmbiosPlatformDxe.inf}                            |  32 +-
>  OvmfPkg/XenAcpiPlatformDxe/AcpiPlatform.c                                                                |  41 ++
>  OvmfPkg/XenAcpiPlatformDxe/AcpiPlatform.h                                                                |  28 +
>  OvmfPkg/XenAcpiPlatformDxe/EntryPoint.c                                                                  |  43 ++
>  OvmfPkg/{AcpiPlatformDxe => XenAcpiPlatformDxe}/Xen.c                                                    |  66 +-
>  OvmfPkg/XenAcpiPlatformDxe/XenAcpiPlatformDxe.inf                                                        |  45 ++
>  OvmfPkg/XenPlatformPei/Platform.c                                                                        |   1 -
>  OvmfPkg/XenPlatformPei/Platform.h                                                                        |   5 -
>  OvmfPkg/XenPlatformPei/Xen.c                                                                             |  20 -
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf                                                                |   1 -
>  65 files changed, 593 insertions(+), 2827 deletions(-)
>  delete mode 100644 OvmfPkg/AcpiPlatformDxe/AcpiPlatform.c
>  delete mode 100644 OvmfPkg/AcpiPlatformDxe/AcpiPlatformDxe.inf
>  delete mode 100644 OvmfPkg/AcpiPlatformDxe/Qemu.c
>  delete mode 100644 OvmfPkg/AcpiTables/AcpiTables.inf
>  delete mode 100644 OvmfPkg/AcpiTables/Dsdt.asl
>  delete mode 100644 OvmfPkg/AcpiTables/Facp.aslc
>  delete mode 100644 OvmfPkg/AcpiTables/Facs.aslc
>  delete mode 100644 OvmfPkg/AcpiTables/Madt.aslc
>  delete mode 100644 OvmfPkg/AcpiTables/Platform.h
>  delete mode 100644 OvmfPkg/AcpiTables/Ssdt.asl
>  rename OvmfPkg/{AcpiPlatformDxe => Include/IndustryStandard}/QemuLoader.h (94%)
>  rename OvmfPkg/Library/{PciHostBridgeLib => PciHostBridgeLibScan}/PciHostBridge.h (57%)
>  create mode 100644 OvmfPkg/Library/PciHostBridgeLibScan/PciHostBridgeLib.c
>  copy OvmfPkg/Library/{PciHostBridgeLib/PciHostBridgeLib.inf => PciHostBridgeLibScan/PciHostBridgeLibScan.inf} (51%)
>  rename OvmfPkg/Library/{PciHostBridgeLib/XenSupport.c => PciHostBridgeLibScan/ScanForRootBridges.c} (91%)
>  delete mode 100644 OvmfPkg/PlatformPei/Xen.c
>  delete mode 100644 OvmfPkg/PlatformPei/Xen.h
>  create mode 100644 OvmfPkg/SmbiosPlatformDxe/Xen.c
>  copy OvmfPkg/SmbiosPlatformDxe/{ArmXen.c => XenSmbiosPlatformDxe.h} (56%)
>  copy OvmfPkg/SmbiosPlatformDxe/{SmbiosPlatformDxe.inf => XenSmbiosPlatformDxe.inf} (65%)
>  create mode 100644 OvmfPkg/XenAcpiPlatformDxe/AcpiPlatform.c
>  create mode 100644 OvmfPkg/XenAcpiPlatformDxe/AcpiPlatform.h
>  create mode 100644 OvmfPkg/XenAcpiPlatformDxe/EntryPoint.c
>  rename OvmfPkg/{AcpiPlatformDxe => XenAcpiPlatformDxe}/Xen.c (82%)
>  create mode 100644 OvmfPkg/XenAcpiPlatformDxe/XenAcpiPlatformDxe.inf
> 
> 
> base-commit: cfa6ffb113f2c0d922034cc77c0d6c52eea05497
> 



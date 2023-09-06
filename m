Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E32793822
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 11:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596424.930312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdomb-0000vZ-0V; Wed, 06 Sep 2023 09:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596424.930312; Wed, 06 Sep 2023 09:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoma-0000tY-Ty; Wed, 06 Sep 2023 09:25:08 +0000
Received: by outflank-mailman (input) for mailman id 596424;
 Wed, 06 Sep 2023 09:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtf2=EW=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1qdomZ-0000tQ-GH
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 09:25:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426356e0-4c97-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 11:25:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B98B60FA4
 for <xen-devel@lists.xenproject.org>; Wed,  6 Sep 2023 09:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D76C433AD
 for <xen-devel@lists.xenproject.org>; Wed,  6 Sep 2023 09:25:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50078eba7afso5802574e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 02:25:01 -0700 (PDT)
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
X-Inumbo-ID: 426356e0-4c97-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693992301;
	bh=lmJjVtMotZR0OEyvP2Hr8GZbnRjZIP8Ao3JdDPcQq2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OY9p21GOOSqNemi6Nx47WMZmAbM1jtR3KZ3wehN4eUWQOLC096xwn9Y7Aqsx+iDdy
	 vjj4YEh+S6t9mSvAvFcXGVsofGdnunMzURL+s+J7WMxSn0/YdFA4sPE78nnBb7Oz8A
	 8WsxE8fP41ifRpaa5Ux7Pn5O1NGP76SEcv0Uy9rE6M1Mq1de8DFc4dXXAOjWPU7/jO
	 RIKIsAw7bJp83v8mHN3Ejs9TctABuMY6TaAP7nFwGERLZO6d5T9VUP1+l4jZRWP0z2
	 wq2ui3kdWqVEksD45T81rEcGc5GFpftxmk5d3o4fzpp26Di4WO3b0gZGWdEVleZ3wf
	 woBC/R7MRvF4g==
X-Gm-Message-State: AOJu0YyZR+02fh9eA7JpcfgM49q4dHg4eaoiattKG2JBLPVap7k4WjMU
	jVOmoJ6U3bKt+RU8rlGfrL/R+Gew8DJuCOuvDAM=
X-Google-Smtp-Source: AGHT+IF9m75EGAUP/FRxHy9FzYPj8AVAnqNyJxlhMAtQ5mOPYoA4I6H2XvJqCnVZ3MZJmkj+1jC0DjCyu17N+9+HlJQ=
X-Received: by 2002:a05:6512:3e01:b0:4fd:cae7:2393 with SMTP id
 i1-20020a0565123e0100b004fdcae72393mr2496977lfv.2.1693992299613; Wed, 06 Sep
 2023 02:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <c79e568e0d1c85bef9a2efc4c854de8f80ea1487.1689244868.git.xenia.ragiadakou@amd.com>
In-Reply-To: <c79e568e0d1c85bef9a2efc4c854de8f80ea1487.1689244868.git.xenia.ragiadakou@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Sep 2023 11:24:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEcgbxMbh=B43KqKikVZMmz75f6Pd3rZB9fFF3eszghHA@mail.gmail.com>
Message-ID: <CAMj1kXEcgbxMbh=B43KqKikVZMmz75f6Pd3rZB9fFF3eszghHA@mail.gmail.com>
Subject: Re: [PATCH] OvmfPkg/OvmfXen: Fix S3
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: devel@edk2.groups.io, Ard Biesheuvel <ardb+tianocore@kernel.org>, 
	Jiewen Yao <jiewen.yao@intel.com>, Jordan Justen <jordan.l.justen@intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jul 2023 at 12:48, Xenia Ragiadakou <xenia.ragiadakou@amd.com> wrote:
>
> Currently, resuming an S3 suspended guest results in the following
> assertion failure:
> ASSERT MdePkg/Library/PeiResourcePublicationLib/PeiResourcePublicationLib.c(41): MemoryLength > 0
> This happens because some parts of the S3 suspend and resume paths
> are missing in order for S3 to work. For instance, the variables
> mS3AcpiReservedMemoryBase and mS3AcpiReservedMemoryBase are not
> initialized, regions that are used on S3 resume are either missing
> or not marked as ACPI NVS memory and can be corrupted by the OS.
> This patch adds the missing parts based heavily on the existing S3
> implementation of other virtual platforms.
>
> For S3 support, the provision of fw_cfg is required in order for
> suspend states to be retrieved.
>
> Another issue noticed is that when CalibrateLapicTimer() is called
> on S3 resume path, the shared info page is remapped to a different
> guest physical address. This remapping happens under guest's feet,
> so any subsequent attempt of the guest to access the shared info
> page results in nested page faults. This patch removes any local
> APIC timer initializion and calibration from S3 resume path.
>
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

Anyone care to review this?

> ---
>  OvmfPkg/XenPlatformPei/Fv.c               |  2 +-
>  OvmfPkg/XenPlatformPei/MemDetect.c        | 60 ++++++++++++++++++++++-
>  OvmfPkg/XenPlatformPei/Platform.c         | 11 ++++-
>  OvmfPkg/XenPlatformPei/Platform.h         |  2 +
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf |  7 +++
>  5 files changed, 78 insertions(+), 4 deletions(-)
>
> diff --git a/OvmfPkg/XenPlatformPei/Fv.c b/OvmfPkg/XenPlatformPei/Fv.c
> index 871a2c1c5b..37ecb3cfee 100644
> --- a/OvmfPkg/XenPlatformPei/Fv.c
> +++ b/OvmfPkg/XenPlatformPei/Fv.c
> @@ -37,7 +37,7 @@ PeiFvInitialization (
>    BuildMemoryAllocationHob (
>      PcdGet32 (PcdOvmfPeiMemFvBase),
>      PcdGet32 (PcdOvmfPeiMemFvSize),
> -    EfiBootServicesData
> +    mS3Supported ? EfiACPIMemoryNVS : EfiBootServicesData
>      );
>
>    //
> diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/MemDetect.c
> index e552e7a55e..1724a4988f 100644
> --- a/OvmfPkg/XenPlatformPei/MemDetect.c
> +++ b/OvmfPkg/XenPlatformPei/MemDetect.c
> @@ -283,6 +283,19 @@ PublishPeiMemory (
>
>    LowerMemorySize = GetSystemMemorySizeBelow4gb ();
>
> +  //
> +  // If S3 is supported, then the S3 permanent PEI memory is placed next,
> +  // downwards. Its size is primarily dictated by CpuMpPei. The formula below
> +  // is an approximation.
> +  //
> +  if (mS3Supported) {
> +    mS3AcpiReservedMemorySize = SIZE_512KB +
> +                                PcdGet32 (PcdCpuMaxLogicalProcessorNumber) *
> +                                PcdGet32 (PcdCpuApStackSize);
> +    mS3AcpiReservedMemoryBase = LowerMemorySize - mS3AcpiReservedMemorySize;
> +    LowerMemorySize           = mS3AcpiReservedMemoryBase;
> +  }
> +
>    if (mBootMode == BOOT_ON_S3_RESUME) {
>      MemoryBase = mS3AcpiReservedMemoryBase;
>      MemorySize = mS3AcpiReservedMemorySize;
> @@ -328,6 +341,51 @@ InitializeRamRegions (
>  {
>    XenPublishRamRegions ();
>
> +  if (mS3Supported && (mBootMode != BOOT_ON_S3_RESUME)) {
> +    //
> +    // This is the memory range that will be used for PEI on S3 resume
> +    //
> +    BuildMemoryAllocationHob (
> +      mS3AcpiReservedMemoryBase,
> +      mS3AcpiReservedMemorySize,
> +      EfiACPIMemoryNVS
> +      );
> +
> +    //
> +    // Cover the initial RAM area used as stack and temporary PEI heap.
> +    //
> +    // This is reserved as ACPI NVS so it can be used on S3 resume.
> +    //
> +    BuildMemoryAllocationHob (
> +      PcdGet32 (PcdOvmfSecPeiTempRamBase),
> +      PcdGet32 (PcdOvmfSecPeiTempRamSize),
> +      EfiACPIMemoryNVS
> +      );
> +
> +    //
> +    // SEC stores its table of GUIDed section handlers here.
> +    //
> +    BuildMemoryAllocationHob (
> +      PcdGet64 (PcdGuidedExtractHandlerTableAddress),
> +      PcdGet32 (PcdGuidedExtractHandlerTableSize),
> +      EfiACPIMemoryNVS
> +      );
> +
> + #ifdef MDE_CPU_X64
> +    //
> +    // Reserve the initial page tables built by the reset vector code.
> +    //
> +    // Since this memory range will be used by the Reset Vector on S3
> +    // resume, it must be reserved as ACPI NVS.
> +    //
> +    BuildMemoryAllocationHob (
> +      (EFI_PHYSICAL_ADDRESS)(UINTN)PcdGet32 (PcdOvmfSecPageTablesBase),
> +      (UINT64)(UINTN)PcdGet32 (PcdOvmfSecPageTablesSize),
> +      EfiACPIMemoryNVS
> +      );
> + #endif
> +  }
> +
>    if (mBootMode != BOOT_ON_S3_RESUME) {
>      //
>      // Reserve the lock box storage area
> @@ -346,7 +404,7 @@ InitializeRamRegions (
>      BuildMemoryAllocationHob (
>        (EFI_PHYSICAL_ADDRESS)(UINTN)PcdGet32 (PcdOvmfLockBoxStorageBase),
>        (UINT64)(UINTN)PcdGet32 (PcdOvmfLockBoxStorageSize),
> -      EfiBootServicesData
> +      mS3Supported ? EfiACPIMemoryNVS : EfiBootServicesData
>        );
>    }
>  }
> diff --git a/OvmfPkg/XenPlatformPei/Platform.c b/OvmfPkg/XenPlatformPei/Platform.c
> index c3fdf3d0b8..1b074cff33 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.c
> +++ b/OvmfPkg/XenPlatformPei/Platform.c
> @@ -60,6 +60,8 @@ UINT16  mHostBridgeDevId;
>
>  EFI_BOOT_MODE  mBootMode = BOOT_WITH_FULL_CONFIGURATION;
>
> +BOOLEAN  mS3Supported = FALSE;
> +
>  VOID
>  AddIoMemoryBaseSizeHob (
>    EFI_PHYSICAL_ADDRESS  MemoryBase,
> @@ -350,6 +352,11 @@ BootModeInitialization (
>
>    if (CmosRead8 (0xF) == 0xFE) {
>      mBootMode = BOOT_ON_S3_RESUME;
> +    if (!mS3Supported) {
> +      DEBUG ((DEBUG_ERROR, "ERROR: S3 not supported\n"));
> +      ASSERT (FALSE);
> +      CpuDeadLoop ();
> +    }
>    }
>
>    CmosWrite8 (0xF, 0x00);
> @@ -463,6 +470,7 @@ InitializeXenPlatform (
>    //
>    if (QemuFwCfgS3Enabled ()) {
>      DEBUG ((DEBUG_INFO, "S3 support was detected on QEMU\n"));
> +    mS3Supported = TRUE;
>      Status = PcdSetBoolS (PcdAcpiS3Enable, TRUE);
>      ASSERT_EFI_ERROR (Status);
>    }
> @@ -481,9 +489,8 @@ InitializeXenPlatform (
>
>    InitializeRamRegions ();
>
> -  CalibrateLapicTimer ();
> -
>    if (mBootMode != BOOT_ON_S3_RESUME) {
> +    CalibrateLapicTimer ();
>      ReserveEmuVariableNvStore ();
>      PeiFvInitialization ();
>      MemMapInitialization ();
> diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Platform.h
> index 7b4de128e7..fda66747cc 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.h
> +++ b/OvmfPkg/XenPlatformPei/Platform.h
> @@ -139,4 +139,6 @@ extern UINT8  mPhysMemAddressWidth;
>
>  extern UINT16  mHostBridgeDevId;
>
> +extern BOOLEAN  mS3Supported;
> +
>  #endif // _PLATFORM_PEI_H_INCLUDED_
> diff --git a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> index 20c27ff34b..a359cf60ca 100644
> --- a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> +++ b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> @@ -69,9 +69,13 @@
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfPeiMemFvSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvSize
> +  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPeiTempRamBase
> +  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPeiTempRamSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPageTablesBase
> +  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPageTablesSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageSize
> +  gUefiOvmfPkgTokenSpaceGuid.PcdGuidedExtractHandlerTableSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciIoBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciIoSize
> @@ -80,6 +84,7 @@
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Base
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Size
>    gUefiOvmfPkgTokenSpaceGuid.PcdQ35TsegMbytes
> +  gEfiMdePkgTokenSpaceGuid.PcdGuidedExtractHandlerTableAddress
>    gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiS3Enable
>    gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize
>    gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved
> @@ -89,6 +94,8 @@
>    gEfiMdePkgTokenSpaceGuid.PcdFSBClock
>    gEfiSecurityPkgTokenSpaceGuid.PcdOptionRomImageVerificationPolicy
>    gUefiCpuPkgTokenSpaceGuid.PcdCpuLocalApicBaseAddress
> +  gUefiCpuPkgTokenSpaceGuid.PcdCpuApStackSize
> +  gUefiCpuPkgTokenSpaceGuid.PcdCpuMaxLogicalProcessorNumber
>
>    gUefiOvmfPkgTokenSpaceGuid.PcdXenPvhStartOfDayStructPtr
>    gUefiOvmfPkgTokenSpaceGuid.PcdXenPvhStartOfDayStructPtrSize
> --
> 2.34.1
>


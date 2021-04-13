Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3335DC36
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109640.209311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFyr-0007iX-Hb; Tue, 13 Apr 2021 10:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109640.209311; Tue, 13 Apr 2021 10:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFyr-0007i8-E9; Tue, 13 Apr 2021 10:09:13 +0000
Received: by outflank-mailman (input) for mailman id 109640;
 Tue, 13 Apr 2021 10:09:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBYq=JK=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lWFyp-0007i3-JL
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 10:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ae7dcd98-6170-4d59-bc73-b556bbc87c9f;
 Tue, 13 Apr 2021 10:09:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-jznWYgxFP7iZ1PhKOVd0_Q-1; Tue, 13 Apr 2021 06:09:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90263107ACF4;
 Tue, 13 Apr 2021 10:09:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-199.ams2.redhat.com
 [10.36.115.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D851B5F1;
 Tue, 13 Apr 2021 10:09:05 +0000 (UTC)
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
X-Inumbo-ID: ae7dcd98-6170-4d59-bc73-b556bbc87c9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618308550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfrd8x6Ezlp1Kr3Uel2G0zs//RlZy9GY57S5UJx/4nE=;
	b=baegzdffrkhn+BGMSfmc0bI0MSfiKsfjAq/2kvqDhbBSwDSjgIQFIDI6Y0rx8Xf9//PVvg
	p4nAYe9ZfMfyawDjg+10zRKgUnGapzAFlwn9VLXQfL5gLY+y9PUDBQfVIacKbInNfsFJca
	gZu5nNZ6Ea+sTE5xLD2IVFv2OfTNAvA=
X-MC-Unique: jznWYgxFP7iZ1PhKOVd0_Q-1
Subject: Re: [PATCH v3 7/7] OvmfPkg/OvmfXen: Set PcdFSBClock
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
 <20210412133003.146438-8-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fe734f47-7721-e9f4-29b6-40f711f46fe3@redhat.com>
Date: Tue, 13 Apr 2021 12:09:05 +0200
MIME-Version: 1.0
In-Reply-To: <20210412133003.146438-8-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/12/21 15:30, Anthony PERARD wrote:
> Update gEfiMdePkgTokenSpaceGuid.PcdFSBClock so it can have the correct
> value when SecPeiDxeTimerLibCpu start to use it for the APIC timer.
> 
> Currently, nothing appear to use the value in PcdFSBClock before
> XenPlatformPei had a chance to set it even though TimerLib is included
> in modules run before XenPlatformPei.
> 
> XenPlatformPei doesn't use any of the functions that would use that
> value. No other modules in the PEI phase seems to use the TimerLib
> before PcdFSBClock is set. There are currently two other modules in
> the PEI phase that needs the TimerLib:
> - S3Resume2Pei, but only because LocalApicLib needs it, but nothing is
>   using the value from PcdFSBClock.
> - CpuMpPei, but I believe it only runs after XenPlatformPei
> 
> Before the PEI phase, there's the SEC phase, and SecMain needs
> TimerLib because of LocalApicLib. And it initialise the APIC timers
> for the debug agent. But I don't think any of the DebugLib that
> OvmfXen could use are actually using the *Delay functions in TimerLib,
> and so would not use the value from PcdFSBClock which would be
> uninitialised.
> 
> A simple runtime test showed that TimerLib doesn't use PcdFSBClock
> value before it is set.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
> 
> Notes:
>     v3:
>     - cast Freq in assert
>     - fix typos
>     - use correct assert to check Status
>     v2:
>     - keep the default value of PcdFSBClock because that is part of the syntax.
> 
>  OvmfPkg/OvmfXen.dsc                       | 4 +---
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf | 1 +
>  OvmfPkg/XenPlatformPei/Xen.c              | 4 ++++
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
> index 86abe277c349..e535503e385d 100644
> --- a/OvmfPkg/OvmfXen.dsc
> +++ b/OvmfPkg/OvmfXen.dsc
> @@ -447,9 +447,6 @@ [PcdsFixedAtBuild]
>    # Point to the MdeModulePkg/Application/UiApp/UiApp.inf
>    gEfiMdeModulePkgTokenSpaceGuid.PcdBootManagerMenuFile|{ 0x21, 0xaa, 0x2c, 0x46, 0x14, 0x76, 0x03, 0x45, 0x83, 0x6e, 0x8a, 0xb6, 0xf4, 0x66, 0x23, 0x31 }
>  
> -  ## Xen vlapic's frequence is 100 MHz
> -  gEfiMdePkgTokenSpaceGuid.PcdFSBClock|100000000
> -
>    # We populate DXE IPL tables with 1G pages preferably on Xen
>    gEfiMdeModulePkgTokenSpaceGuid.PcdUse1GPageTable|TRUE
>  
> @@ -476,6 +473,7 @@ [PcdsDynamicDefault]
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Base|0x0
>    gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Size|0x800000000
>  
> +  gEfiMdePkgTokenSpaceGuid.PcdFSBClock|100000000
>    gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|0
>  
>    # Set video resolution for text setup.
> diff --git a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> index 5732d2188871..87dd4b24679a 100644
> --- a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> +++ b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> @@ -85,6 +85,7 @@ [Pcd]
>    gEfiMdeModulePkgTokenSpaceGuid.PcdDxeIplSwitchToLongMode
>    gEfiMdeModulePkgTokenSpaceGuid.PcdUse1GPageTable
>    gEfiMdeModulePkgTokenSpaceGuid.PcdPteMemoryEncryptionAddressOrMask
> +  gEfiMdePkgTokenSpaceGuid.PcdFSBClock
>    gEfiSecurityPkgTokenSpaceGuid.PcdOptionRomImageVerificationPolicy
>    gUefiCpuPkgTokenSpaceGuid.PcdCpuLocalApicBaseAddress
>  
> diff --git a/OvmfPkg/XenPlatformPei/Xen.c b/OvmfPkg/XenPlatformPei/Xen.c
> index 8b06bebd7731..2dc9f9ff8f3c 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.c
> +++ b/OvmfPkg/XenPlatformPei/Xen.c
> @@ -632,5 +632,9 @@ CalibrateLapicTimer (
>    Freq = DivU64x64Remainder (Dividend, TscTick2 - TscTick, NULL);
>    DEBUG ((DEBUG_INFO, "APIC Freq % 8lu Hz\n", Freq));
>  
> +  ASSERT ((UINT32)Freq <= MAX_UINT32);
> +  Status = PcdSet32S (PcdFSBClock, Freq);

You misunderstood my request for the explicit cast. I meant that for the
"Freq" argument of the PcdSet32S() function call. Adding it inside the
ASSERT() makes the assertion a tautology, hence, useless. Whereas,
casting Freq to UINT32 *after* the ASSERT() is (a) safe, (b) shuts up a
potential "truncation warning" from visual studio (i.e. when the cast
happens implicitly, due to passing the UINT64 Freq as the 2nd, UINT32,
parameter of PcdSet32S()).

But, I'll fix this up for you when I merge v3; no need to send v4.

Thanks
Laszlo

> +  ASSERT_EFI_ERROR (Status);
> +
>    UnmapXenPage (SharedInfo);
>  }
> 



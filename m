Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6883567F4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 11:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106540.203746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Rn-0004C4-60; Wed, 07 Apr 2021 09:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106540.203746; Wed, 07 Apr 2021 09:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Rn-0004Bf-37; Wed, 07 Apr 2021 09:26:03 +0000
Received: by outflank-mailman (input) for mailman id 106540;
 Wed, 07 Apr 2021 09:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU4Rl-0004BT-Ca
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 09:26:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 826b33aa-3274-4784-833e-1f19f995e6c4;
 Wed, 07 Apr 2021 09:26:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-kmYcCR7DOvOT_ybhReY07g-1; Wed, 07 Apr 2021 05:25:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C9810054F6;
 Wed,  7 Apr 2021 09:25:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B4AE610A8;
 Wed,  7 Apr 2021 09:25:50 +0000 (UTC)
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
X-Inumbo-ID: 826b33aa-3274-4784-833e-1f19f995e6c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617787560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGDPLz2rv7Dxm/1+5sRCpoSWxvO7t5QmRgUEQ0bp0/c=;
	b=isyR/ohvZ7Mp83z1+K/oVupyYbO4WvReHshlM1ic+qXNA/6S2eJC91n3W/zqhyX60Dv0tE
	hQ3S/CFumUgYFnoxIlw+O2WxpHJI+XIYSq+iuP5mzAwdtj2XYFfaYu7H5RkDYd3jsIz0rh
	FjBmjFOl2Zeys7i41C2NCPGViDbj/K0=
X-MC-Unique: kmYcCR7DOvOT_ybhReY07g-1
Subject: Re: [edk2-devel] [PATCH v2 7/7] OvmfPkg/OvmfXen: Set PcdFSBClock
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-8-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <344af4b2-0ce4-23a9-7fde-bf1ee0343d27@redhat.com>
Date: Wed, 7 Apr 2021 11:25:49 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-8-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> Update gEfiMdePkgTokenSpaceGuid.PcdFSBClock so it can have the correct
> value when SecPeiDxeTimerLibCpu start to use it for the APIC timer.
> 
> Currently, nothing appear to use the value in PcdFSBClock before
> XenPlatformPei had a chance to set it even though TimerLib is included
> in modules runned before XenPlatformPei.

(1) s/runned/run/

> 
> XenPlatformPei doesn't use any of the functions that would use that
> value. No other modules in the PEI phase seems to use the TimerLib
> before PcdFSBClock is set. There are currently two other modules in
> the PEI phase that needs the TimerLib:
> - S3Resume2Pei, but only because LocalApicLib needs it, but nothing is
>   using the value from PcdFSBClock.
> - CpuMpPei, but I believe it only runs after XenPlatformPei

Effectively, yes.


* Assuming CpuMpPei were loaded / dispatched before XenPlatformPei, the
following would happen:

CpuMpPeimInit() [UefiCpuPkg/CpuMpPei/CpuMpPei.c] is the entry point
function of CpuMpPei, and all it does is register a notify for the
"memory discovered" PPI. The actual module initialization occurs in
MemoryDiscoveredPpiNotifyCallback().

The "memory discovered PPI" is produced as follows:

- XenPlatformPei calls PublishSystemMemory()

- XenPlatformPei exits

- the PEI Core relocates stuff (HOBs, PEIMs) to the permanent PEI
memory, and re-enters itself in the new area

- the PEI core installs the "memory discovered" PPI

- MemoryDiscoveredPpiNotifyCallback() is called.


* If XenPlatformPei is loaded / dispatched before CpuMpPei (and so the
"memory discovered" PPI exist at the time of CpuMpPei starting), then
MemoryDiscoveredPpiNotifyCallback() is immediately invoked in CpuMpPei,
when the PPI notify is registered.


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

OK.

> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
> 
> Notes:
>     v2:
>     - keep the default value of PcdFSBClock because that is part of the syntax.
> 
>  OvmfPkg/OvmfXen.dsc                       | 4 +---
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf | 1 +
>  OvmfPkg/XenPlatformPei/Xen.c              | 4 ++++
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
> index 507029404f0b..faf3930ace04 100644
> --- a/OvmfPkg/OvmfXen.dsc
> +++ b/OvmfPkg/OvmfXen.dsc
> @@ -442,9 +442,6 @@ [PcdsFixedAtBuild]
>    # Point to the MdeModulePkg/Application/UiApp/UiApp.inf
>    gEfiMdeModulePkgTokenSpaceGuid.PcdBootManagerMenuFile|{ 0x21, 0xaa, 0x2c, 0x46, 0x14, 0x76, 0x03, 0x45, 0x83, 0x6e, 0x8a, 0xb6, 0xf4, 0x66, 0x23, 0x31 }
>  
> -  ## Xen vlapic's frequence is 100 MHz
> -  gEfiMdePkgTokenSpaceGuid.PcdFSBClock|100000000
> -
>    # We populate DXE IPL tables with 1G pages preferably on Xen
>    gEfiMdeModulePkgTokenSpaceGuid.PcdUse1GPageTable|TRUE
>  
> @@ -471,6 +468,7 @@ [PcdsDynamicDefault]
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
> index 7524aaa11a29..a29b4e04086e 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.c
> +++ b/OvmfPkg/XenPlatformPei/Xen.c
> @@ -632,5 +632,9 @@ CalibrateLapicTimer (
>    Freq = DivU64x64Remainder (Dividend, TscTick2 - TscTick, NULL);
>    DEBUG ((DEBUG_INFO, "APIC Freq % 8lu Hz\n", Freq));
>  
> +  ASSERT (Freq <= MAX_UINT32);
> +  Status = PcdSet32S (PcdFSBClock, Freq);

(2) Please use an explicit cast here: (UINT32)Freq; I'm concerned about
VS emitting a warning (despite the ASSERT()).

> +  ASSERT_RETURN_ERROR (Status);

(3) "Status" has type EFI_STATUS here; the assignment from PcdSet32S()
(RETURN_STATUS) is fine, but it's more idiomatic to use
ASSERT_EFI_ERROR(), given the type of "Status".

> +
>    UnmapXenPage (SharedInfo);
>  }
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo



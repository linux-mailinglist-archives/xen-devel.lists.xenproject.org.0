Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF1633C3A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447114.703001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSAB-0005zR-DY; Tue, 22 Nov 2022 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447114.703001; Tue, 22 Nov 2022 12:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSAB-0005xd-Ad; Tue, 22 Nov 2022 12:14:07 +0000
Received: by outflank-mailman (input) for mailman id 447114;
 Tue, 22 Nov 2022 12:14:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxSA9-0005xX-5d
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:14:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSA8-0004W3-Si; Tue, 22 Nov 2022 12:14:04 +0000
Received: from [54.239.6.187] (helo=[192.168.24.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSA8-0004Y8-Kv; Tue, 22 Nov 2022 12:14:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=313pTQ7mn6x1RGSgUbmfS0AK9g/ia/au5WD8yx2fENA=; b=Qpj8s/FpJ42fS02KmZv61bEE/i
	O6umMhxwU34NeLLVbMcsQO0X+BgILCfEovPSw+ahhYJkBq7VgFjhf6NWyjqqollsaebUc/sHkBJ2E
	g7i/aBJNsEkH5ZWWCZLkQRg4pHY8EkTbB2ZwbGySiAy578whGIfihM0fqIESzLMNfmcM=;
Message-ID: <cab642b3-3928-7bd2-a874-0c0edf48fbc1@xen.org>
Date: Tue, 22 Nov 2022 12:14:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-2-Henry.Wang@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221122112623.1441905-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(Reducing the CC-list)

Hi,

On 22/11/2022 11:26, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v2 -> v3:
> - Move the uncertain release date to patch #3.
> v1 -> v2:
> - Correct wording for two x86 entries (clock frequency calibration
> and SPR & ADL support) following Jan's suggestion.
> - Add missing Arm entries from Oleksandr.
> - Add missing i.MX entry following Stefano's suggestion.
> ---
>   CHANGELOG.md | 32 ++++++++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index adbbb216fa..c593081aaf 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,16 +4,44 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> -## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
>   
>   ### Changed
>    - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
>      this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
> + - The "gnttab" option now has a new command line sub-option for disabling the
> +   GNTTABOP_transfer functionality.
> + - The x86 MCE command line option info is now updated.
>   
>   ### Added / support upgraded
> + - Out-of-tree builds for the hypervisor now supported.
> + - The project has officially adopted 4 directives and 24 rules of MISRA-C,
> +   added MISRA-C checker build integration, and defined how to document
> +   deviations.
>    - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
>      when they don't share page tables with the CPU (HAP / EPT / NPT).
> - - Support VIRT_SSBD feature for HVM guests on AMD.
> + - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
> +   SVM guests.

Did you really intend to write "SVM" rather than HVM? If yes, then to me 
"HVM guests on AMD" means the same as "SVM guests".

So I would suggest the following wording:

Support for VIRT_SSBD and MSR_SPEC_CTRL for HVM guests on AMD.


> + - Improved TSC, CPU, and APIC clock frequency calibration on x86.
> + - Add mwait-idle support for SPR and ADL on x86.
> + - Extend security support for hosts to 12 TiB of memory on x86.
> + - Add command line option to set cpuid parameters for dom0 at boot time on x86.
> + - Improved static configuration options on Arm.
> + - cpupools can be specified at boot using device tree on Arm.
> + - It is possible to use PV drivers with dom0less guests, allowing statically
> +   booted dom0less guests with PV devices.
> + - On Arm, p2m structures are now allocated out of a pool of memory set aside at
> +   domain creation.
> + - Improved mitigations against Spectre-BHB on Arm.
> + - Support VirtIO-MMIO devices in toolstack on Arm.

I would clarify that this is *only* creating the device-tree binding. 
IOW, there are no support for ACPI nor device-emulator (still in 
progress from Xen Project PoV).

> + - Allow setting the number of CPUs to activate at runtime from command line
> +   option on Arm.
> + - Grant-table support on Arm was improved and hardened by implementing
> +   "simplified M2P-like approach for the xenheap pages"
> + - Add Renesas R-Car Gen4 IPMMU-VMSA support on Arm.
> + - Add i.MX lpuart and i.MX8QM initial support on Arm.

I was under the impression that the code that was merged is enough to 
support the platform. Do you have any pointer where it says it is not 
sufficient?

> + - Improved toolstack build system.
> + - Add Xue - console over USB 3 Debug Capability.
>   
>   ### Removed / support downgraded
>    - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options

Cheers,

-- 
Julien Grall


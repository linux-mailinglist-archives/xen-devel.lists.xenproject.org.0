Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CF71091D
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539487.840410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27TA-000095-3C; Thu, 25 May 2023 09:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539487.840410; Thu, 25 May 2023 09:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27TA-00006K-0S; Thu, 25 May 2023 09:41:16 +0000
Received: by outflank-mailman (input) for mailman id 539487;
 Thu, 25 May 2023 09:41:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27T8-00006E-Qg
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:41:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27T5-0001aX-Np; Thu, 25 May 2023 09:41:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27T5-0007OO-G6; Thu, 25 May 2023 09:41:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=sgjQ2tuT1cOJuon2f8PXv6xy2y15LwN3xmnzMsCAyHU=; b=CN2BGRhZdluDa5cT7I4VbsmL3D
	NIz12dnYK0sHS4lWz48eRHhHqcvGyWw01enui0AccQdVC5Xg9H486BQc88yOWIVjFLhjHtOxog7Bh
	WA9p8xR274LHEBlhhvCFFYlSJ8aVEvB39Y5kwN8Gh8sxZWkk/dFC1UZzkHc2fiMvwFkI=;
Message-ID: <135b568d-abc4-0406-870f-a37a4c9081d1@xen.org>
Date: Thu, 25 May 2023 10:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-13-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230523074326.3035745-13-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2023 08:43, Luca Fancellu wrote:
> Arm now can use the "dom0=" Xen command line option and the support
> for guests running SVE instructions is added, put entries in the
> changelog.
> 
> Mention the "Tech Preview" status and add an entry in SUPPORT.md
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG
> ---
> Changes from v6:
>   - Add Henry's A-by to CHANGELOG
> Changes from v5:
>   - Add Tech Preview status and add entry in SUPPORT.md (Bertrand)
> Changes from v4:
>   - No changes
> Change from v3:
>   - new patch
> ---
>   CHANGELOG.md | 3 +++
>   SUPPORT.md   | 6 ++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5bfd3aa5c0d5..512b7bdc0fcb 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      cap toolstack provided values.
>    - Ignore VCPUOP_set_singleshot_timer's VCPU_SSHOTTMR_future flag. The only
>      known user doesn't use it properly, leading to in-guest breakage.
> + - The "dom0" option is now supported on Arm and "sve=" sub-option can be used
> +   to enable dom0 guest to use SVE/SVE2 instructions.
>   
>   ### Added
>    - On x86, support for features new in Intel Sapphire Rapids CPUs:
> @@ -20,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
>        wide impact of a guest misusing atomic instructions.
>    - xl/libxl can customize SMBIOS strings for HVM guests.
> + - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
>   
>   ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
>   
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6dbed9d5d029..e0fa2246807b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -99,6 +99,12 @@ Extension to the GICv3 interrupt controller to support MSI.
>   
>       Status: Experimental
>   
> +### ARM Scalable Vector Extension (SVE/SVE2)
> +
> +AArch64 guest can use Scalable Vector Extension (SVE/SVE2).

I think we should cover dom0 here as well. So s/guest/domain/.

Also, we don't use AArch64 in SUPPORT.MD so far. So please use 
ARM64/arm64. At some point we will need to do some renaming for consistency.

Cheers,

-- 
Julien Grall


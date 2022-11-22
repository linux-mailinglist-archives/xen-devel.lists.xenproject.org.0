Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B319E633C41
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447117.703011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSDj-0006aj-Rn; Tue, 22 Nov 2022 12:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447117.703011; Tue, 22 Nov 2022 12:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSDj-0006YX-P1; Tue, 22 Nov 2022 12:17:47 +0000
Received: by outflank-mailman (input) for mailman id 447117;
 Tue, 22 Nov 2022 12:17:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxSDi-0006YR-Oj
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:17:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSDg-0004ae-8n; Tue, 22 Nov 2022 12:17:44 +0000
Received: from [54.239.6.187] (helo=[192.168.24.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxSDg-0004bm-0P; Tue, 22 Nov 2022 12:17:44 +0000
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
	bh=m7X4+5x81nuYeGJGRTW7aMjAj7lNQXwx6lXlw9Kh1+w=; b=Du83Dw5BK0RF2EQt/h4M6xOGsP
	oeDRLCQZ2RtbKS6c48ZsPUCUrHsVPFjY90pu8iqasyifOFH+gL6y+Sly9GBOZJL6BCd3P5HEGWtxA
	Xat9I4/r39zCm2AbOTT1niYDYSetwc0mLBqlDrFqCv2F7cf/8OT0ORtKvwGinbuK6FCU=;
Message-ID: <91ccea91-5b4c-4348-0efa-725aca1d683a@xen.org>
Date: Tue, 22 Nov 2022 13:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/3] Changelog: Add __ro_after_init and CET
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Community Manager <community.manager@xenproject.org>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221122112623.1441905-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 22/11/2022 11:26, Henry Wang wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Your signed-off-by is missing.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> v2 -> v3:
> - Remove the "on x86" for __ro_after_init, as Arm also supports the
>    __ro_after_init. > v1 -> v2:
> - Include this patch in the series
> ---
>   CHANGELOG.md | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c593081aaf..5ef507a49c 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>   ### Added / support upgraded
>    - Out-of-tree builds for the hypervisor now supported.
> + - __ro_after_init support, for marking data as immutable after boot.
>    - The project has officially adopted 4 directives and 24 rules of MISRA-C,
>      added MISRA-C checker build integration, and defined how to document
>      deviations.
> @@ -23,6 +24,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
>      SVM guests.
>    - Improved TSC, CPU, and APIC clock frequency calibration on x86.
> + - Support for Xen using x86 Control Flow Enforcement technology for its own
> +   protection. Both Shadow Stacks (ROP protection) and Indirect Branch
> +   Tracking (COP/JOP protection).
>    - Add mwait-idle support for SPR and ADL on x86.
>    - Extend security support for hosts to 12 TiB of memory on x86.
>    - Add command line option to set cpuid parameters for dom0 at boot time on x86.

-- 
Julien Grall


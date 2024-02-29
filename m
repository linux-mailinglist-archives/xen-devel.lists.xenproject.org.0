Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5186C94A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687017.1069719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffdl-0007XC-13; Thu, 29 Feb 2024 12:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687017.1069719; Thu, 29 Feb 2024 12:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffdk-0007V1-TO; Thu, 29 Feb 2024 12:35:56 +0000
Received: by outflank-mailman (input) for mailman id 687017;
 Thu, 29 Feb 2024 12:35:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rffdj-0007Uv-GE
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:35:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rffdi-0003ot-PV; Thu, 29 Feb 2024 12:35:54 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rffdi-0001VP-HS; Thu, 29 Feb 2024 12:35:54 +0000
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
	bh=aUOhniEb0JI2MdNf7CXOXR/davOYKdGJYIkfnl88fVA=; b=PrR6BIG3V486vnKd2ge07ezX16
	2Z/1LSUC1dH2Mj4SzFAwZMA1lDPjQ9zG+pparGIIEzSga0hrM+mbFmBTTibrYa/6wg7oHWqi6iDC5
	Fp0d1bjqgnWJKoshO3SVczn0+KeFZCodyEjENUqQ1HyKRKLPMbC4rzbGhBrFO/ZssYeA=;
Message-ID: <d1b7a4fd-0754-45f7-8c58-db36f0e94cfc@xen.org>
Date: Thu, 29 Feb 2024 12:35:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: clarify support of booting 32-bit Xen on
 ARMv8
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240229121352.11264-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240229121352.11264-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 29/02/2024 12:13, Michal Orzel wrote:
> Since commit bd1001db0af1 ("xen/arm: arm32: Allow Xen to boot on
> unidentified CPUs"), it's been possible to boot 32-bit Xen on ARMv8A CPUs
> in AArch32 state (assuming HW supports EL2 execution in AArch32). Clarify
> the support statement and mark it as Tech Preview, as this use case is
> uncommon and hasn't really been tested/hardened.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   SUPPORT.md | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index a90d1108c9d9..acc61230bb5e 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -40,6 +40,7 @@ supported in this document.
>       Status: Supported
I would consider to use 'Status, Xen in aarch64 mode: Supported' and then...

>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
> +    Status, Xen in AArch32 mode: Tech Preview

... move this line closer. What do you think?

In any case, I am happy with the idea to clarify the SUPPORT state.

Acked-by: Julien Grall <jgrall@amazon.com>

>   
>   For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>   For the Cortex A77 r0p0 - r1p0, see Errata 1508412.

Cheers,

-- 
Julien Grall


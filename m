Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7069779AED
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 01:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582717.912612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbA3-0002dM-AF; Fri, 11 Aug 2023 23:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582717.912612; Fri, 11 Aug 2023 23:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbA3-0002b6-7b; Fri, 11 Aug 2023 23:03:15 +0000
Received: by outflank-mailman (input) for mailman id 582717;
 Fri, 11 Aug 2023 23:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUbA1-0002Xm-Cs
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 23:03:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e166c8d-389b-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 01:03:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8749E67AD3;
 Fri, 11 Aug 2023 23:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4286C433C7;
 Fri, 11 Aug 2023 23:03:08 +0000 (UTC)
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
X-Inumbo-ID: 3e166c8d-389b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691794990;
	bh=1jrbn+HRrqWYHuhY7ptjVuAIPibZEZD5Ng88PQVXtnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pj+51xtmsXIP70vF2oT403rzRXktQIWbZGdX9XVwf2wzGHq/zs+hnmU3ORmoX20y9
	 jflX5AvlczO90k5QcowzAASM75Pm6SiBdSKof84Hwhi3xp+sBUx0bCGS0X0f7hSYyJ
	 ia4eeRVcUOCm3XMniiY84rsYoSOTmsd4PWLOOwjTzAiw4DjTwj8mR8bGE2s7RLvTni
	 ZwygCwVtel9wBe+vTQB3ZV0tRBlnnro0IoPRZ6ydt5KbJIs+x7Pbweta4pKWeqgNAJ
	 ew1irvgqOHydgn3TNm94SjYTV8uLjDzqb23hA18JdZQAkY9gIX6SpN6A7EZyW1P+77
	 Cq8cxmDwRtHfg==
Date: Fri, 11 Aug 2023 16:03:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH 4/6] cpufreq: add missing include of header
 'pmstat.h'
In-Reply-To: <424e0523b9ec68eda5cf5b41a7bb6c980df2a52d.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111602400.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <424e0523b9ec68eda5cf5b41a7bb6c980df2a52d.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The missing header included by this patch provides a declaration for
> 'set_px_pminfo' that is visible prior to the definition in this file.
> This also resolves a violation of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: 452119c09420 ("x86 and ia64: move cpufreq notify code to commone place")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/cpufreq/cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> index 2321c7dd07b1..4482bbe53a1e 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -39,6 +39,7 @@
>  #include <xen/guest_access.h>
>  #include <xen/domain.h>
>  #include <xen/cpu.h>
> +#include <xen/pmstat.h>
>  #include <asm/io.h>
>  #include <asm/processor.h>
>  
> -- 
> 2.34.1
> 


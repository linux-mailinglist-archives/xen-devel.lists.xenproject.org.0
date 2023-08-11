Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96059779AEC
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 01:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582711.912603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb8v-00025l-24; Fri, 11 Aug 2023 23:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582711.912603; Fri, 11 Aug 2023 23:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb8u-00022o-Ut; Fri, 11 Aug 2023 23:02:04 +0000
Received: by outflank-mailman (input) for mailman id 582711;
 Fri, 11 Aug 2023 23:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUb8t-00022g-8D
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 23:02:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1404a534-389b-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 01:02:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7A50678E6;
 Fri, 11 Aug 2023 23:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EF7C433C7;
 Fri, 11 Aug 2023 23:01:57 +0000 (UTC)
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
X-Inumbo-ID: 1404a534-389b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691794919;
	bh=afg1u8bQZ6oSHyW5B/s7ALCDc90VAJUBG4PsSAip2AQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PsKU7WKIdWR/6aygSm8dxN19CmL0Q91omXe7wAKWKtwdmjWeMe8mwfSXZyI2csTC8
	 pXKTRzTfoEK3gONvKjX27wnl1PlixfwEbpc7I9upp/a5azYoPlPEu+BvoDqzmLXk+W
	 bX5MLTAqn18UoTz8dQJtKJ7AterqTuamHuTHdVrFrMk9uxHkCrjUhoa76A6gIMyhNq
	 GeU0ENTJHDvRBiqr9/vJpHoPPXzdfvYHX2NvXHsqr9Binikc/o1lTXMy17BYCY0EBb
	 uORzfdomJhsZAp4ZqJzx+O9lEFvjlAP8EKmm+zpxgI8ss6ujSz5FFd55jXX9WZnnCH
	 l/mrmq5xE6MrQ==
Date: Fri, 11 Aug 2023 16:01:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, tamas@tklengyel.com
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
In-Reply-To: <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111600190.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The missing header included by this patch provides declarations for
> the functions 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
> that are defined in the source file. This also resolves violations
> of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs and p2m_vm_event_fill_regs")
> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
> Fixes: 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
> ---
>  xen/arch/x86/vm_event.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> index 7027c08a926b..499b6b349d79 100644
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -20,6 +20,7 @@
>  
>  #include <xen/sched.h>
>  #include <xen/mem_access.h>
> +#include <xen/vm_event.h>
>  #include <asm/vm_event.h>
>  
>  /* Implicitly serialized by the domctl lock. */

I think the problem here is that ./arch/x86/include/asm/vm_event.h,
differently from ./arch/arm/include/asm/vm_event.h, doesn't #include
<xen/vm_event.h>


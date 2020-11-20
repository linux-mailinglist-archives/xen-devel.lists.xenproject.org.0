Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71A2BA9B7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32072.62988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg555-0007Ed-Hg; Fri, 20 Nov 2020 11:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32072.62988; Fri, 20 Nov 2020 11:59:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg555-0007EE-EC; Fri, 20 Nov 2020 11:59:59 +0000
Received: by outflank-mailman (input) for mailman id 32072;
 Fri, 20 Nov 2020 11:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kg553-0007E9-Br
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:59:57 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1821b8a-e64f-496c-9a5d-6d8fac097a72;
 Fri, 20 Nov 2020 11:59:54 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg54r-0004IG-6x; Fri, 20 Nov 2020 11:59:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61B3B307062;
 Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 41741200DF1A6; Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kg553-0007E9-Br
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:59:57 +0000
X-Inumbo-ID: e1821b8a-e64f-496c-9a5d-6d8fac097a72
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1821b8a-e64f-496c-9a5d-6d8fac097a72;
	Fri, 20 Nov 2020 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1IRDo4hBUd8j6ToyEOlhDczl8zQL0MZ1VcE/2Tj86V8=; b=lWgrloRSTuiGC5nk/4mHtAapdq
	VwjRJ9pV/B0T1qMIc8kscWWKsHYukR+oAG35rA52pWTnBDx5lko8Mg2mrSuBc9HXXKzFegH7oJGtp
	cwml6uFpFrBaQnbMehbVUamRufyImy2h3sQ01dQNaCyElJ40tKE7oY7DlyW91yiQQ3HL8MtyQUvbq
	My0bogQ20GyepoV5LrRr5SCuJg65biu6wXWYQzw+W+2vh2FY8g8nwuPKoIFrqvMl6beiZDTPBQfCH
	/pI3NOmklXlVteKMmE3U6Bp4Myx1Ojzlpwrt8x2Its6o0bCkEETXsUOqeydQ25qMtkGezRaNWRG5r
	37I6qZZA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg54r-0004IG-6x; Fri, 20 Nov 2020 11:59:45 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61B3B307062;
	Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 41741200DF1A6; Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Date: Fri, 20 Nov 2020 12:59:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
Message-ID: <20201120115943.GD3021@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-6-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
> +static __always_inline void arch_local_irq_restore(unsigned long flags)
> +{
> +	if (!arch_irqs_disabled_flags(flags))
> +		arch_local_irq_enable();
> +}

If someone were to write horrible code like:

	local_irq_disable();
	local_irq_save(flags);
	local_irq_enable();
	local_irq_restore(flags);

we'd be up some creek without a paddle... now I don't _think_ we have
genius code like that, but I'd feel saver if we can haz an assertion in
there somewhere...

Maybe something like:

#ifdef CONFIG_DEBUG_ENTRY // for lack of something saner
	WARN_ON_ONCE((arch_local_save_flags() ^ flags) & X86_EFLAGS_IF);
#endif

At the end?


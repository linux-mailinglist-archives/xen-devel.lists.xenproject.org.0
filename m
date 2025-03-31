Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67187A76F75
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 22:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932941.1334988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzLuX-0003Mz-W3; Mon, 31 Mar 2025 20:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932941.1334988; Mon, 31 Mar 2025 20:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzLuX-0003KY-Sm; Mon, 31 Mar 2025 20:39:09 +0000
Received: by outflank-mailman (input) for mailman id 932941;
 Mon, 31 Mar 2025 20:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCwA=WS=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1tzLuW-0003KR-4F
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 20:39:08 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30b8e6b6-0e70-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 22:39:06 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8E35D40E0219; 
 Mon, 31 Mar 2025 20:39:04 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hCZ-tIlyS7we; Mon, 31 Mar 2025 20:39:00 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A5FD540E0215;
 Mon, 31 Mar 2025 20:38:17 +0000 (UTC)
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
X-Inumbo-ID: 30b8e6b6-0e70-11f0-9ea7-5ba50f476ded
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743453540; bh=/G/aKVJEvh+BK78jU3R26aPND/GQH52x97woE6DFwhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8o5RaNF3wWAqRLnTqi/8tHi7xkMgpKiN8syntrCDDi2HsW0ZteAq1vHxftuVDtEM
	 cGldDTW3HAyOII383lFtqZ8kjPjJ4cSMMQfZiMs2i75K92ljQxK+B976L1H8wpzDw3
	 qBq06saJEtD83EHlZGDTbn2Zrkjdn/pwU8XSUo89HvNJ5HrM4jKMmVBY/vqWzOGZAs
	 YMW9m5mTnDMA2/H7Mc2kS6IohGQx9CIGf8UFDrLzc7i1zbdiFLx+LurM0lT0p+r++K
	 xEE/rCcJDi/j7xqbBgk5XLjKmFoXPTIY8xiaG6nY2M2HoVZUHdlffKXc5AXjOsjk3h
	 bXWm4T/N6Gzr7tBdHvVBTC9fABhXTGLNWEaMUMRerH2SrcucWBS7Q76YE/0gGMLqzP
	 CqnJj5s+MxEXI5KS+enCYMAbhBo+MWFpsW8Kykxy0tXn0BVbIXqfGDdwlFwzMacC8O
	 wk0mK5nC05VUHquiE5jhJgdoZX9HEiHuFW4xPMnCFYz2SfZ/QITV5Kj74oo3FyeTUi
	 lHFVgGPccdky6om9VHQjHwlCkorANK8owgOFCwgm7tlqdg27yNAxCe8hVJ6wqynD9T
	 GmKhQh3WsSnbfRxcHEl1wAa+FmSiCk8yZbj+eB5Ssk9ytAfGykALiBs591qReXfIrj
	 SZqE/RALHdS8Q8yfLauzWt/Q=
Date: Mon, 31 Mar 2025 22:38:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, linux-edac@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-ide@vger.kernel.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, jgross@suse.com, andrew.cooper3@citrix.com,
	peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
	pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
	luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com
Subject: Re: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form
 when available
Message-ID: <20250331203811.GCZ-r9M9Zrww_b7IjJ@fat_crate.local>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-11-xin@zytor.com>
 <Z-r6qxmk7niRssee@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-r6qxmk7niRssee@char.us.oracle.com>

On Mon, Mar 31, 2025 at 04:27:23PM -0400, Konrad Rzeszutek Wilk wrote:
> Is that the right path forward?
> 
> That is replace the MSR write to disable speculative execution with a
> non-serialized WRMSR? Doesn't that mean the WRMSRNS is speculative?

Ha, interesting question.

If the WRMSR is non-serializing, when do speculative things like indirect
branches and the like get *actually* cleared and can such a speculation window
be used to leak branch data even if IBRS is actually enabled for example...

Fun.

This change needs to be run by hw folks and I guess until then WRMSRNS should
not get anywhere near mitigation MSRs like SPEC_CTRL or PRED_CMD...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


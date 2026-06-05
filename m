Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id haGbKeQoI2pPjgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 21:52:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2864B0D0
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 21:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HJKk9HX+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1330026.1593867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaa2-0005or-Qk; Fri, 05 Jun 2026 19:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330026.1593867; Fri, 05 Jun 2026 19:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaa2-0005m3-Na; Fri, 05 Jun 2026 19:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1330026;
 Fri, 05 Jun 2026 19:51:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wVaa1-0005lx-14
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 19:51:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVaa0-005jEd-73
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 21:51:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a2328cf-5cb7-0a2a0a5109dd-0a2a4501912c-0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:51:43 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a2328ce-c1f2-0a2a45010019-aceafc1fb3f2-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:51:43 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92DF3444D2;
 Fri,  5 Jun 2026 19:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AE31F00893;
 Fri,  5 Jun 2026 19:51:40 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689101;
	bh=/4/R21/fqtDVS3dMxk8YUcZsiYIZNFflJGsvUsdqCpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HJKk9HX+g5UPbatALcVIkf0hR4ph+0Wx8iYP9GEhI83XdOxXt7ZFz/GyAcdNSqC3b
	 59tx5s2p8e97ACe09fjCrUGDsFH0mUGYy6hjREF82KGE5tE3NRoM2KruI4GtHlI4zf
	 9JzxtgHFG+ngZyRIRnCNTlILcrBvBhmuDuMhpklDDYDJvC7XRvgVA6xfP46bUmOz7Q
	 DvD8utVSK+xnYsPP5vFZO758kEbbdtewrTCb2MLyAHXLoJqapxPvfVQRwAWSsiuX7l
	 5hn4/v5jowzGbNQzjCTmK+bZEv5FiaP+Dh9Aalw1jf8a8vDBqU3s5PlzLhytckiQry
	 oZh4Oqjmh3P1Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
 <longli@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, Alexey
 Makhalov <alexey.makhalov@broadcom.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, David
 Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if
 its exact timing is known
In-Reply-To: <aiMPxl5vkvJDldi9@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-2-seanjc@google.com> <87fr315fq9.ffs@fw13>
 <aiMPxl5vkvJDldi9@google.com>
Date: Fri, 05 Jun 2026 21:51:38 +0200
Message-ID: <87a4t86a0l.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-d62444/1780689103-AD5AFFF4-E14302E1/0/0
X-purgate-type: clean
X-purgate-size: 2124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,kernel.org,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,outlook.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,fw13:mid];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FC2864B0D0

On Fri, Jun 05 2026 at 11:04, Sean Christopherson wrote:
> On Fri, Jun 05, 2026, Thomas Gleixner wrote:
>> On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
>> > Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
>> > frequency.
>> 
>> That's misleading because fixed frequency means that the frequency does
>> not change, i.e. X86_FEATURE_CONSTANT_TSC is set. But
>> X86_FEATURE_CONSTANT_TSC does not imply that the frequency can be read
>> from CPUID/MSRs.
>
> Sorry, "if the TSC runs at a known, fixed frequency" would be a better way to
> phrase this.
>
>> > In practice, this is likely one big nop, as re-calibration is
>> > used only for SMP=n kernels, and only for hardware that is 20+ years old,
>> > i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.
>> 
>> recalibrate_cpu_khz() is only invoked from Intel P4 and AMD K7 CPU
>> frequency drivers, which means that's absolutely not interesting and
>> neither X86_FEATURE_CONSTANT_TSC nor X86_FEATURE_TSC_KNOWN_FREQ can be
>> set on those systems.
>
> It _shouldn't_ be set on those systems, but in the world of virtualization it's
> not completely impossible.
>
>> IOW, this patch is pointless voodoo ware.
>
> Would y'all be opposed to adding a WARN?  I don't actually care about P4 or K7
> CPUs, but without any reference to X86_FEATURE_TSC_KNOWN_FREQ in
> recalibrate_cpu_khz(), the code _looks_ wrong, and so is very confusing for
> readers that don't already know that in practice, it's limited to ancient CPUs.
>
> In other words, the point is to document expectations and mutual exclusion, not
> to "fix" anything.

Fair enough.

So yes, having a check there for actually X86_FEATURE_CONSTANT_TSC
(X86_FEATURE_CONSTANT_TSC is not interesting) and emitting a warning and
returning early is the right thing to do there.

But we also should have a check in the TSC init code somewhere which
validates that X86_FEATURE_CONSTANT_TSC is set when
X86_FEATURE_TSC_KNOWN_FREQ is set. X86_FEATURE_TSC_KNOWN_FREQ is useless
w/o X86_FEATURE_CONSTANT_TSC.

Thanks,

        tglx




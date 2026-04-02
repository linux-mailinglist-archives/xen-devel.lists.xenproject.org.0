Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MROMj4kzmnElAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:09:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A17385A46
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271235.1559465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8D6f-0001Ew-Eu; Thu, 02 Apr 2026 08:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271235.1559465; Thu, 02 Apr 2026 08:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8D6f-0001C5-BS; Thu, 02 Apr 2026 08:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1271235;
 Thu, 02 Apr 2026 08:08:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8D6e-0001Bz-JF
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:08:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8D6c-004BUV-Cn
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:08:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce240e-5cb7-0a2a0a5109dd-0a2a4503d084-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:08:47 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce240e-02b3-0a2a45030019-67a8ac97d77b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:08:47 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id C9C79EC01BE;
 Thu,  2 Apr 2026 04:08:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 02 Apr 2026 04:08:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 04:08:44 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775117325;
	 x=1775203725; bh=OKUvNuiD6UMaS5rdnTjVP4+tYJV//TVFbwC5VSDpJbc=; b=
	BEKqK0zadc9xebfCjZMGyLEeKgo9QmqhT8hTsAdJKXh0Xt3R2zHfLmDvUunXd/dn
	QRBCBQ1zK7SQ5f/NpamRkZHtTHRVlFUbmCtrhzfexXXzHnGVr5F3C+xLQQ3XPaYc
	2eHS/NjlaqHAOkQq7bvh9BuyDtY2Uvv85kBIvoYpUemDE9NzF4C+bZSSC+9ZeVIo
	7Vn7avWhV/ASpgaCuKVwkeSeDV+pB2rM9Dd7Ziku39HyvqjOGZBQidf6OXXTv7yw
	D/u3wWfwOIk1suX/SDxDYaeDF2zarrmzJ2ilCEzXur/fSWp43pCF7y1RgVvNx+v/
	K2GDleYwIIoi206dKTs+Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775117325; x=1775203725; bh=OKUvNuiD6UMaS5rdnTjVP4+tYJV//TVFbwC
	5VSDpJbc=; b=RvgsNUkIkCZ9Gm88zMESiDMeyYsbrQGywgG8qe8l8UND0BiJHQf
	+v/bzO0JGPzviWXSpbFRnrBSk7VUm/GCpLlr6gKIv2BKXp6W2B31Myl0cl/V//ON
	aO+4xbT6o5Uaxb+714qgELBoxLMsIXpPsjejTXWOQNPYlfxrEtniJ3vmKvDjxHLG
	qG2M4rOjWrcGCadkd9vEhjg0I9QuF8WflsPmcZMmQhVt2fC4m2q/xpgMkI40cdl+
	doA4cgC8JhyDYz2l9zjhq7WHVkOdqoypXSmU0fDJ8BoDBKGHf5sv5aR6sidhgI1T
	Pso6UDMj14ap6hlhzmSN3h54sCLFhCQ/iOw==
X-ME-Sender: <xms:DSTOaQnq7zqXFG4CeLhR67bEB2pVzc_gcNaft1jdIv5cmwhl1w9MqQ>
    <xme:DSTOaV1bSgsl-YfjVv78G3unr3sKYRyn-5dDbL016CgopRPojpKvRmBcLzgLTBTsY
    OJRa_ypZw5kSKsGiDxt2TDg8HdyC5I_LhA6p5gPPXNVqsEy3A>
X-ME-Received: <xmr:DSTOacRqw7BxfY-ddaAFhbS4OOe9YZWi41YQ7-THABk2wjrovSbfJok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlh
    eslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:DSTOaXvWqmEta84K4IEoCveXYwH6uH958JaRwvFdm4l_MhN8-mMF7Q>
    <xmx:DSTOaRZSml88k1vydHGYey45ZnNQBfozhHiDkLDK4-0zvhqmeDbiEQ>
    <xmx:DSTOacuiVLgViT6VScxBxjweE9k7kzMLscJTzg9MuhZFTC94finsuQ>
    <xmx:DSTOaTFlBH9qXk_E-CpYp2tsRpktkkV7ynV3lOOX5MgH1-g9H2cgDg>
    <xmx:DSTOaS4A3NJQJkgGQlXUYoxNlLEFh3oA3NuOQA1a79A76t0Suussfzhs>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 10:08:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac4kCq87SQSc6ddV@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhkLNO4Ucmh0/XDZ"
Content-Disposition: inline
In-Reply-To: <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
X-purgate-ID: tlsNG-33051d/1775117327-4076BC9A-8DFE98A3/0/0
X-purgate-type: clean
X-purgate-size: 18585
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 19A17385A46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bhkLNO4Ucmh0/XDZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Apr 2026 10:08:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Thu, Apr 02, 2026 at 09:01:12AM +0200, Jan Beulich wrote:
> On 02.04.2026 01:17, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Apr 01, 2026 at 10:52:37AM +0200, Jan Beulich wrote:
> >> On 01.04.2026 09:14, Jan Beulich wrote:
> >>> On 27.03.2026 11:19, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> I noticed that on some systems, there are a lot of IOMMU faults after
> >>>> S3. I can see it also on a laptop with MTL, but it affects also the =
ADL
> >>>> gitlab runner:
> >>>>
> >>>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
> >>>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000=
:00:1e.6] fault addr 0
> >>>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in cont=
ext entry is clear
> >>>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000=
:00:1e.6] fault addr 0
> >>>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in cont=
ext entry is clear
> >>>>
> >>>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
> >>>>
> >>>> The issue is present only on staging, not staging-4.21.
> >>>>
> >>>> Bisect says:
> >>>>
> >>>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
> >>>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
> >>>> Author: Jan Beulich <jbeulich@suse.com>
> >>>> Date:   Thu Jan 22 14:13:35 2026 +0100
> >>>>
> >>>>     x86/HPET: drop .set_affinity hook
> >>>
> >>> Looking into this, I find several things I can't quite understand (ye=
t).
> >>> First there is
> >>>
> >>> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
> >>>
> >>> which looks to only affect clocksource selection, but not use as
> >>> broadcast source for CPU-idle management. (This may be an independent
> >>> issue.)
> >>>
> >>> Then there is
> >>>
> >>> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
> >>>
> >>> which should only occur on ARAT-incapable systems. That should only be
> >>> older hardware. (On my much older Skylake I don't see this line, for
> >>> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
> >>> is purely featureset based, and hence doesn't expose info about that
> >>> leaf. The leaf also isn't exposed to domains, so CPUID output in Dom0
> >>> isn't useful to look at either. It would need to be CPUID output on a
> >>> bare metal kernel.
> >>>
> >>> Further I suspect the fingered commit may only have uncovered an issue
> >>> elsewhere. I don't think we clear any context table entries during
> >>> suspend or resume. Hence in
> >>>
> >>> (XEN) [   20.554813] [VT-D]DMAR:[DMA Write] Request device [0000:00:1=
e.6] fault addr 0
> >>> (XEN) [   20.554819] [VT-D]DMAR: reason 02 - Present bit in context e=
ntry is clear
> >>>
> >>> the latter message is confusing me.
> >>>
> >>> The fault address being zero may, otoh, be a hint of hpet_msi_write()
> >>> never having run post-resume. Which may be the connection to the
> >>> dropping of hpet_msi_set_affinity(), as that did call that function.
> >>
> >> There clearly is an issue with the handling of the max_cstate variable,
> >> but I expect you don't use xenpm to limit usable C-states (there clear=
ly
> >> is no respective command line option in the log you referenced)?
> >=20
> > No, I don't think so.
> >=20
> >> From what the log has, I conclude hpet_broadcast_resume() is called.
> >=20
> > I don't think so... I applied changes as attached and got this on
> > resume:
> >=20
> > (XEN) [   69.486120] Enabling non-boot CPUs  ...
> > (XEN) [   69.486404] mwait-idle: state C1 is disabled
> > (XEN) [   69.587869] mwait-idle: state C1 is disabled
> > (XEN) [   69.588008] mwait-idle: state C1 is disabled
> > (XEN) [   69.689438] mwait-idle: state C1 is disabled
> > (XEN) [   69.689608] mwait-idle: state C1 is disabled
> > (XEN) [   69.791066] mwait-idle: state C1 is disabled
> > (XEN) [   69.791334] mwait-idle: state C1 is disabled
> > (XEN) [   69.892938] mwait-idle: state C1 is disabled
> > (XEN) [   69.893209] mwait-idle: state C1 is disabled
> > (XEN) [   69.994890] mwait-idle: state C1 is disabled
> > (XEN) [   69.995096] mwait-idle: state C1 is disabled
> > (XEN) [   70.096638] mwait-idle: state C1 is disabled
> > (XEN) [   70.096915] mwait-idle: state C1 is disabled
> > (XEN) [   70.097093] mwait-idle: state C1 is disabled
> > (XEN) [   70.097272] mwait-idle: state C1 is disabled
> > (XEN) [   70.203357] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.=
6] fault addr 0
> > (XEN) [   70.203363] [VT-D]DMAR: reason 02 - Present bit in context ent=
ry is clear
>=20
> That was on the serial console or from xl dmesg? I ask because console_re=
sume()
> runs after time_resume(), so nothing appearing on the serial console woul=
d be
> expected (I think).

Ah, right, that's why I don't see my messages.
The xl dmesg output (from MTL this time):

    (XEN) [  123.477511] Entering ACPI S3 state.
    (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has=
_apic: 1
    (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cs=
tate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
    (XEN) [18446743903.571866] _disable_pit_irq:2662: init: 0
    (XEN) [18446743903.571877] hpet_broadcast_resume:661: hpet_events: ffff=
83046bc1f080
    (XEN) [18446743903.572020] hpet_broadcast_resume:672: num_hpets_used: 8
    (XEN) [18446743903.572029] hpet_broadcast_resume:690: cfg: 0x1
    (XEN) [18446743903.572040] hpet_broadcast_resume:695: i:0, hpet_events[=
i].msi.irq: 122, hpet_events[i].flags: 0
    (XEN) [18446743903.572081] hpet_broadcast_resume:706: i:0, cfg: 0xc134
    (XEN) [18446743903.572089] hpet_broadcast_resume:695: i:1, hpet_events[=
i].msi.irq: 123, hpet_events[i].flags: 0
    (XEN) [18446743903.572123] hpet_broadcast_resume:706: i:1, cfg: 0xc104
    (XEN) [18446743903.572132] hpet_broadcast_resume:695: i:2, hpet_events[=
i].msi.irq: 124, hpet_events[i].flags: 0
    (XEN) [18446743903.572167] hpet_broadcast_resume:706: i:2, cfg: 0xc104
    (XEN) [18446743903.572175] hpet_broadcast_resume:695: i:3, hpet_events[=
i].msi.irq: 125, hpet_events[i].flags: 0
    (XEN) [18446743903.572210] hpet_broadcast_resume:706: i:3, cfg: 0xc104
    (XEN) [18446743903.572218] hpet_broadcast_resume:695: i:4, hpet_events[=
i].msi.irq: 126, hpet_events[i].flags: 0
    (XEN) [18446743903.572252] hpet_broadcast_resume:706: i:4, cfg: 0xc104
    (XEN) [18446743903.572261] hpet_broadcast_resume:695: i:5, hpet_events[=
i].msi.irq: 127, hpet_events[i].flags: 0
    (XEN) [18446743903.572294] hpet_broadcast_resume:706: i:5, cfg: 0xc104
    (XEN) [18446743903.572303] hpet_broadcast_resume:695: i:6, hpet_events[=
i].msi.irq: 128, hpet_events[i].flags: 0
    (XEN) [18446743903.572338] hpet_broadcast_resume:706: i:6, cfg: 0xc104
    (XEN) [18446743903.572347] hpet_broadcast_resume:695: i:7, hpet_events[=
i].msi.irq: 129, hpet_events[i].flags: 0
    (XEN) [18446743903.572382] hpet_broadcast_resume:706: i:7, cfg: 0xc104

And the xen-cpuid -p output from this system:

    Xen reports there are maximum 120 leaves and 2 MSRs
    Raw policy: 48 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 00000023:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:20800800:77fafbff:bfebfbff
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000005:ffffffff -> 00000040:00000040:00000003:11112020
      00000006:ffffffff -> 00dfcff7:00000002:00000409:00040003
      00000007:00000000 -> 00000002:239c27eb:994007ac:fc18c410
      00000007:00000001 -> 40400910:00000001:00000000:00040000
      00000007:00000002 -> 00000000:00000000:00000000:0000003f
      0000000a:ffffffff -> 07300805:00000000:00000007:00008603
      0000000b:00000000 -> 00000001:00000002:00000100:00000020
      0000000b:00000001 -> 00000007:00000016:00000201:00000020
      0000000d:00000000 -> 00000207:00000000:00000a88:00000000
      0000000d:00000001 -> 0000000f:00000000:00019900:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      0000000d:00000008 -> 00000080:00000000:00000001:00000000
      0000000d:00000009 -> 00000008:00000a80:00000000:00000000
      0000000d:0000000b -> 00000010:00000000:00000001:00000000
      0000000d:0000000c -> 00000018:00000000:00000001:00000000
      0000000d:0000000f -> 00000328:00000000:00000001:00000000
      0000000d:00000010 -> 00000008:00000000:00000001:00000000
      80000000:ffffffff -> 80000008:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000121:2c100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000007:ffffffff -> 00000000:00000000:00000000:00000100
      80000008:ffffffff -> 0000302e:00000000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 000000000d89fd6b
    Host policy: 41 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:20800800:77fafbff:bfebfbff
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000005:ffffffff -> 00000040:00000040:00000003:11112020
      00000006:ffffffff -> 00dfcff7:00000002:00000409:00040003
      00000007:00000000 -> 00000002:239c27eb:994007ac:fc18c410
      00000007:00000001 -> 40000910:00000001:00000000:00040000
      00000007:00000002 -> 00000000:00000000:00000000:0000003f
      0000000b:00000000 -> 00000001:00000002:00000100:00000020
      0000000b:00000001 -> 00000007:00000016:00000201:00000020
      0000000d:00000000 -> 00000207:00000000:00000a88:00000000
      0000000d:00000001 -> 0000000f:00000000:00000000:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      0000000d:00000009 -> 00000008:00000a80:00000000:00000000
      80000000:ffffffff -> 80000008:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000121:2c100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000007:ffffffff -> 00000000:00000000:00000000:00000100
      80000008:ffffffff -> 0000302e:00000000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 400000000d89fd6b
    PV Max policy: 58 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:00800800:f6f83203:1fc9cbf5
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000007:00000000 -> 00000002:218c0329:18400700:ac004410
      00000007:00000001 -> 00000810:00000000:00000000:00000000
      00000007:00000002 -> 00000000:00000000:00000000:00000021
      0000000d:00000000 -> 00000007:00000000:00000340:00000000
      0000000d:00000001 -> 00000007:00000000:00000000:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      80000000:ffffffff -> 80000021:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000123:28100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000007:ffffffff -> 00000000:00000000:00000000:00000100
      80000008:ffffffff -> 0000302e:00001000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 400000001d0ae167
    HVM Max policy: 65 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:00800800:f7fa3223:1fcbfbff
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000007:00000000 -> 00000002:219c07ab:9840070c:bc004410
      00000007:00000001 -> 00000810:00000000:00000000:00000000
      00000007:00000002 -> 00000000:00000000:00000000:00000037
      0000000d:00000000 -> 00000207:00000000:00000a88:00000000
      0000000d:00000001 -> 0000000f:00000000:00000000:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      0000000d:00000009 -> 00000008:00000a80:00000000:00000000
      80000000:ffffffff -> 80000021:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000123:2c100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000007:ffffffff -> 00000000:00000000:00000000:00000100
      80000008:ffffffff -> 0000302e:00101000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 400000001d0ae167
    PV Default policy: 33 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:00800800:f6d83203:1fc9cbf5
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000007:00000000 -> 00000002:218c0329:00400700:ac004410
      00000007:00000001 -> 00000810:00000000:00000000:00000000
      00000007:00000002 -> 00000000:00000000:00000000:00000021
      0000000d:00000000 -> 00000007:00000000:00000340:00000000
      0000000d:00000001 -> 00000007:00000000:00000000:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      80000000:ffffffff -> 80000008:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000121:28100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000008:ffffffff -> 0000302e:00001000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 400000000d08e163
    HVM Default policy: 40 leaves, 2 MSRs
     CPUID:
      leaf     subleaf  -> eax      ebx      ecx      edx    =20
      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
      00000001:ffffffff -> 000a06a4:00800800:f7fa3203:1fcbfbff
      00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
      00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
      00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
      00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
      00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
      00000007:00000000 -> 00000002:219c07ab:8040070c:bc004410
      00000007:00000001 -> 00000810:00000000:00000000:00000000
      00000007:00000002 -> 00000000:00000000:00000000:00000037
      0000000d:00000000 -> 00000207:00000000:00000a88:00000000
      0000000d:00000001 -> 0000000f:00000000:00000000:00000000
      0000000d:00000002 -> 00000100:00000240:00000000:00000000
      0000000d:00000009 -> 00000008:00000a80:00000000:00000000
      80000000:ffffffff -> 80000008:00000000:00000000:00000000
      80000001:ffffffff -> 00000000:00000000:00000121:2c100800
      80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
      80000003:ffffffff -> 6c552029:20617274:35312037:00004835
      80000006:ffffffff -> 00000000:00000000:08007040:00000000
      80000008:ffffffff -> 0000302e:00101000:00000000:00000000
     MSRs:
      index    -> value          =20
      000000ce -> 0000000080000000
      0000010a -> 400000000d08e163


> Without hpet_broadcast_resume() running, I don't think I could explain ho=
w the
> channels (and their FSB interrupts) would get enabled.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bhkLNO4Ucmh0/XDZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOJAoACgkQ24/THMrX
1ywgjQf+MvVujC4YpqJQhwpwSXfO9xSRDGd9Yc/rGdLx/v4BnFrZMnG90owIhCQt
63wMOX39c+HddLxhxCFBjCe6XS6T+b0kg+piIS2O5+4VPsa+p4maTa/0OymwcOWd
l7+fKouKpOB/WvBQBV2PRW3xIr5xG5DT8GjuoTg9wNO43u5NMppiiAmH978klGrI
+LIRaK/5Wzrqu27LVVhxWVt+W9gdWiGPQBSgiykxQIaOPMGPsZSO+cohZkPouDCU
TIK5IkJR/L1pPeeuME0B71UpLBfHCOdmBjLduhY7/ICwy+bVOW0KgM4l/Ur9nvOS
BACW9R5QI1sNgx3iiuwAtbs9k/cSFQ==
=HSRk
-----END PGP SIGNATURE-----

--bhkLNO4Ucmh0/XDZ--


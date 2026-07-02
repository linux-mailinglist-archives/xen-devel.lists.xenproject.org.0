Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ctxoE+SHRmrXXwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793016F99C5
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Mynx6GD6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1352104.1609025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJcW-0006ol-6l; Thu, 02 Jul 2026 15:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352104.1609025; Thu, 02 Jul 2026 15:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJcW-0006mh-3n; Thu, 02 Jul 2026 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 1352104;
 Thu, 02 Jul 2026 15:46:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wfJcU-0006mb-LN
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:46:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfJcU-00EUhV-2M
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:46:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4687c2-bab6-0a2a0a5309dd-0a2a4506ec10-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:46:29 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4687d4-08de-0a2a45060019-ac6904feedd0-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:46:29 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EBA4601EE;
 Thu,  2 Jul 2026 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EC61F000E9;
 Thu,  2 Jul 2026 15:46:11 +0000 (UTC)
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
	s=k20260515; t=1783007187;
	bh=jvE9wSqWBUCbGMsJG9svgBUezevNvrm1MrcHHSCChso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mynx6GD6LkebsGmUnF9MjOYGoc5t/kjVRBAa3y4hDMiI7/vl1tQdkpNYaMYBglDKt
	 PpjOhV7WkyGWbA6148JfY40EHSUewPFem4EcHLSNtrDL52P+m6uRZFhhXV+p8drDP5
	 krlXhtnXXcRAzWJ2KFYq3Hh8rhTgMNWOvfDO5ubcScHxjko5fhA5/oYXfBSBTm3FYZ
	 q91+d//PbttUXOxvDyYYUNz2FFsT7LJ6pIAF99pcS/rpWlpmF6qsZCGqK6q0R7Cu6u
	 A7jMMvK5AtByO3p0pYtd9gulxJxBI42o3AQ7j7VXEvArqPbpGQYUH4EuymRAwVZamK
	 6IrFtw9w61Ysg==
Date: Thu, 2 Jul 2026 16:46:04 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org, 
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org, lyude@redhat.com, 
	dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org, 
	mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
	dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com, 
	thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, hughd@google.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de, 
	kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags in
 core mm
Message-ID: <akaGxiTaJreEQn8T@lucifer>
References: <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org>
 <20260702131233.59026-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702131233.59026-1-lance.yang@linux.dev>
X-purgate-ID: tlsNG-16d1c6/1783007189-C4D3568D-248080DD/0/0
X-purgate-type: clean
X-purgate-size: 2543
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lance.yang@linux.dev,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@z
 eniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 793016F99C5

On Thu, Jul 02, 2026 at 09:12:33PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:33PM +0100, Lorenzo Stoakes wrote:
> >Update various uses of legacy flags in vma.c and mmap.c to the new
> >vma_flags_t type, updating comments alongside them to be consistent.
> >
> >Also update __install_special_mapping() to rearrange things slightly to
> >accommodate the changes.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> [...]
> >diff --git a/mm/vma.c b/mm/vma.c
> >index b81c05e67a61..ab2ef0f04420 100644
> >--- a/mm/vma.c
> >+++ b/mm/vma.c
> >@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mapping(
> > 	vm_flags_t vm_flags, void *priv,
> > 	const struct vm_operations_struct *ops)
> > {
> >-	int ret;
> >+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
> > 	struct vm_area_struct *vma;
> >+	int ret;
> >
> > 	vma = vm_area_alloc(mm);
> >-	if (unlikely(vma == NULL))
> >+	if (unlikely(!vma))
> > 		return ERR_PTR(-ENOMEM);
> >
> >-	vma_set_range(vma, addr, addr + len, 0);
> >-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
> >+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
> >+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
> > 	if (pgtable_supports_soft_dirty())
> >-		vm_flags |= VM_SOFTDIRTY;
> >-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> >+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
> >+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
> >+	vma->flags = vma_flags;
>
> Maybe worth a vma_flags_init() helper here to mirror vm_flags_init()?
> With this open-coded, we lose the soft-dirty WARN_ON_ONCE sanity check.
>
> Might be nicer to keep that check in one place ;)

I really hate all the VMA flag accessors, they conflate things horribly - we
should be explicitly taking VMA write locks when we need to (and often killable
ones actually) not assuming that a VMA flags accessor does (they should at most
assert).

This case is even more terribly egregious - you are setting flags at an
arbitrary time, why are we asserting something about softdirty?

You may update them as part of initialisation, maybe not. It's far from a
guarantee and feels like a lazy place to put it.

BUT obviously it's an oversight not to open code that here, so I'll update the
patch to do that!

I want VMA flags to be a clean stateless thing, other than the flags
themselves. Implicit, unrelated, asserts or lock acquisitions in general should
be done separately IMO.

>
> [...]

Thanks, Lorenzo


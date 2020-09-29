Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8D27CD5A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169.387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEyw-00010D-0u; Tue, 29 Sep 2020 12:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169.387; Tue, 29 Sep 2020 12:43:45 +0000
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
	id 1kNEyv-0000zo-Tc; Tue, 29 Sep 2020 12:43:45 +0000
Received: by outflank-mailman (input) for mailman id 169;
 Tue, 29 Sep 2020 12:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIoM=DG=linux.intel.com=joonas.lahtinen@srs-us1.protection.inumbo.net>)
 id 1kNEyu-0000zi-9t
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:43:44 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 086b084a-51ab-450b-991c-a7c3d0e30765;
 Tue, 29 Sep 2020 12:43:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 05:43:39 -0700
Received: from akoski1-mobl7.ger.corp.intel.com (HELO localhost)
 ([10.252.11.87])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 05:43:33 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oIoM=DG=linux.intel.com=joonas.lahtinen@srs-us1.protection.inumbo.net>)
	id 1kNEyu-0000zi-9t
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:43:44 +0000
X-Inumbo-ID: 086b084a-51ab-450b-991c-a7c3d0e30765
Received: from mga07.intel.com (unknown [134.134.136.100])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 086b084a-51ab-450b-991c-a7c3d0e30765;
	Tue, 29 Sep 2020 12:43:42 +0000 (UTC)
IronPort-SDR: 2id/YCY9LYf+3idGvT/if1s4dEpwDM7vF3klE7RHVeKWf/AqiMT/xM0eYmw3NEgEOfa2/TM05y
 XEYAV82fjH6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226326038"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="226326038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 05:43:39 -0700
IronPort-SDR: 7NX3Uj2736sJSbglPVjhaPntDnQdsledhJmbVZ7ccHlY/O7oFpamoLrlz94VPls0ygLxWO+Opt
 LlneFgXipAmw==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="457266308"
Received: from akoski1-mobl7.ger.corp.intel.com (HELO localhost) ([10.252.11.87])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 05:43:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200928123741.GA4999@lst.de>
References: <20200924135853.875294-1-hch@lst.de> <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org> <20200926062959.GA3427@lst.de> <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com> <20200928123741.GA4999@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>, Matthew Wilcox <willy@infradead.org>, Nitin Gupta <ngupta@vflare.org>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove alloc_vm_area v2
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 29 Sep 2020 15:43:30 +0300

Quoting Christoph Hellwig (2020-09-28 15:37:41)
> On Mon, Sep 28, 2020 at 01:13:38PM +0300, Joonas Lahtinen wrote:
> > I think we have a gap that after splitting the drm-intel-next pull requ=
ests into
> > two the drm-intel/for-linux-next branch is now missing material from
> > drm-intel/drm-intel-gt-next.
> >=20
> > I think a simple course of action might be to start including drm-intel=
-gt-next
> > in linux-next, which would mean that we should update DIM tooling to add
> > extra branch "drm-intel/gt-for-linux-next" or so.
> >=20
> > Which specific patches are missing in this case?
>=20
> The two dependencies required by my series not in mainline are:
>=20
>     drm/i915/gem: Avoid implicit vmap for highmem on x86-32
>     drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not suppo=
rted
>=20
> so it has to be one or both of those.

Hmm, those are both committed after our last -next pull request, so they
would normally only target next merge window. drm-next closes the merge
window around -rc5 already.

But, in this specific case those are both Fixes: patches with Cc: stable,
so they should be pulled into drm-intel-next-fixes PR.

Rodrigo, can you cherry-pick those patches to -next-fixes that you send
to Dave?

Regards, Joonas


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A336C76A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118548.224727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbODg-0001vM-EO; Tue, 27 Apr 2021 13:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118548.224727; Tue, 27 Apr 2021 13:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbODg-0001ux-Az; Tue, 27 Apr 2021 13:57:44 +0000
Received: by outflank-mailman (input) for mailman id 118548;
 Tue, 27 Apr 2021 13:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbODe-0001us-IT
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:57:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc7b1868-b9dc-464b-85a4-1ebf76e5a6a4;
 Tue, 27 Apr 2021 13:57:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 219D7B1AC;
 Tue, 27 Apr 2021 13:57:40 +0000 (UTC)
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
X-Inumbo-ID: dc7b1868-b9dc-464b-85a4-1ebf76e5a6a4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619531860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ziu448iwVTiu7zaHwT9INHVOOxgt9JVGpigiLE7MrRk=;
	b=jjHNKuNR7NxOuAmN3xbMj0VPV2yztQFMmCmPeUyV+Bjr4zRA1SoWbQnl8SX1hlL4CxIHCK
	fNE+O2jS6wRtP1Y9igFl1+7lUXD3PpYyJONRakmDqVfP0aUbO4MtCFwgLdA97IzdY9kVpI
	KumZKZGENvfKW6K+asyVvZreAEkqgAo=
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
Date: Tue, 27 Apr 2021 15:57:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426153741.26904-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 17:37, Luca Fancellu wrote:
> --- a/docs/hypercall-interfaces/arm64.rst
> +++ b/docs/hypercall-interfaces/arm64.rst
> @@ -8,6 +8,7 @@ Starting points
>  .. toctree::
>     :maxdepth: 2
>  
> +   arm64/grant_tables
>  
>  
>  Functions
> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hypercall-interfaces/arm64/grant_tables.rst
> new file mode 100644
> index 0000000000..8955ec5812
> --- /dev/null
> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Grant Tables
> +============
> +
> +.. doxygengroup:: grant_table

I continue to object to this giving the impression that grant tables
are something Arm64 specific.

> @@ -66,6 +67,7 @@
>   *     compiler barrier will still be required.
>   *
>   * Introducing a valid entry into the grant table:
> + * @code
>   *  1. Write ent->domid.
>   *  2. Write ent->frame:
>   *      GTF_permit_access:   Frame to which access is permitted.
> @@ -73,20 +75,25 @@
>   *                           frame, or zero if none.
>   *  3. Write memory barrier (WMB).
>   *  4. Write ent->flags, inc. valid type.
> + * @endcode
>   *
>   * Invalidating an unused GTF_permit_access entry:
> + * @code
>   *  1. flags = ent->flags.
>   *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>   *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>   *  NB. No need for WMB as reuse of entry is control-dependent on success of
>   *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
> + * @endcode
>   *
>   * Invalidating an in-use GTF_permit_access entry:
> + *
>   *  This cannot be done directly. Request assistance from the domain controller
>   *  which can set a timeout on the use of a grant entry and take necessary
>   *  action. (NB. This is not yet implemented!).
>   *
>   * Invalidating an unused GTF_accept_transfer entry:
> + * @code
>   *  1. flags = ent->flags.
>   *  2. Observe that !(flags & GTF_transfer_committed). [*]
>   *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).

Since neither in the cover letter nor in the description here I could
spot a link to the resulting generated doc, I wonder what the
inconsistencies above are about: You add @code/@endcode (and no blank
lines) to parts of what's being described, and _instead_ a blank line
to another part. I think the goal should be that not only the
generated doc ends up looking "nice", but that the source code also
remains consistent. Otherwise, someone like me coming across this
later on might easily conclude that there was a @code/@endcode pair
missed.

> @@ -97,18 +104,23 @@
>   *      transferred frame is written. It is safe for the guest to spin waiting
>   *      for this to occur (detect by observing GTF_transfer_completed in
>   *      ent->flags).
> + * @endcode
>   *
>   * Invalidating a committed GTF_accept_transfer entry:
>   *  1. Wait for (ent->flags & GTF_transfer_completed).
>   *

Why did this not also get enclosed by @code/@endcode?

>   * Changing a GTF_permit_access from writable to read-only:
> + *
>   *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>   *
>   * Changing a GTF_permit_access from read-only to writable:
> + *
>   *  Use SMP-safe bit-setting instruction.

And these two?

> + * @addtogroup grant_table Grant Tables

And no blank (comment) line ahead of this?

> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>   * [GST]: This field is written by the guest and read by Xen.
>   */
>  
> -/*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> - */
>  #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>  #define grant_entry_v1 grant_entry
>  #define grant_entry_v1_t grant_entry_t
>  #endif
> +/**
> + * Version 1 of the grant table entry structure is maintained purely
> + * for backwards compatibility.  New guests should use version 2.
> + */

In case I didn't say so already before - I think this would be a good
opportunity to drop the comment pointing at v2. With v2 optionally
unavailable altogether, this can't possibly be a generally valid
course of action.

> @@ -451,11 +465,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>   * bytes to be copied.
>   */
>  
> -#define _GNTCOPY_source_gref      (0)
> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> -#define _GNTCOPY_dest_gref        (1)
> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
> -
>  struct gnttab_copy {
>      /* IN parameters. */
>      struct gnttab_copy_ptr {
> @@ -471,6 +480,12 @@ struct gnttab_copy {
>      /* OUT parameters. */
>      int16_t       status;
>  };
> +
> +#define _GNTCOPY_source_gref      (0)
> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> +#define _GNTCOPY_dest_gref        (1)
> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)

I guess I didn't express myself precisely enough: I think these
would better live _immediately_ next to the field that uses them.

Jan


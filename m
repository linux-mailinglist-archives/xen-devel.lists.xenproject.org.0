Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79200364037
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112816.215117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRif-0005jB-6N; Mon, 19 Apr 2021 11:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112816.215117; Mon, 19 Apr 2021 11:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRif-0005im-3D; Mon, 19 Apr 2021 11:05:33 +0000
Received: by outflank-mailman (input) for mailman id 112816;
 Mon, 19 Apr 2021 11:05:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYRid-0005ih-41
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:05:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdc463aa-2e78-4b7c-a242-54ee924ffe45;
 Mon, 19 Apr 2021 11:05:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 654ADACC5;
 Mon, 19 Apr 2021 11:05:29 +0000 (UTC)
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
X-Inumbo-ID: fdc463aa-2e78-4b7c-a242-54ee924ffe45
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618830329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20RvxJy0hcSKzsIFHAOY2mPKDfKYj1qJeJetM4NZSE8=;
	b=IIBOD6CysGm3eN8cp/c3TY2fDvp3yOc6zSyxECyMpk/lfM7Llsji5LD1jc7JfuA3v0qAO6
	IBbrm19Og3hwbzNtbgi9+IOWpjdpbQXmFYGiPJNxBkJ8ggkVWhdXzALawJHC8WEVaj4/uz
	2cDl9JF+9ERzDN+HEAo2QKzXwb0S3TE=
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
Date: Mon, 19 Apr 2021 13:05:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419091231.55684-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.04.2021 11:12, Luca Fancellu wrote:
> Modification to include/public/grant_table.h:
> 
> 1) Add doxygen tags to:
>  - Create Grant tables section
>  - include variables in the generated documentation
> 2) Add .rst file for grant table for Arm64

I'm missing some reasoning about at least some of the changes done
to grant_table.h. Looking at this and the earlier patches I also
couldn't spot any general outline of what is acceptable or even
necessary in such a header to be understood by doxygen. Without
this written down somewhere (or, if documented elsewhere, a
pointer provided to that doc) I'm afraid things might get screwed
up again later on.

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

Why is this Arm64-specific?

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
> @@ -97,47 +104,55 @@
>   *      transferred frame is written. It is safe for the guest to spin waiting
>   *      for this to occur (detect by observing GTF_transfer_completed in
>   *      ent->flags).
> + * @endcode
>   *
>   * Invalidating a committed GTF_accept_transfer entry:
>   *  1. Wait for (ent->flags & GTF_transfer_completed).
>   *
>   * Changing a GTF_permit_access from writable to read-only:
> + *
>   *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>   *
>   * Changing a GTF_permit_access from read-only to writable:
> + *
>   *  Use SMP-safe bit-setting instruction.

For example - are the blank lines you add necessary or merely nice
to have in your personal opinion?

> - */
> -
> -/*
> - * Reference to a grant entry in a specified domain's grant table.
> - */
> -typedef uint32_t grant_ref_t;

Why does this get moved ...

> -
> -/*
> + *
>   * A grant table comprises a packed array of grant entries in one or more
>   * page frames shared between Xen and a guest.
> + *
>   * [XEN]: This field is written by Xen and read by the sharing guest.
> + *
>   * [GST]: This field is written by the guest and read by Xen.
> + *
> + * @addtogroup grant_table Grant Tables
> + * @{
>   */
>  
> -/*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> +/**
> + * Reference to a grant entry in a specified domain's grant table.
>   */
> +typedef uint32_t grant_ref_t;

... here, past a comment unrelated to it?

> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>       * In that case, the frame field has the same semantics as the
>       * field of the same name in the V1 entry structure.
>       */
> +    /** @cond skip anonymous struct/union for doxygen */
>      struct {
>          grant_entry_header_t hdr;
>          uint32_t pad0;
>          uint64_t frame;
>      } full_page;
> +    /** @endcond */
>  
>      /*
>       * If the grant type is GTF_grant_access and GTF_sub_page is set,
>       * @domid is allowed to access bytes [@page_off,@page_off+@length)
>       * in frame @frame.
>       */
> +    /** @cond skip anonymous struct/union for doxygen */
>      struct {
>          grant_entry_header_t hdr;
>          uint16_t page_off;
>          uint16_t length;
>          uint64_t frame;
>      } sub_page;
> +    /** @endcond */
>  
>      /*
>       * If the grant is GTF_transitive, @domid is allowed to use the
> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>       * The current version of Xen does not allow transitive grants
>       * to be mapped.
>       */
> +    /** @cond skip anonymous struct/union for doxygen */
>      struct {
>          grant_entry_header_t hdr;
>          domid_t trans_domid;
>          uint16_t pad0;
>          grant_ref_t gref;
>      } transitive;
> +    /** @endcond */

While already better than the introduction of strange struct tags,
I'm still not convinced we want this extra clutter (sorry). Plus -
don't these additions mean the sub-structures then won't be
represented in the generated doc, rendering it (partly) useless?

> @@ -433,7 +454,12 @@ typedef struct gnttab_transfer gnttab_transfer_t;
>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>  
>  
> -/*
> +#define _GNTCOPY_source_gref      (0)
> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> +#define _GNTCOPY_dest_gref        (1)
> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
> +
> +/**
>   * GNTTABOP_copy: Hypervisor based copy
>   * source and destinations can be eithers MFNs or, for foreign domains,
>   * grant references. the foreign domain has to grant read/write access
> @@ -451,18 +477,15 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>   * bytes to be copied.
>   */
>  
> -#define _GNTCOPY_source_gref      (0)
> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> -#define _GNTCOPY_dest_gref        (1)
> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
> -
>  struct gnttab_copy {

Again the question - why the movement?

> @@ -579,17 +602,19 @@ struct gnttab_swap_grant_ref {
>  typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>  DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>  
> -/*
> +/**
>   * Issue one or more cache maintenance operations on a portion of a
>   * page granted to the calling domain by a foreign domain.
>   */
>  struct gnttab_cache_flush {
> +    /** @cond skip anonymous struct/union for doxygen */
>      union {
>          uint64_t dev_bus_addr;
>          grant_ref_t ref;
>      } a;
> -    uint16_t offset; /* offset from start of grant */
> -    uint16_t length; /* size within the grant */
> +    /** @endcond */
> +    uint16_t offset; /**< offset from start of grant */
> +    uint16_t length; /**< size within the grant */

Skipping just part of a struct is perhaps even more confusing than
omitting it altogether.

Also, what's the significance of "/**<" ?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D19D6009
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 14:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841895.1257375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEU7t-000457-8i; Fri, 22 Nov 2024 13:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841895.1257375; Fri, 22 Nov 2024 13:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEU7t-00042a-5w; Fri, 22 Nov 2024 13:55:13 +0000
Received: by outflank-mailman (input) for mailman id 841895;
 Fri, 22 Nov 2024 13:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NurD=SR=bounce.vates.tech=bounce-md_30504962.67408d36.v1-6fab0bcfe4e146b3806f4c83637ae662@srs-se1.protection.inumbo.net>)
 id 1tEU7s-0003mr-8U
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 13:55:12 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fbadc48-a8d9-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 14:55:05 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XvxS61WynzG0CBMG
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 13:55:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6fab0bcfe4e146b3806f4c83637ae662; Fri, 22 Nov 2024 13:55:02 +0000
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
X-Inumbo-ID: 5fbadc48-a8d9-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjVmYmFkYzQ4LWE4ZDktMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjgzNzA1LjUxMzgxMSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDA4ZDM2LnYxLTZmYWIwYmNmZTRlMTQ2YjM4MDZmNGM4MzYzN2FlNjYyQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732283702; x=1732544202;
	bh=9k3/DMACJm5rbUm93fEdJecSBKBpnbjgBpz56WowbWo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=F3rgZhJKjlkYT9cbmlRFdrKIe34GxzZtrNpuZ4KzKByNmkNe3rMRlqTs9gQdqOEGL
	 8Yb7qSYj6y4X11y9A0BY9iU7Z9krqvqwPBIgJ/jNjmIMLcUXoZ3YA5gh/GEky+lzSD
	 iEkAzxNoXwlPgO1SN2axfghjR4DAIT5oJVWLDrLuNbhCdGIu1VRvEIyFc/eTN+3BQB
	 Zuf7BjYNv60rNJThN0OWtUxdWwhT+5QdqfO5FFVSFQxgzsbJEYxILkILQYIFQ/HymF
	 HcXPpqEDULgg9dyoBdFRZxM9AKMHcI7pBU450MDZKPFBsMT+gs134aplXzW0JP7bz/
	 CyfOdf9v9stzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732283702; x=1732544202; i=anthony.perard@vates.tech;
	bh=9k3/DMACJm5rbUm93fEdJecSBKBpnbjgBpz56WowbWo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G0eBFRgRwOwm/NKHp6P3wY6yVjHibc28rfW/R6uNfQkBKXOJbiYvxwgO01wRP5a1D
	 VQhzJT+7SyXs9a1DwpqDnFT0psSW9vitOqIZr+l0jxPfXczvwsLQh5n9SmN1Grw8Bq
	 jHAS3NlyXcmiuzenLF3mH0BNmrVnOuviACP9kgYDf9NP0L4YrgoZcvLs7Dlu5IGf3F
	 jVtLzmI3F3hXg1bv11RzJ89W8W5K0pCGRitMRNi63ZQMpQNBSTwSNnqtogvFClF87Y
	 LvtGpjbTVjXnKR9GcFW64KdKPmXLw+q5SFkXgVfxyL9d3zYefsJAoQr/T4B5SQqa2I
	 iIm8cjYYOFWTQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/6]=20tools/libs:=20add=20a=20new=20libxenmanage=20library?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732283701601
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z0CNNdezcIbUelrk@l14>
References: <20241023131005.32144-1-jgross@suse.com> <20241023131005.32144-5-jgross@suse.com>
In-Reply-To: <20241023131005.32144-5-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6fab0bcfe4e146b3806f4c83637ae662?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241122:md
Date: Fri, 22 Nov 2024 13:55:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Juergen,

On Wed, Oct 23, 2024 at 03:10:03PM +0200, Juergen Gross wrote:
> In order to have a stable interface in user land for using stable
> domctl and possibly later sysctl interfaces, add a new library
> libxenmanage.

What this new library could do? What sort of operation could be added in
the future? Domain creation? I'm trying to get convince that "manage" is
the right name for it.

To me, "manage" could be something higher level to take care of a domain
from it's creation to its demise.

So for this lib have get_domain_info() to query about a single domain,
and get_changed_domain() which seems to be a state synchronisation
operation. (For that second function, it resemble an operation of the
Matrix API calling "https://.../sync" which return all the new event
since the last time it was called. But back to the new function name, a
get* function which returns a different value every time you call it
might not actually be the right name for it, maybe other functions that
do something similar, or at least tell when there's a new event, would
be poll() and select(), so maybe poll_changed_domain() would be slightly
better at describing the kind of function that it is?)

So, those two functions only query about the states of domains, without
making any modification is seems, so is "manage" still the right name?
At least, it both function doesn't seems to fit in existing stable
libraries so having a new one seems the right call. So the name
depends of what other operation could be added to the library, as such,
a description of the library would be nice, but at least thanks for
documenting every functions!

> diff --git a/tools/include/xenmanage.h b/tools/include/xenmanage.h
> new file mode 100644
> index 0000000000..2e6c3dedaa
> --- /dev/null
> +++ b/tools/include/xenmanage.h
> @@ -0,0 +1,98 @@
> +/*
> + * Copyright (c) 2024 SUSE Software Solutions Germany GmbH
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.

Shall we use SPDX tags instead of this boilerplate?

> + */
> +#ifndef XENMANAGE_H
> +#define XENMANAGE_H
> +
> +#include <stdint.h>
> +
> +/* Callers who don't care don't need to #include <xentoollog.h> */
> +struct xentoollog_logger;

More like, callers who care will need to include xentoollog.h. Here, we
just avoid the need to include xentoollog.h in xenmanage.h by declaring
the minimum.

If every time I wanted to include an header, I needed to figure which
header needed to be include before, that would be very annoying. Often,
headers include the needed headers.

If you want to have a comment, how about "Avoid the need to include
<xentoollog.h>", that way the comment tell why "struct
xentoollog_logger" is here, where it came from, and is more explicit.


> diff --git a/tools/libs/manage/core.c b/tools/libs/manage/core.c
> new file mode 100644
> index 0000000000..0c9199f829
> --- /dev/null
> +++ b/tools/libs/manage/core.c
> @@ -0,0 +1,170 @@
...
> +
> +#define __XEN_TOOLS__ 1

This define might be better in the Makefile(.common), or even in libs.mk? So far,
only libxenhypfs does define this in source code, all the other defines
are in CFLAGS or there because xenctrl.h is included.


> +static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
> +                                                unsigned int domid_in,
> +                                                unsigned int *domid_out,
> +                                                unsigned int *state,
> +                                                uint64_t *unique_id)
> +{
> +    struct xen_domctl *buf;
> +    struct xen_domctl_get_domain_state *st;
> +    int saved_errno;
> +    int ret;
> +
...
> +
> +    ret = xencall1(hdl->xcall, __HYPERVISOR_domctl, (unsigned long)buf);
> +    saved_errno = errno;
> +    if ( !ret )
> +    {
> +        st = &buf->u.get_domain_state;

You could define *st here.
struct xen_domctl_get_domain_state *st = &...;

Or even with ".. *const st" but maybe that's not common enough in C
code.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


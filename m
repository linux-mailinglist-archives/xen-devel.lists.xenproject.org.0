Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F62828025E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 17:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1341.4455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0Ks-0002DC-RF; Thu, 01 Oct 2020 15:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341.4455; Thu, 01 Oct 2020 15:17:34 +0000
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
	id 1kO0Ks-0002Cn-Nv; Thu, 01 Oct 2020 15:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1341;
 Thu, 01 Oct 2020 15:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kO0Kq-0002Ch-Rz
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:17:32 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2180623e-ab2a-449f-a41e-227a19856e5b;
 Thu, 01 Oct 2020 15:17:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kO0Kq-0002Ch-Rz
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:17:32 +0000
X-Inumbo-ID: 2180623e-ab2a-449f-a41e-227a19856e5b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2180623e-ab2a-449f-a41e-227a19856e5b;
	Thu, 01 Oct 2020 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601565452;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jBL60SOOVhAJRYV/tE73mmneTV6ZR28dsmbeF/fyPAQ=;
  b=RCbvnkVz8mOHj9BCTPVo/vkjYNjhAv7iO+/YUjgmpFHt3gVAQdxAOhL8
   KMGNA2FLjHsNmjWiwx7y/rDt7twSCwaL8Y9vkwB9tVR43qH33OcbsdVRE
   ARdXWvcm4KeXo4QzbfgiYnEEBHtgUr4hDkUlLZua47zQdzLKIRG3IFcRf
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: orGed4YpnhoXaCuiVmgKLT/A7L1lNC2kERQQDbDg5XF8v36HP3fXjdg1PYGZxpcyi0PqFtovW/
 fJadu9LobTE+A4POn6qfm93wwnIKLxXoV4xNqQZJNwVLfqTJmAEMUDRlIk0/7Gqu/f4JReSOmT
 LXaoSa6IWcDnuvG+h8QzsoLdFNp68egJ+a+6WUlzLpvuuvWbo7kjbn+NXnigXf4+GZEWP45yuO
 xXIANfE44XXRET1g1WzReomWVnuNX6Z98oY/7a08KjOUdIWlVSK0B1l8FZmmSoA18AgGeN33sG
 2SI=
X-SBRS: None
X-MesageID: 28420544
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28420544"
Subject: Re: [PATCH v9 8/8] tools/libxc: add DOMAIN_CONTEXT records to the
 migration stream...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-9-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d6ac6ea-a312-6bac-bc7b-ea26541c1168@citrix.com>
Date: Thu, 1 Oct 2020 16:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-9-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> ... and bump the version.
>
> This patch implements version 4 of the migration stream by adding the code
> necessary to save and restore DOMAIN_CONTEXT records, and removing the code
> to save the SHARED_INFO and TSC_INFO records (as these are deprecated in
> version 4).
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

This really needs to be at least 3 patches.

First to adjust tools/python/scripts/verify-stream-v2 to understand the
new changes in the stream.

My testing tends to include running the script over the result of `xl
save`, and using a script in place of libxl-save-helper which tee's the
stream through the script, which lets you test in-line migrate.  (I
wonder if it would be better to add a pass-through mode to the script
and give libxl a way of running it in the same way as it currently runs
covert-legacy-stream.)

Next, a patch updating the receive side only to understand the new
changes in the stream.  In particular, this makes it far easier to
confirm that backwards compatibility is maintained.

Finally, a patch updating the sending side, if applicable.  (I've got an
alternative suggestion to avoid burning a load of major version numbers,
but will follow up on a different patch with that).

> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
>
> v7:
>  - New in v7
> ---
>  tools/libs/guest/xg_sr_common.h       |  3 ++
>  tools/libs/guest/xg_sr_common_x86.c   | 20 -----------
>  tools/libs/guest/xg_sr_common_x86.h   |  6 ----
>  tools/libs/guest/xg_sr_restore.c      | 45 +++++++++++++++++++++--
>  tools/libs/guest/xg_sr_save.c         | 52 ++++++++++++++++++++++++++-
>  tools/libs/guest/xg_sr_save_x86_hvm.c |  5 ---
>  tools/libs/guest/xg_sr_save_x86_pv.c  | 22 ------------
>  7 files changed, 97 insertions(+), 56 deletions(-)
>
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index 13fcc47420..d440281cc1 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -298,6 +298,9 @@ struct xc_sr_context
>  
>              /* Sender has invoked verify mode on the stream. */
>              bool verify;
> +
> +            /* Domain context blob. */
> +            struct xc_sr_blob context;

We already have

ctx->x86.hvm.restore.context

and are now gaining

ctx->restore.context

This is concerning close to being ambiguous.  How about dom_context ?

Also, you leak the memory allocation.  Free it in xg_sr_restore.c:cleanup().

> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index b57a787519..453a383ba4 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -529,6 +529,20 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
>      return rc;
>  }
>  
> +static int stream_complete(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    int rc;
> +
> +    rc = xc_domain_setcontext(xch, ctx->domid,
> +                              ctx->restore.context.ptr,
> +                              ctx->restore.context.size);
> +    if ( rc < 0 )
> +        PERROR("Unable to restore domain context");
> +
> +    return rc;
> +}

Please put this in the PV and HVM stream_complete() hooks.

This is somewhat of a layering violation and enforcing an order which
might not be appropriate in all cases.

~Andrew


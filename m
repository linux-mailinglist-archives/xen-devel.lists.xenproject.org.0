Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F122B4B6EFD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273246.468356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz1H-0000hF-NO; Tue, 15 Feb 2022 14:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273246.468356; Tue, 15 Feb 2022 14:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz1H-0000ep-Jx; Tue, 15 Feb 2022 14:41:31 +0000
Received: by outflank-mailman (input) for mailman id 273246;
 Tue, 15 Feb 2022 14:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AO6W=S6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nJz1G-0000ej-RR
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:41:30 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c916c0e-8e6d-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 15:41:29 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id o9so22174829ljq.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 06:41:29 -0800 (PST)
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
X-Inumbo-ID: 5c916c0e-8e6d-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U0jlo6Lko7wheVsvJwCSUaiFQq9FjjfJB4EYUap77RY=;
        b=mhTlTTwZHYhzkn023LIo3DeW87VfXC7hFgQnWT/QrVP4+JgaQm2z0KgTJeyXnMGfK2
         zFv7ywV+ZuoClKZoQHIE9YVf9NebTJzkdA9IuszZuI9+dRA/tsnlUQGregyHV30b3oF8
         Qyi3Qw1j08SoeNFGO7kJILf5/Zd3mNk9NCfWcWDx3BZ4reMnTPp2vOVeV9t3xY1FBtf2
         /MJmRgKSxTGMt1/ixpFaI7cJ3O9nRwRdbDTBvQXq5U3yaRG9sn0nfWbHFLQejsyAR1tt
         84iPqWut+Bowk72HJl3XaOFrxPfKTh2SJ/LdpOKsWp7JQec4NRTTXSmsvwcMt2qCH9i4
         koyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U0jlo6Lko7wheVsvJwCSUaiFQq9FjjfJB4EYUap77RY=;
        b=Ps7mTJ99HvC7kBpThsRsPL4BaJVjUYHNIY3Qo/c+JiIKLmJaIdtLGo9YZ7oKKu8Cdc
         RnWGBGsXJ0JzlypV1WLVzBWgOhNflBcu5j/c0L+/G7NLtGyMz0q5KQYdvGzSjtnQcVZQ
         q1NPnyBF0M9zQlJUqFFDZQmsQAyWUX2C2/Q6Ji5CI+u/JQ7N4yOmvApVAs7IB7nlaRmJ
         LgkMesPSOdwPK7hYhEofyzTp6WG5cSANhVWHuHkbb1v7Do0PT6HZccuG/ZUIXiHwR2se
         Hvj7oQfzUCrsa7YAbxz0PfwMEVdBWOycBfHAk+pMLkAP7RCCUdr/XbinPcoiP/cGGjg4
         ABFA==
X-Gm-Message-State: AOAM531W+ofA2i7JXSF/pYfzHSrvczU3skRTNADdpbkxhxahmztry2U0
	a3qmk7MMikdHILVNj6c6inXr51H6BmtA1lgfx64=
X-Google-Smtp-Source: ABdhPJwWfwRt5iAF0XIxi/vqtn/flxGS2i1UTUG69/NGurYf2AqeYSsqen0vhT8/Qp0MgqKgoCWkItVSD/0Nx7DVudY=
X-Received: by 2002:a2e:9995:: with SMTP id w21mr2687010lji.168.1644936089289;
 Tue, 15 Feb 2022 06:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20211210123519.595163-1-andr2000@gmail.com>
In-Reply-To: <20211210123519.595163-1-andr2000@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 15 Feb 2022 09:41:17 -0500
Message-ID: <CAKf6xpu76umJXWJm2FyG2ST6fm0_iU7RSGGQkTt7_uG_HLi-iw@mail.gmail.com>
Subject: Re: [PATCH] tools: remove xenstore entries on vchan server closure
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 7:35 AM Oleksandr Andrushchenko
<andr2000@gmail.com> wrote:
>
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> vchan server creates XenStore entries to advertise its event channel and
> ring, but those are not removed after the server quits.
> Add additional cleanup step, so those are removed, so clients do not try
> to connect to a non-existing server.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  tools/include/libxenvchan.h |  5 +++++
>  tools/libs/vchan/init.c     | 23 +++++++++++++++++++++++
>  tools/libs/vchan/io.c       |  4 ++++
>  tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 tools/libs/vchan/vchan.h
>
> diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
> index d6010b145df2..30cc73cf97e3 100644
> --- a/tools/include/libxenvchan.h
> +++ b/tools/include/libxenvchan.h
> @@ -86,6 +86,11 @@ struct libxenvchan {
>         int blocking:1;
>         /* communication rings */
>         struct libxenvchan_ring read, write;
> +       /**
> +        * Base xenstore path for storing ring/event data used by the server
> +        * during cleanup.
> +        * */
> +       char *xs_path;
>  };
>
>  /**
> diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> index c8510e6ce98a..c6b8674ef541 100644
> --- a/tools/libs/vchan/init.c
> +++ b/tools/libs/vchan/init.c
> @@ -46,6 +46,8 @@
>  #include <xen/sys/gntdev.h>
>  #include <libxenvchan.h>
>
> +#include "vchan.h"
> +
>  #ifndef PAGE_SHIFT
>  #define PAGE_SHIFT 12
>  #endif
> @@ -251,6 +253,10 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
>         char ref[16];
>         char* domid_str = NULL;
>         xs_transaction_t xs_trans = XBT_NULL;
> +
> +       // store the base path so we can clean up on server closure
> +       ctrl->xs_path = strdup(xs_base);

You don't check for NULL here, but you do check for NULL in
close_xs_srv().  I guess it's okay, since it does the right thing.
But I think it would be more robust to check for NULL here.  Is there
a specific reason you wrote it this way?  Otherwise it looks good.

Regards,
Jason


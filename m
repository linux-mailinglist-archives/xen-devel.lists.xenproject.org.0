Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E44B8B41
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 15:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274161.469527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKL9s-0000yg-Hf; Wed, 16 Feb 2022 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274161.469527; Wed, 16 Feb 2022 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKL9s-0000wR-EM; Wed, 16 Feb 2022 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 274161;
 Wed, 16 Feb 2022 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPu=S7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nKL9r-0000wJ-2b
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 14:19:51 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80308a41-8f33-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 15:19:49 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id n24so3520472ljj.10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 06:19:49 -0800 (PST)
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
X-Inumbo-ID: 80308a41-8f33-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gg4xEJR+SSZMw8ws+HUnrqvJSjZM4FLBBLe+IdNSmpc=;
        b=CvO48LjlnOynprQ9Gj4EiNMgdxDNO7hH2+hUdd4qh/bze8wugrAEQe8YdjcjIeYL91
         STd/4iq3PkPOQJeKhaF/T5kVLf5d3bYXSHnXxkSVi1X01QJG/WuwmIEv2dXilmMLVHmR
         ORK1XsIx/OGZsETHErox48iLVhBGre6vVAn7Z1aMnrb6G/zmV/bW5V6aKRpkH2YR6Xh9
         92NmX0m3QhBiMOGgyw5/ZGptDbv36jJNNAI8oyXnji1Z3oTfbqg6tvV15R4leD4aNMpq
         PmV8kwGJi66N1EkW92NAVdSxsnmi7GSIC/oOtUwzKfb+T9mLXmJsKEAn355ap6jgtRIR
         51+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gg4xEJR+SSZMw8ws+HUnrqvJSjZM4FLBBLe+IdNSmpc=;
        b=vEesZ90IhmByHIXbcrQx+4iYDaZdc/+dGcgik2f8I/XlSuBAMvQ21wHhMEseT0RCTu
         +ZFBkV5r65bVo/tjAlzeDSu9EoBPA4ZGVupZzgsi3rLeN5Mnf5IYdSvtShL28OVOdVrH
         eOWXlEm66/gzcu2edT8TwvIQkb+TtWD/10r2p+Vv65hAhQ56/y4yqTPy3dDxDjXqVyQd
         GyGtL71hg0PFlWBXtfEO/UCala8snmqThZNYMWMULOmjR9t0YX2JKZg36rA43l76Atdt
         56zz7EZijY3AHXF90QBGY6vkcmGxuT+B5Yy5Jf1iJSIU8I8IzhNuxGd2gBbqeH/71q8O
         OokA==
X-Gm-Message-State: AOAM530hfxCQvIYPa9p5gxRROScaM1i+a9JNay7opnH7M4QQsb3hzvkX
	ym9+hOelCk/uj6O4nc1EFa2DjrGmqqxKoSY8bHE=
X-Google-Smtp-Source: ABdhPJwjaLoyusb08C85GkdiEy5q0SpR6gLudrKdCZNy/H4hdZri/CUtQAgFj7Kes0gcauEPYY5pQn+8NFlZ7ov+59M=
X-Received: by 2002:a2e:9d0d:0:b0:244:d41e:a5cf with SMTP id
 t13-20020a2e9d0d000000b00244d41ea5cfmr2193642lji.168.1645021189357; Wed, 16
 Feb 2022 06:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20220216063325.1552217-1-andr2000@gmail.com>
In-Reply-To: <20220216063325.1552217-1-andr2000@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Feb 2022 09:19:37 -0500
Message-ID: <CAKf6xpvAp7yFJDRVjmkwJTfOcxfyaM9b-ndgw=qwCRFGnKROcw@mail.gmail.com>
Subject: Re: [PATCH v2] tools: remove xenstore entries on vchan server closure
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 16, 2022 at 1:33 AM Oleksandr Andrushchenko
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
>
> ---
> Since v1:
> - add NULL check after strdup
> ---
>  tools/include/libxenvchan.h |  5 +++++
>  tools/libs/vchan/init.c     | 25 +++++++++++++++++++++++++
>  tools/libs/vchan/io.c       |  4 ++++
>  tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 100644 tools/libs/vchan/vchan.h

> diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> index c8510e6ce98a..ae9a6b579753 100644
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
> @@ -251,6 +253,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
>         char ref[16];
>         char* domid_str = NULL;
>         xs_transaction_t xs_trans = XBT_NULL;
> +
> +       // store the base path so we can clean up on server closure
> +       ctrl->xs_path = strdup(xs_base);
> +       if (!ctrl->xs_path)
> +               goto fail;
> +
>         xs = xs_open(0);
>         if (!xs)
>                 goto fail;

Hi, Oleksandr,

You now have multiple conditions goto fail, so I think you need to add
the below snippet to avoid leaking memory.

if (ret) {
    free(ctrl->xs_path)
    ctrl->xs_path = NULL;
}

It's actually okay with your patch since libxenvchan_server_init() does:

        if (init_xs_srv(ctrl, domain, xs_path, ring_ref))
                goto out;
        return ctrl;
out:
        libxenvchan_close(ctrl);
        return 0;

and libxenvchan_close() will free xs_path.  But it's a little more
robust to cleanup local to the failure.

Thanks,
Jason


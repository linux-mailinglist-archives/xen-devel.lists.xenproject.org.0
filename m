Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148313668DD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114276.217746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9mI-0005P1-Cj; Wed, 21 Apr 2021 10:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114276.217746; Wed, 21 Apr 2021 10:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9mI-0005Oc-9X; Wed, 21 Apr 2021 10:08:14 +0000
Received: by outflank-mailman (input) for mailman id 114276;
 Wed, 21 Apr 2021 10:08:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9mG-0005OU-4Y
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:08:12 +0000
Received: from mail-wr1-f41.google.com (unknown [209.85.221.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7e4b3f3-ee73-459c-972f-897736d6cc30;
 Wed, 21 Apr 2021 10:08:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w4so37008924wrt.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:08:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t63sm1829372wma.20.2021.04.21.03.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:08:09 -0700 (PDT)
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
X-Inumbo-ID: a7e4b3f3-ee73-459c-972f-897736d6cc30
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rpUxQWaXQ59G8LS8+0aqgmg2SpC0z7dC5DkZaoSnb6g=;
        b=NuirogYqiAbNAGFWacdsAc4g728X9DG6NS6XAi0Io7ino54J8bu4yKqpoEdlBZgY7J
         +TGpFzEvwUdGhsqDvB0ibPhJGDPafUb/0g9FTwymcvSiuC53re0CkWLm4qaFk4Byd6LN
         +JHQoZvxnKyTmzYoveJyNpeMg8Y6CzKKow7HVFev1NwVyO7mEIZEegtZiLxj7MDt1wpG
         VBRSgU0YqkTVTOJvY0dYGhXvvRWJ6Y3WVk4a271cS34fUUDry3wjfbAflbC3REfcaJxN
         5zf8NRPcDtmDLz2TLhr+WFA5BlyD8SWJ5ZQY2e9MXg0ZNUvVkdXDNJ9bnoJPBCRSeFgv
         xIfQ==
X-Gm-Message-State: AOAM530tcUgn3FanGu+/jmUDh/H81dIBS2eTB6Im8tvinmr7yt2cEZvR
	M/wqgAbL0LrTsgjc6S58R8omhANF+3Q=
X-Google-Smtp-Source: ABdhPJzzMekXKnSHk2kM3RH5/JNpjwSf0QhL3eL8OsZdDb6eJrQu+9NRS7wlxqtHlewK4df62ezgag==
X-Received: by 2002:adf:d0cc:: with SMTP id z12mr26434558wrh.18.1618999690208;
        Wed, 21 Apr 2021 03:08:10 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:08:08 +0000
From: Wei Liu <wl@xen.org>
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libs/light: Remove unnecessary libxl_list_vm() call
Message-ID: <20210421100808.fvl6argtpmstwrev@liuwe-devbox-debian-v2>
References: <cf7c0f8869a087008fbe10888ebf96336b1ccb7b.1618837159.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7c0f8869a087008fbe10888ebf96336b1ccb7b.1618837159.git.costin.lupu@cs.pub.ro>

On Mon, Apr 19, 2021 at 04:01:42PM +0300, Costin Lupu wrote:
> The removed lines were initially added by commit 314e64084d31, but the
> subsequent code which was using the nb_vm variable was later removed by
> commit 2ba368d13893, which makes these lines of code an overlooked
> reminiscence. Moreover, the call becomes very expensive when there is a
> considerable number of VMs (~1000 instances) running on the host.
> 

Nice catch.

> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

Acked-by: Wei Liu <wl@xen.org>

> ---
>  tools/libs/light/libxl_create.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 0c64268f66..43e9ba9c63 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -578,7 +578,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                         uint32_t *domid, bool soft_reset)
>  {
>      libxl_ctx *ctx = libxl__gc_owner(gc);
> -    int ret, rc, nb_vm;
> +    int ret, rc;
>      const char *dom_type;
>      char *uuid_string;
>      char *dom_path, *vm_path, *libxl_path;
> @@ -586,7 +586,6 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>      struct xs_permissions rwperm[1];
>      struct xs_permissions noperm[1];
>      xs_transaction_t t = 0;
> -    libxl_vminfo *vm_list;
>  
>      /* convenience aliases */
>      libxl_domain_create_info *info = &d_config->c_info;
> @@ -869,14 +868,6 @@ retry_transaction:
>                          ARRAY_SIZE(rwperm));
>      }
>  
> -    vm_list = libxl_list_vm(ctx, &nb_vm);
> -    if (!vm_list) {
> -        LOGD(ERROR, *domid, "cannot get number of running guests");
> -        rc = ERROR_FAIL;
> -        goto out;
> -    }
> -    libxl_vminfo_list_free(vm_list, nb_vm);
> -
>      xs_write(ctx->xsh, t, GCSPRINTF("%s/uuid", vm_path), uuid_string, strlen(uuid_string));
>      xs_write(ctx->xsh, t, GCSPRINTF("%s/name", vm_path), info->name, strlen(info->name));
>  
> -- 
> 2.20.1
> 


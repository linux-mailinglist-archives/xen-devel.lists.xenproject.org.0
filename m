Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065F285DA6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3421.9849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ75x-0006xS-UK; Wed, 07 Oct 2020 10:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3421.9849; Wed, 07 Oct 2020 10:54:53 +0000
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
	id 1kQ75x-0006x6-R4; Wed, 07 Oct 2020 10:54:53 +0000
Received: by outflank-mailman (input) for mailman id 3421;
 Wed, 07 Oct 2020 10:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQ75w-0006x1-74
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:54:52 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8685ff7d-9f4e-456b-ba81-7e36c2cd568e;
 Wed, 07 Oct 2020 10:54:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n15so1629529wrq.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:54:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n6sm2517339wrx.58.2020.10.07.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:54:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQ75w-0006x1-74
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:54:52 +0000
X-Inumbo-ID: 8685ff7d-9f4e-456b-ba81-7e36c2cd568e
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8685ff7d-9f4e-456b-ba81-7e36c2cd568e;
	Wed, 07 Oct 2020 10:54:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n15so1629529wrq.2
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yxgbt0GZlXvAgMopkmHRROYZi4BI1bCKPDz2tdOmbM4=;
        b=SFORKy691fvAoAzFi1oLyBWrrxp4uqjwkIczpto4ldke7xUOdwwoCNyTXJwghZPO6i
         4xryDssy/8lhOEbHwat0uzJLP2UpZTlZn1KmlsdLJ3kLKir/xmhs1VEAzKENEzbDTtzr
         QkfbZ4TRjOFPSl0w4SKBqjFEbx9gx8rKhKOD0DmxGJEudh17cK4NDbdoVqbdt5owG8fw
         b0ZVbR89tgjzl8wwCDwfq9m1ggQ6amJkH0PiX8HioLgLiK6skefvMG8CjYXdq0dIyKJv
         xq1BtSMxKGH0LoaHYemz/PKdri2uccBdAFcD8ybsZDIRpW7axdjMPVzibos4VKxl1rYC
         30sA==
X-Gm-Message-State: AOAM532V11wK9MHg6oFJsw8wKG8Ced0PIGNcKdzHjuxCFiH2GOdfP12d
	EbYJxb71xSQBrbpr5yP6pMQXNtOPC6Y=
X-Google-Smtp-Source: ABdhPJx+uIiOgjYwAn3ysFpkdp6C0tFluv9h1DnNu8GGr9QNsw+hcjTHi1aAmVfG75IpN2se0JRQ0Q==
X-Received: by 2002:a5d:6642:: with SMTP id f2mr1719301wrw.374.1602068090530;
        Wed, 07 Oct 2020 03:54:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id n6sm2517339wrx.58.2020.10.07.03.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:54:50 -0700 (PDT)
Date: Wed, 7 Oct 2020 10:54:48 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] tools/libs/store: drop read-only functionality
Message-ID: <20201007105448.c7scd5hoellddfwd@liuwe-devbox-debian-v2>
References: <20201002154141.11677-1-jgross@suse.com>
 <20201002154141.11677-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002154141.11677-4-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 05:41:39PM +0200, Juergen Gross wrote:
> Today it is possible to open the connection in read-only mode via
> xs_daemon_open_readonly(). This is working only with Xenstore running
> as a daemon in the same domain as the user. Additionally it doesn't
> add any security as accessing the socket used for that functionality
> requires the same privileges as the socket used for full Xenstore
> access.
> 
> So just drop the read-only semantics in all cases, leaving the
> interface existing only for compatibility reasons. This in turn
> requires to just ignore the XS_OPEN_READONLY flag.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/store/include/xenstore.h | 8 --------
>  tools/libs/store/xs.c               | 7 ++-----
>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/libs/store/include/xenstore.h b/tools/libs/store/include/xenstore.h
> index cbc7206a0f..158e69ef83 100644
> --- a/tools/libs/store/include/xenstore.h
> +++ b/tools/libs/store/include/xenstore.h
> @@ -60,15 +60,12 @@ typedef uint32_t xs_transaction_t;
>  /* Open a connection to the xs daemon.
>   * Attempts to make a connection over the socket interface,
>   * and if it fails, then over the  xenbus interface.
> - * Mode 0 specifies read-write access, XS_OPEN_READONLY for
> - * read-only access.
>   *
>   * * Connections made with xs_open(0) (which might be shared page or
>   *   socket based) are only guaranteed to work in the parent after
>   *   fork.
>   * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
>   *   for xs_open(0).
> - * * XS_OPEN_READONLY has no bearing on any of this.
>   *
>   * Returns a handle or NULL.
>   */
> @@ -83,11 +80,6 @@ void xs_close(struct xs_handle *xsh /* NULL ok */);
>   */
>  struct xs_handle *xs_daemon_open(void);
>  struct xs_handle *xs_domain_open(void);
> -
> -/* Connect to the xs daemon (readonly for non-root clients).
> - * Returns a handle or NULL.
> - * Deprecated, please use xs_open(XS_OPEN_READONLY) instead
> - */
>  struct xs_handle *xs_daemon_open_readonly(void);
>  
>  /* Close the connection to the xs daemon.
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 320734416f..4ac73ec317 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -302,7 +302,7 @@ struct xs_handle *xs_daemon_open(void)
>  
>  struct xs_handle *xs_daemon_open_readonly(void)
>  {
> -	return xs_open(XS_OPEN_READONLY);
> +	return xs_open(0);
>  }

This changes the semantics of this function, isn't it? In that the user
expects a readonly connection but in fact a read-write connection is
returned.

Maybe we should return an error here?

Wei.


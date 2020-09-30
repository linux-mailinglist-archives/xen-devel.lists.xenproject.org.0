Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8B27EC1A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807.2719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdoe-0006oz-Il; Wed, 30 Sep 2020 15:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807.2719; Wed, 30 Sep 2020 15:14:48 +0000
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
	id 1kNdoe-0006oa-FG; Wed, 30 Sep 2020 15:14:48 +0000
Received: by outflank-mailman (input) for mailman id 807;
 Wed, 30 Sep 2020 15:14:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdod-0006oV-0B
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:14:47 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31d3a50f-c970-4bce-9773-ad3fceb1cb49;
 Wed, 30 Sep 2020 15:14:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t10so2248135wrv.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:14:45 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z9sm3431672wmg.46.2020.09.30.08.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:14:43 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdod-0006oV-0B
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:14:47 +0000
X-Inumbo-ID: 31d3a50f-c970-4bce-9773-ad3fceb1cb49
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 31d3a50f-c970-4bce-9773-ad3fceb1cb49;
	Wed, 30 Sep 2020 15:14:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t10so2248135wrv.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E5iOHjF5ja2+CcDv8YOajqho0eGuf/lS1Gv03QrMd2o=;
        b=stThbjlnKX6cW/NjtVb5jpSQ+UxouCGHmEWHXrcDKhjxUNzmCL08vcOccJuM/306cl
         J0JGuFNp5zEFG/r2YEWagUHS9V8zXZBX7k71Qex1CqwOUjTMobS3kShwhXdWGBvmKq6x
         MCe60t89Z4b9jiqOhVL0vO5WGZu8tjV/I3bIw9q1+jZq5H/xC0d8fXX42MMZ+3t//FEw
         F3K64qvrH9kCyf1sy1jZmooJhkPJ4RZupYQt2xC2EvpsfJ98uzl7VWiAQhrBT3871osZ
         XYrSu2KKP6Z57GOzV7rIsjdsWECotc1QQWanSopgCwjpx19CiH9wWjkwWZIpIAtkRb7c
         bCjg==
X-Gm-Message-State: AOAM533PpbNFVO13/FCKatVYqg2pIyh7k0MlbyUCXg6KbXVfW1dhfRfW
	3x96eEQanvkUdLDvFnSk9qg=
X-Google-Smtp-Source: ABdhPJyj/M0dNiy5I28nko604BK5JXs2fWJpmgMr3EzUaECg/wwJcp5/80tZkggW7nXT+5Y4CpvbwA==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr3831964wrw.324.1601478884555;
        Wed, 30 Sep 2020 08:14:44 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id z9sm3431672wmg.46.2020.09.30.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:14:43 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:14:42 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xenstore: set maximum number of grants needed
Message-ID: <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
References: <20200924143648.27861-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924143648.27861-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 04:36:48PM +0200, Juergen Gross wrote:
> When running as a stubdom Xenstore should set the maximum number of
> grants needed via a call of xengnttab_set_max_grants(), as otherwise
> the number of domains which can be supported will be 128 only (the
> default number of grants supported by Mini-OS).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This is a backport candidate IMO.
> ---
>  tools/xenstore/xenstored_domain.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 06359503f0..f740aa02f5 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -630,6 +630,8 @@ void domain_init(void)
>  	*xgt_handle = xengnttab_open(NULL, 0);
>  	if (*xgt_handle == NULL)
>  		barf_perror("Failed to open connection to gnttab");
> +	/* Allow max number of domains for mappings. */
> +	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);

Why DOMID_FIRST_RESERVED as the count argument? Is the expectation here
xenstored maps one grant per domain?

Wei.

>  
>  	talloc_set_destructor(xgt_handle, close_xgt_handle);
>  
> -- 
> 2.26.2
> 


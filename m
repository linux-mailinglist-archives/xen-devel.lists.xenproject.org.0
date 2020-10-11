Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056528AA8D
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 23:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5728.14844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRiRN-00043U-Gl; Sun, 11 Oct 2020 20:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5728.14844; Sun, 11 Oct 2020 20:59:37 +0000
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
	id 1kRiRN-000435-Df; Sun, 11 Oct 2020 20:59:37 +0000
Received: by outflank-mailman (input) for mailman id 5728;
 Sun, 11 Oct 2020 20:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8YJ=DS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kRiRL-00042y-6h
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 20:59:35 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c6abcae-6657-43b5-b1ea-d797d3b471a2;
 Sun, 11 Oct 2020 20:59:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f21so15416813wml.3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 13:59:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r1sm21772609wro.18.2020.10.11.13.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:59:32 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=v8YJ=DS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kRiRL-00042y-6h
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 20:59:35 +0000
X-Inumbo-ID: 3c6abcae-6657-43b5-b1ea-d797d3b471a2
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3c6abcae-6657-43b5-b1ea-d797d3b471a2;
	Sun, 11 Oct 2020 20:59:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f21so15416813wml.3
        for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 13:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nHvxWt8meOHfENweROJRuGyAw8bL1sUNhAZ9nwSynPU=;
        b=bVRNKtxmkN7aHHhdxXC27RVAD7DOLYqbqqFZQbVPjeJ01A0kdR4v8966SlAkY34HAL
         ubUtSEhA/aRURR2hGljv/rZ99QIgqkH3Sl5cp77VCeJ/9kjEaNCbpoz79/VmpaIW2kt2
         GkSPgLVWX3mzyZAaRU3K0UUSsprwPzk8dziyWKlourT20Jx9dZzuMhQKR4VOdprkefC1
         32L01+1dZCR7mXkeSHxxZXayorYSs/d9J9WhkE6TA9P/GpUllso1MFmxFMUgdxIjJvwz
         Yjg88CA+Ol9vbW+OCQGVu/ie9qjspu3ku4nFCAyDgkKkBWXaaJ7JFyeR35jx71jAmpjn
         hKAw==
X-Gm-Message-State: AOAM532/tmd0W7vA6lmfo6yxeOMoWajZ/EfstMUV0XKAU9XhC95bSPC1
	GjYXgRI4CqXJ+CcCaxdEMUPs/Bt2Xic=
X-Google-Smtp-Source: ABdhPJwm7LOGvXVasG+OvFoPTHC9tyTC8NOCaEfoN0KCm5RwtrIlOS/2CfukwTzpKdoHRTUOAFLjCA==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr8107124wme.116.1602449973238;
        Sun, 11 Oct 2020 13:59:33 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id r1sm21772609wro.18.2020.10.11.13.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 13:59:32 -0700 (PDT)
Date: Sun, 11 Oct 2020 20:59:31 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/store: add disclaimer to header file
 regarding ignored options
Message-ID: <20201011205931.47z6vd4fau2py5bl@liuwe-devbox-debian-v2>
References: <20201011122401.28608-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011122401.28608-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Sun, Oct 11, 2020 at 02:24:01PM +0200, Juergen Gross wrote:
> Add a disclaimer to the libxenstore header file that all of the open
> flags (socket only connection, read only connection) are ignored.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked + applied.

> ---
>  tools/libs/store/include/xenstore.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/libs/store/include/xenstore.h b/tools/libs/store/include/xenstore.h
> index 158e69ef83..2b3f69fb61 100644
> --- a/tools/libs/store/include/xenstore.h
> +++ b/tools/libs/store/include/xenstore.h
> @@ -23,6 +23,7 @@
>  
>  #define XBT_NULL 0
>  
> +/* Following open flags are deprecated and ignored! */
>  #define XS_OPEN_READONLY	(1UL<<0)
>  #define XS_OPEN_SOCKETONLY      (1UL<<1)
>  
> -- 
> 2.26.2
> 


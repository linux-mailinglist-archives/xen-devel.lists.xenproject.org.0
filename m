Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA32A9951
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 17:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20959.47062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb4Qb-0006ur-SK; Fri, 06 Nov 2020 16:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20959.47062; Fri, 06 Nov 2020 16:17:29 +0000
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
	id 1kb4Qb-0006uS-Oi; Fri, 06 Nov 2020 16:17:29 +0000
Received: by outflank-mailman (input) for mailman id 20959;
 Fri, 06 Nov 2020 16:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb4Qa-0006uN-Q6
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:17:28 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36004ef0-1fcb-4bea-a51f-c2840a17d934;
 Fri, 06 Nov 2020 16:17:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so1887668wrp.10
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:17:27 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t11sm2980370wmf.35.2020.11.06.08.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:17:25 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb4Qa-0006uN-Q6
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:17:28 +0000
X-Inumbo-ID: 36004ef0-1fcb-4bea-a51f-c2840a17d934
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 36004ef0-1fcb-4bea-a51f-c2840a17d934;
	Fri, 06 Nov 2020 16:17:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so1887668wrp.10
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=biCvBdw7KP4PimXIHYN4ShplJWo2GhQTUyxqJpPxgSo=;
        b=PRKIE7yZBjoPqgcf7pLX66QXYimiK/6DUAK2P3obTCWug+BbFLfatFQ3rCkhbuigk4
         nDSiK3eUHfJj7X6ses5mOToSHPaZjVQaWJxYJ8dg28c7Pj2lc4sIWE6bxrlUTxGdSe1f
         iwFhMshgGqk6hLKB1LN296ylrA1elaVjBCCZMcRDZPOCpdO31vngCtn6Qrb62x9QZuxr
         OC3EcjvBzPaR7jSjWKPK26LY6x86i9aE1ImIbixHL/nuUr4lyj5v5qX1KnnV7xzEMJp2
         Dp77jeWkJrbrVaotHdb2XGsXhqso1jjkBEqHZLkNckAbf7RwyyMLVNkr2aVT06bbRDgK
         99LA==
X-Gm-Message-State: AOAM532c/OltVLJR+YC0nJNFqT8y+B19HJdku7wDaNh7QVL2UYciGF/q
	qKFCF/qaaCInGsbHOKDvz78=
X-Google-Smtp-Source: ABdhPJwAv7beCDXu+ZM2PzmG1sBDLR5Q4ArOtbQp/8cB+u3mdFnql+4xDjpxq+5BKIRP6ItNIdilhA==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr3487237wrv.414.1604679446507;
        Fri, 06 Nov 2020 08:17:26 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id t11sm2980370wmf.35.2020.11.06.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:17:25 -0800 (PST)
Date: Fri, 6 Nov 2020 16:17:24 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, takahiro.akashi@linaro.org,
	alex.bennee@linaro.org, masami.hiramatsu@linaro.org,
	ian.jackson@eu.citrix.com, wl@xen.org
Subject: Re: [PATCH] libxl: set vuart_gfn in libxl__build_hvm
Message-ID: <20201106161724.5hot2tzamqhhycck@liuwe-devbox-debian-v2>
References: <alpine.DEB.2.21.2011051312120.2323@sstabellini-ThinkPad-T480s>
 <20201106151146.GM2214@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106151146.GM2214@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716

On Fri, Nov 06, 2020 at 03:11:46PM +0000, Anthony PERARD wrote:
> On Thu, Nov 05, 2020 at 01:15:05PM -0800, Stefano Stabellini wrote:
> > libxl: set vuart_gfn in libxl__build_hvm
> 
> The subject is written two times ;-)
> 
> > Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> > Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> > dom->vuart_gfn.
> > 
> > Without this change, xl console cannot connect to the vuart console (-t
> > vuart), see https://marc.info/?l=xen-devel&m=160402342101366.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> > index f8661e90d4..36fe8915e7 100644
> > --- a/tools/libxl/libxl_dom.c
> > +++ b/tools/libxl/libxl_dom.c
> > @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
> >          LOG(ERROR, "hvm build set params failed");
> >          goto out;
> >      }
> > +    state->vuart_gfn = dom->vuart_gfn;
> >  
> >      rc = hvm_build_set_xs_values(gc, domid, dom, info);
> >      if (rc != 0) {
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

This patch is based on an old tree. I have ported it to staging. Please
check the code and shout if it is not done correctly.

Wei.

> 
> Thanks,
> 
> -- 
> Anthony PERARD


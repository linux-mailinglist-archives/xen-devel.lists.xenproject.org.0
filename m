Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E21E4014
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 13:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jduFZ-0002Zw-Bi; Wed, 27 May 2020 11:29:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1uD=7J=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jduFX-0002Zr-P1
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 11:29:31 +0000
X-Inumbo-ID: 54d1e262-a00d-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54d1e262-a00d-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 11:29:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x13so8979723wrv.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2020 04:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7ukDdBTID2nqNbO4Nuu1d5hVjiNbzXmjnB0+7rrB2SI=;
 b=YOZ4PHMDS2V4eKlJz4rhHnIhkwbjNY7ez2xrBrVWeyoqTodkcA+LJasGuLpboA0RcQ
 hZsQ7HOGsDLQNJzcX8VUPXHLtfvOypigR5AqcEAtfxSDav44YlVbVN+e97AaA5nn+nfw
 rJyfIRJDyf5RJay6t0T4DP0BMAjiN8OMmTvNsOQh2Mg9pIBV+gUTTGlc/kjL7qNoTqvR
 cM0bSKEl0cq7DvAfnt/ldOteU0lOBd/mcq896FbRUBHKMhOz3h/CpaYwovmijN3tXtFd
 DIchCKWjRJYlP6t8YgZaoXr774VDmdALtCaQYWHPDrB2tWrxOKoAEgIuGmkgqA4Qm+JY
 BvBw==
X-Gm-Message-State: AOAM530ks+QDBM5a7psT0SOZnoMl6RFgIOIWBwu6sxEdVe/lnxM1TSXl
 Pz3AzOt80Cq0yb/qDjCdfjE=
X-Google-Smtp-Source: ABdhPJxjEiifR2Pzkt5OwOsAom9xHyoqgDSd3Z4ktCRMBjxCTJ5lwU4iuCjQ2+iyaTL0G9iDxSjgtw==
X-Received: by 2002:adf:9d8f:: with SMTP id p15mr7554651wre.421.1590578970189; 
 Wed, 27 May 2020 04:29:30 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c25sm2536025wmb.44.2020.05.27.04.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 04:29:29 -0700 (PDT)
Date: Wed, 27 May 2020 11:29:28 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Message-ID: <20200527112928.72amqcojenrz2a46@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-4-george.dunlap@citrix.com>
 <20200527104316.GH2105@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527104316.GH2105@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 27, 2020 at 11:43:16AM +0100, Anthony PERARD wrote:
> On Tue, May 26, 2020 at 11:16:10PM +0100, George Dunlap wrote:
> > This fixes the following build error in hvmloader:
> > 
> > usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file or directory
> > 
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> > ---
> >  automation/build/archlinux/current.dockerfile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> > index 9af5d66afc..5095de65b8 100644
> > --- a/automation/build/archlinux/current.dockerfile
> > +++ b/automation/build/archlinux/current.dockerfile
> > @@ -19,6 +19,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
> >          iasl \
> >          inetutils \
> >          iproute \
> > +        lib32-glibc \
> >          libaio \
> >          libcacard \
> >          libgl \
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

All automation patches:

Acked-by: Wei Liu <wl@xen.org>

Anthony, can you generate and push the new images? Thanks.

Wei.

> 
> -- 
> Anthony PERARD


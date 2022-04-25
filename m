Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAC50E997
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 21:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313251.530753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj4Vt-0003Sz-0x; Mon, 25 Apr 2022 19:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313251.530753; Mon, 25 Apr 2022 19:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj4Vs-0003Ph-Sr; Mon, 25 Apr 2022 19:36:48 +0000
Received: by outflank-mailman (input) for mailman id 313251;
 Mon, 25 Apr 2022 19:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPyJ=VD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nj4Vr-0003Pb-GS
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 19:36:47 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa006f8-c4cf-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 21:36:45 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id x33so28068160lfu.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 12:36:45 -0700 (PDT)
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
X-Inumbo-ID: 0aa006f8-c4cf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjBbzPepFaGP/uN3sVsbzKuVqOQ2IKhG6bvnrfO4aSo=;
        b=WfxD5XgKPnR8aOo7PfcnUBJa5hpPBf2mw/o2HtuZ7E9gru/LfgOeilZZgtVZoUj/nk
         B9Wxk8LuC0FrHqXq0uYzz2k8P0m1d+8hnO0a4rcWbdJWO5pIgKCTbc6Jpm0vRUO6O8QD
         SAbbnbBZXe9FNmaKssUc2mZ+h3uVg18ECPEPuIW6Qak+plYugagGHWm4s/IB3ZKhZKX9
         V2z+SFkyFfVaXglvvSYJlABPiYDo6KSjZ1kwWrM81pXU9htdMFAoqhvMVgmwsRirrb2A
         D0cLC0GvS2O/iOuZVb1UQcn2oAh2b2pFSmGsjDNhbDn5+kUrqYGWjLqrQDgSn9L5upTY
         utXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjBbzPepFaGP/uN3sVsbzKuVqOQ2IKhG6bvnrfO4aSo=;
        b=11dTLPP1goW2nS4oBJxXGAC/CnO39hn5oqouPec2VY1TiH7OASEOUDJ8Lcarx3oBan
         flUQw20WD6whnrGmm8prtvQD/PyxmOLlT8kkFysF5e1WC7UJv8YDXH//YXtt3Lhqk0Xj
         X2YUm6W8xfugaStVbvDOZDXSLrC4tFYOv6x2YF8UO9WIyS39ddX4azu3pbLJ+AdT270f
         bJ2M1wvgbs+TyY5j0jQ/hba1Ruk7L60UlB+nf8rVdOG5w7lxdACdRn1tDIvUrQbrjFoe
         u9g2OMdpcVTqixBPzcBDmIVx0G/pzJfZd96uWzAW8cNcuvHD7Ned04iOlWsoBn9UV57V
         5+GA==
X-Gm-Message-State: AOAM5309lEY2w+GlMLHem1cqs5EWRsglP8w+MxOrK24SFPwJ1YBm17wB
	OX5CBDjHmXSXNTsl2rnkP8dhJ6Kr7S82a+IdwNL8Uhj7+7A=
X-Google-Smtp-Source: ABdhPJxnMYGmP3jq8rBO0FLB/SCCMl+rj9r9HX+eksyvtLC9EFBfPV9/NjoX7hccMPSWhQf4Fjm+pORWC1USO2Y85A4=
X-Received: by 2002:a05:6512:110d:b0:471:94ad:2bf4 with SMTP id
 l13-20020a056512110d00b0047194ad2bf4mr14579289lfg.128.1650915405327; Mon, 25
 Apr 2022 12:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220422194344.9318-1-dpsmith@apertussolutions.com> <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
In-Reply-To: <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 25 Apr 2022 15:36:34 -0400
Message-ID: <CAKf6xpt-WoKM6uR2spgbYBARSttpyLLZvhE9RMVUjsQ38=2bHQ@mail.gmail.com>
Subject: Re: [PATCH] xsm/flask: code style formatting
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 7:07 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 22/04/2022 20:43, Daniel P. Smith wrote:
> > diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> > index 0bf63ffa84..e2ebbc7716 100644
> > --- a/xen/xsm/flask/hooks.c
> > +++ b/xen/xsm/flask/hooks.c
> > @@ -120,8 +121,8 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
> >          struct irq_desc *desc = irq_to_desc(irq);
> >          if ( desc->msi_desc && desc->msi_desc->dev ) {
> >              struct pci_dev *dev = desc->msi_desc->dev;
> > -            u32 sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
> > -            if (ad) {
> > +            uint32_t sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
> > +            if ( ad ) {
>
> Brace on newline, and in the subsequent hunk.  Can be fixed on commit.
>
> Otherwise, LGTM.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


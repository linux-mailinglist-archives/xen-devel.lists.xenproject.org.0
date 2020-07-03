Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7B21402D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 22:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrRpk-0001iB-66; Fri, 03 Jul 2020 19:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krI5=AO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jrRpi-0001i6-Vh
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 19:58:51 +0000
X-Inumbo-ID: 9ccc82f8-bd67-11ea-8496-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ccc82f8-bd67-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 19:58:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o2so35196060wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 12:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oqIa57g/7ALZ6VgxEdWVcdrSAKmoBsBprxucTRBdkVI=;
 b=O/DjwKLr7GUGJIXnULbijdN7UaQ6fRHmE8FFgnCtBCnmuNoAxP4WXQ3fH3ctZXiwEJ
 ZNzBNtdePZ+tB5z/f/HG8zBbKSMh2M9y9OH5pEb+C8UpJPUG+iMRgAQCFn00lTK+xCAZ
 As9JHph8y3XVSfT14W3dXhb7eU6BO/wiShRvossZg+oGGvIb3CUXa6avz5I6HcEuMqFe
 thjMzp6yP6r24YmSKp14rS1afXiw5RyCDF9r1asiF4JiGPSBlTvOXAq/7T7nXB6525vk
 RGq9zc0oaOaAK1nVpGNazYCOjVInXrIPYvTdrlgtKsJGq8PIVaVRtD5E2fF/MfIy9GWl
 CdNQ==
X-Gm-Message-State: AOAM530y+/C2qlL/DuX0ElZxOlwv7fq8kn9zBDQgmKiT14NIguZLAGf3
 SNScVfRl/w8alR1/DgfP04g=
X-Google-Smtp-Source: ABdhPJxLuHLtnfUkRo5on7fWfYTlNpM4/A4xZWQdZrDNY5jOYh8Oxcv81bmS20DYGnGeAss7lhALqg==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr37135950wme.96.1593806329510; 
 Fri, 03 Jul 2020 12:58:49 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w12sm15771710wrm.79.2020.07.03.12.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:58:48 -0700 (PDT)
Date: Fri, 3 Jul 2020 19:58:47 +0000
From: Wei Liu <wl@xen.org>
To: Tim Deegan <tim@xen.org>
Subject: Re: Build problems in kdd.c with xen-4.14.0-rc4
Message-ID: <20200703195847.nxamgjw6a2dayyoo@liuwe-devbox-debian-v2>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
 <20200703185457.GA71229@deinos.phlegethon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703185457.GA71229@deinos.phlegethon.org>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Michael Young <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 03, 2020 at 07:54:57PM +0100, Tim Deegan wrote:
> Hi Michael,
> 
> Thanks for ther report!
> 
> At 23:21 +0100 on 30 Jun (1593559296), Michael Young wrote:
> > I get the following errors when trying to build xen-4.14.0-rc4
> > 
> > kdd.c: In function 'kdd_tx':
> > kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
> >    754 |         s->txb[len++] = 0xaa;
> >        |         ~~~~~~^~~~~~~
> > kdd.c:82:17: note: while referencing 'txb'
> >     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> >        |                 ^~~
> > kdd.c: In function 'kdd_break':
> > kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
> 
> Oh dear.  The fix for the last kdd bug seems to have gone wrong
> somewhere.  The patch I posted has:
> 
> -        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
> +        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
> 
> but as applied in master it's:
> 
> -        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
> +        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> 
> i.e. the marshalling area is only large enough for a header and GCC
> is correctly complaining about that.
> 
> Wei, it looks like you committed this patch - can you figure out what
> happened to it please?
> 

My bad. The mail I saved did not apply cleanly so I manually recreated
your patch.

Thanks for letting me know. I will send a patch to fix the issue.

Wei.

> Cheers,
> 
> Tim.


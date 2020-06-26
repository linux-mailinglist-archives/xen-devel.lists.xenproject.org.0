Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F820AFCB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:33:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolfd-0003dP-Oc; Fri, 26 Jun 2020 10:33:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jolfb-0003dI-NH
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:33:19 +0000
X-Inumbo-ID: 735b2be2-b798-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 735b2be2-b798-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 10:33:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f18so8897124wml.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PITXihdp2Xt6NNW2tpgV1RVRNn4jiXT1dHTY0wmfecY=;
 b=eOJn4D9gnZjWnVq4ORVy5NU1lcCFOVbx9vSJLi0ukYlFwO9T3uA2L6KW7Rpsok9axh
 /Tf8TGYvvBcfRksgF/89+iddOSUdMGSan/uorsREnTWf2EougtZvM1KqcSlqPntHrlyW
 8z2LmANW2aCD4g3wlvhZhakOAG5qhSd8cjL8F4yAuVqYAvPULdF9f/aS0Fgyb/bTKtkC
 Cz9DkBfMyrP6TShw/WC9oDf2UCKUfZZQ1GCCXozyRoVlvvH6B8svpsuA6GyCiq1VH3F5
 QBx+CQUc4MXkgYz95aF95cg5L+U+cNki/Igm4XLkwqNbSqM0npP565kP5KvoRVC3ZA3E
 T6SQ==
X-Gm-Message-State: AOAM533rx8nT23aEPhxWp5dodClFYCKRdw8ns+woCMBlr/XBAHGgcS3f
 4zKxS2ftaggTaE8DBk89jpc=
X-Google-Smtp-Source: ABdhPJyxenN8GGMWfsJSbxo1xAJlSo/qj3C5T+o9NaXfHcLt5RXJWYmvTCG7fs9tmOQfLThdKxhR5w==
X-Received: by 2002:a1c:acc3:: with SMTP id v186mr2793556wme.79.1593167598355; 
 Fri, 26 Jun 2020 03:33:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p13sm25868337wrn.0.2020.06.26.03.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:33:17 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:33:16 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200626103316.gznsycu4cuqxwvdw@liuwe-devbox-debian-v2>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
 <20200611211004.11e38f8f.olaf@aepfle.de>
 <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
 <005a01d64480$49ce0730$dd6a1590$@xen.org>
 <20200626102654.e6ygxgnd37ptxosb@liuwe-devbox-debian-v2>
 <000401d64ba5$00424b40$00c6e1c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000401d64ba5$00424b40$00c6e1c0$@xen.org>
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
Cc: 'Olaf Hering' <olaf@aepfle.de>, 'Wei Liu' <wl@xen.org>,
 'Tim Deegan' <tim@xen.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Christopher Clark' <christopher.w.clark@gmail.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 11:31:48AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Wei Liu <wl@xen.org>
> > Sent: 26 June 2020 11:27
> > To: paul@xen.org
> > Cc: 'Christopher Clark' <christopher.w.clark@gmail.com>; 'Olaf Hering' <olaf@aepfle.de>; 'Tim Deegan'
> > <tim@xen.org>; 'xen-devel' <xen-devel@lists.xenproject.org>; 'Ian Jackson'
> > <ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>
> > Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> > 
> > On Wed, Jun 17, 2020 at 09:21:22AM +0100, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Christopher Clark <christopher.w.clark@gmail.com>
> > > > Sent: 16 June 2020 21:50
> > > > To: Olaf Hering <olaf@aepfle.de>
> > > > Cc: Tim Deegan <tim@xen.org>; xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson
> > > > <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; paul@xen.org
> > > > Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> > > >
> > > > On Thu, Jun 11, 2020 at 12:12 PM Olaf Hering <olaf@aepfle.de> wrote:
> > > > >
> > > > > Am Wed, 10 Jun 2020 20:16:57 +0100
> > > > > schrieb Tim Deegan <tim@xen.org>:
> > > > >
> > > > > > How tedious.
> > > > >
> > > > > Indeed. This compiles for me as well:
> > > >
> > > > just a nudge on this; it would be nice to get a patch into the tree
> > > > since the build failure affects master builds of Xen in OpenEmbedded
> > > > now.
> > > >
> > >
> > > I'd be happy to take a patch into 4.14 if someone can provide one with a suitable maintainer ack.
> > 
> > Tim is the maintainer of KDD. :-)
> > 
> > I take it you're happy with me committing his patch then?
> > 
> 
> I'm happy, but ought it not have an ack from 'the rest' since Tim submitted the patch?

Alright. FWIW:

Acked-by: Wei Liu <wl@xen.org>

> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks.

Wei.

> 
> > Wei.
> 


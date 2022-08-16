Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E99596165
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 19:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388461.625119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO0dU-0004nU-I1; Tue, 16 Aug 2022 17:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388461.625119; Tue, 16 Aug 2022 17:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO0dU-0004lW-Er; Tue, 16 Aug 2022 17:45:52 +0000
Received: by outflank-mailman (input) for mailman id 388461;
 Tue, 16 Aug 2022 17:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbGa=YU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oO0dT-0004lL-Pc
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 17:45:51 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4473f7c8-1d8b-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 19:45:50 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id kb8so20313868ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Aug 2022 10:45:50 -0700 (PDT)
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
X-Inumbo-ID: 4473f7c8-1d8b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=onRTyDW4osfpUPS9vsLkN+FsTCVHqgKoVm/tzVBiXOA=;
        b=o+CAu42obgnrbm2m+gbe1tnyfgvDPD7fGli8wdPsbuaIdJmcEmdxiXRbnerwbjn6CU
         h4Q9hnxG74eK1nHFLZQ9jWoe2nb6WEg81IyfAZ8jTHUpvKFmj8E5lMwaNCietlamSdpQ
         5JZ2QU4Q6nHeNt8btW0jG4WcGrJ5NJeBt1uoaDUMjdOr3eZBYgFPalzMJ/DvV/0MuzlS
         9CX1twF7Syymm8ROHwTJUz+uL8lsEFcALtprRQ3RGgRDzCTPGZUQvrtpGYjO8rfULtB3
         WRgYmJff1h27uuRhSj6DB932nyKkCeEZqEsosrOZX97goRnxDfEMkdxHhREhxgkyMcKH
         NWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=onRTyDW4osfpUPS9vsLkN+FsTCVHqgKoVm/tzVBiXOA=;
        b=DYNqK4TTCm+s+ytLYuVMWxV8wtubCwLBkHN2PoiMuhQMvf24dHZlgLUc5ra10s+ED/
         O96r2OsIUV0lxmTUhVLjDcwdCffGcG1qDF5tYxyaeYQyhkNJzIYh4zt6749uDTkwwx9i
         fj1Y7FKTsnETbpd58Ys2AZxlqablS+CH23beUNZmMU+EYtiOlakJxdNEzwsGg6N3k7IO
         shBxiZKnniGoe+O04Qqaq1msP3sPSHZPFOCN3b95fj4UwPa7hqEX6GKahZLuVY07Qxcd
         4fD1B8VCLA5kscxKrnKs+ViOlhmIkkKpzEQ2W1uzAYXNSjqZAI18CfkUkhXlMt75BfPr
         8UMQ==
X-Gm-Message-State: ACgBeo1KJ28FPjmPl0G/eSXUkenD6SzUmGQYs3JdDX3Fm/Yd3yWEUlVu
	to+4exFo48QKALWSSTcYjohPJHV97MUnSCuLsxg=
X-Google-Smtp-Source: AA6agR6CB3I1wzgxQMleH8byqaAYxJmI1g2XXeayQqR8f7b1p2Fij/e0ubC0hiUwOW4SDtJbVFtJowY9vIwZH5chvPE=
X-Received: by 2002:a17:907:2704:b0:734:e5ae:e1f5 with SMTP id
 w4-20020a170907270400b00734e5aee1f5mr11546703ejk.761.1660671949956; Tue, 16
 Aug 2022 10:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220808110545.62886-1-anthony.perard@citrix.com>
 <20220808110545.62886-3-anthony.perard@citrix.com> <CAKf6xpuyK-5-UH4JOVDHidVgE+GBsS8a947LyAOVNORQRpsfew@mail.gmail.com>
 <YvT2YQQmaKyiKMAK@perard.uk.xensource.com>
In-Reply-To: <YvT2YQQmaKyiKMAK@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 16 Aug 2022 13:45:38 -0400
Message-ID: <CAKf6xpvYbWnDPEeyd__o-+2r0MQpPLTXqUeAEdnaPukBM7oB6A@mail.gmail.com>
Subject: Re: [XEN PATCH 2/2] tools/libxl: Replace deprecated -soundhw on QEMU
 command line
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 8:30 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Tue, Aug 09, 2022 at 08:17:49AM -0400, Jason Andryuk wrote:
> > On Mon, Aug 8, 2022 at 7:06 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
> > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > index 6d98d73d76..b2901e04cf 100644
> > > --- a/docs/man/xl.cfg.5.pod.in
> > > +++ b/docs/man/xl.cfg.5.pod.in
> > > @@ -2555,9 +2555,9 @@ The form serial=DEVICE is also accepted for backwards compatibility.
> > >
> > >  =item B<soundhw="DEVICE">
> > >
> > > -Select the virtual sound card to expose to the guest. The valid
> > > -devices are defined by the device model configuration, please see the
> > > -B<qemu(1)> manpage for details. The default is not to export any sound
> > > +Select the virtual sound card to expose to the guest. The valid devices are
> > > +B<hda>, B<ac97>, B<es1370>, B<adlib>, B<cs4231a>, B<gus>, B<sb16> if there are
> > > +available with the device model QEMU. The default is not to export any sound
> > >  device.
> >
> > Is it worth mentioning driver support?  I think Windows 7 and later
> > only have a built-in driver for hda.  Windows 7 definitely doesn't
> > have a built-in driver for ac97.  I think all the other devices are
> > even older, so I doubt Windows has drivers for those, but I have not
> > checked.
>
> No, I don't think we can mention drivers support, we don't test any, it
> would be incomplete, and we can't do anything if a driver is broken.
> I've put "hda" first on the list in the hope that if someone wants a
> sound card but don't know which one to use, they will try this one
> first.

Ok.  That sounds fine.

Thanks,
Jason


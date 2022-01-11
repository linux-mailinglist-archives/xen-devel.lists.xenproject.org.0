Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2048AE83
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 14:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255729.438307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7HII-0000Aj-Gn; Tue, 11 Jan 2022 13:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255729.438307; Tue, 11 Jan 2022 13:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7HII-000088-Dj; Tue, 11 Jan 2022 13:34:34 +0000
Received: by outflank-mailman (input) for mailman id 255729;
 Tue, 11 Jan 2022 13:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMrX=R3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n7HIH-000082-1W
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 13:34:33 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35031930-72e3-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 14:34:31 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id u13so56233852lff.12
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jan 2022 05:34:31 -0800 (PST)
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
X-Inumbo-ID: 35031930-72e3-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrDAom7H8/BgHjxioCEdiqbAtMaOUx3qoD8k8GLwEW4=;
        b=bLcPlaUbugOH/J+Ywj+IzUy4u3pBk1dp+MM/4vD+RhO6F76d7/cI6u/+wXtXFKZ2d+
         kbe8YazyTTBcl+bP4v9COe2iRwL0CGOtTCWHchrE5G0av8ADsEA5FJzqV42GRiS7te1h
         8ineTnUEF3iIGZ05Zs8Ni/t4bBPand/65+Nd8qlKzn6F/hqSxv1htc7iV6mahvPT7pY0
         2I5+iu0bEMg3eB5SAdzRnMil0z8YUgHh8/1ndN/tB2jcTsp0SWLjcilJd/DBQaE8tGqx
         K7xoY9cIKO7JloJBo1vCLLqo1RbiQ8i1qQrooiUxld/bSfMIxndXN9ESGjcTOES4uPrN
         YuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrDAom7H8/BgHjxioCEdiqbAtMaOUx3qoD8k8GLwEW4=;
        b=Tp6WBDr10bi3FP40ZuqmGLGVcM8yRBwybp734B5n2JnVgzYcUA3FzL7IJoyJavyuP3
         wX4huO73e4gycPzi8gWW9f9Nv2uLm3kuHSfYa7aOUObNrpHNyG0DKlLH5RWGuj06rZHf
         kgpdxLpQGN4JHUgBx50Lm3eV9SzK8m6iDHbmZ9HWEKLsMv+a9SBFyUedAjw4Ov0o5Qyf
         2MamXo1wIbolDPtGWvFhJisIGliX/DcamllKef4PjSt7c0U7RFblHvREaj7rvcNgUlaO
         QmjUrM1IgNijhb3cOKvyBeJQH51hYliQzMFxHaLmJn5qv4ldAD+tV6GrjHRTNy/oq8t3
         aygw==
X-Gm-Message-State: AOAM5312aWsgZ4QP9Y2FuROTMk0Tmqfm8W/82WtqqUE2amPMiKNcwsjR
	GeQJiCBKM2zl4YGsImDJdEOWJejN11q5x2RXecU=
X-Google-Smtp-Source: ABdhPJxAAPiX2BayI7ph3fkLvEDlgDKsCGGMPHaywqAdlpy4vb8s2PBSphDHyOum2cSAmpykueMjWElxqs6R4DyJtGQ=
X-Received: by 2002:a2e:9bd8:: with SMTP id w24mr2916482ljj.19.1641908070817;
 Tue, 11 Jan 2022 05:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20220109180436.4112-1-jandryuk@gmail.com> <e6176548-2d32-05c5-1132-6a658c9e313a@suse.com>
In-Reply-To: <e6176548-2d32-05c5-1132-6a658c9e313a@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Jan 2022 08:34:19 -0500
Message-ID: <CAKf6xpuO1T_P5N67puHmxpTfXQqSVeJ6wXNosJTWm=kM-zQ+fg@mail.gmail.com>
Subject: Re: [PATCH v3] libxl/PCI: Fix PV hotplug & stubdom coldplug
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 4:09 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> (also Cc-ing Paul)

Thanks.

> On 09.01.2022 19:04, Jason Andryuk wrote:
> > commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> > reflected in the config" broken PCI hotplug (xl pci-attach) for PV
> > domains when it moved libxl__create_pci_backend() later in the function.
> >
> > This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
> > PCI devices are hotplugged to a running PV stubdom, and then the QEMU
> > QMP device_add commands are made to QEMU inside the stubdom.
> >
> > Are running PV domain calls libxl__wait_for_backend().
>
> I could only make sense of this when replacing "Are" by "A", but then
> I'm not sure that's what you've meant.

Yes, "A".

> >  With the current
> > placement of libxl__create_pci_backend(), the path does not exist and
> > the call immediately fails:
> > libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> > libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> > libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> >
> > The wait is only relevant when the backend is already present.  num_devs
> > is already used to determine if the backend needs to be created.  Re-use
> > num_devs to determine if the backend wait is necessary.  The wait is
> > necessary to avoid racing with another PCI attachment reconfiguring the
> > front/back or changing to some other state like closing. If we are
> > creating the backend, then we don't have to worry about the state since
> > it is being created.
>
> While I follow all of this, what I'm missing here is some form of proof
> why the wait is _not_ needed for a newly created backend.  Isn't it
> necessary for the backend to reach Connected also when putting in place
> the first device, in order for the guest to be able to actually use the
> device?

The backend creation is now done as part of the xenstore transaction,
see "This is the first device, so create the backend" in
libxl__device_pci_add_xenstore().  That is part of Paul's change in
0fdb48ffe7a1.  Before that, it created the backend and waited.

> Is it perhaps assumed that the frontend driver would wait for
> the backend reaching Connected (emphasizing the difference to HVM,
> where no frontend driver exists)? Whatever the answer, it may be
> worthwhile to also add that (in suitably abbreviated form) to the newly
> added code comment.

I think my starting vs. !starting comment below will clarify this.

> > Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> > reflected in the config")
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > Alternative to Jan's patch:
> > https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/
>
> This answers the question raised in reply to Anthony's comment on my
> patch.
>
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
> >      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
> >          return ERROR_FAIL;
> >
> > -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> > -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> > +    /* wait is only needed if the backend already exists (num_devs != NULL) */
> > +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> > +        if (libxl__wait_for_backend(gc, be_path,
> > +                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
> >              return ERROR_FAIL;
> >      }
> >
>
> In how far is the !starting part of the condition then still needed? I
> have to admit that I've been wondering about the applicability of this
> condition anyway, and your patch description actually seems to further
> support my suspicion about this not being quite right (which is
> connected to the fact that devices get added one by one instead of all
> in one go, which would avoid the need for the backend to reconfigure
> at all during domain creation).

In the starting case, libxl can write all the xenstore entries without
waiting.  The frontend is not running, so this function is called
multiple times and the additional subdevices are written.

But you have a point that the backend is running and will see the
xenstores entries.  However, Reconfiguring is only set when !starting.
And since the frontend is not running when starting, then the backend
cannot have transitioned to Connected.  Looking at xen-pciback, it
waits for the frontend to go to Initialized (From Initializing) before
transitioning to Connected.  So the multiple independent xenstore
writes accumulate for the starting case.

In the !starting (running) case, the code adds subdevices one at a
time and waits for each reconfiguration to complete prior to modifying
the xenstore state.

You previously mentioned wanting all the devices at written at once.
libxl is written to handle 1 device at a time.  That works fine for
most PV devices, but PCI with subdevices doesn't fit that paradigm.
While the PV xenstore writes could be done as a single transaction,
HVM still requires individual QMP device_add commands per device.  It
could be made to work, but it seemed like more work than it is worth
and doesn't seem to mesh well with the rest of libxl.

> Two nits:
>
> With tools/libs/light/CODING_STYLE not saying anything about comment
> style, imo ./CODING_STYLE applies, which demands comments to start with
> a capital letter.

Yes, this sounds good.

> Plus, while I'm not sure what the conventions in libxl are, touching this
> code would seem like a great opportunity to me to fold the two if()-s.

I prefer them separate.  There are two logical conditions - "do we
need to wait?" and "did the wait succeed?".  Keeping them separate
maintains that distinction, and it is more readable IMO.

Regards,
Jason


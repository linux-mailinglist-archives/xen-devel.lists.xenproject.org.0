Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D53EF738
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 03:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168037.306786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGA9V-0008Dl-Fe; Wed, 18 Aug 2021 01:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168037.306786; Wed, 18 Aug 2021 01:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGA9V-0008Ar-CY; Wed, 18 Aug 2021 01:13:57 +0000
Received: by outflank-mailman (input) for mailman id 168037;
 Wed, 18 Aug 2021 01:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyGE=NJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mGA9U-0008Al-CW
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 01:13:56 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae386fc9-6744-421a-8401-2aa2511d57c8;
 Wed, 18 Aug 2021 01:13:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y34so939494lfa.8
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 18:13:54 -0700 (PDT)
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
X-Inumbo-ID: ae386fc9-6744-421a-8401-2aa2511d57c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZtD15Oj40WlZ4qJXP90qQeVnazpIR7sKFVGQYiT8cSo=;
        b=TY0YqF+Hm3KexHJjKDMJYnBg/rc0S6QxbIFRtNd5nTDz5NWnhqLY8LjJKObPZK7zXd
         cMEypYnnMSqR1eBEDJWralHCEr/GLFhxvfkA59YWLGybXm1THHQ0X/BnVuHPu3Z6jekT
         4QBaerQ5bxPpmTFExdty8Yx+EGgk8rZcdZj+KAOCcQk7vQZTOIjOs3ShB5iWdjFgx1+3
         g4zFmorNalb3WX1nhCNxDs6mOtIyLwDGjHnzlitnuqueAHE39zK4pa3E8hoUl7xr0mdI
         H9n5ODVsXplvC4UAN0XNR4lEL95NTKONSFj6Twgo6xq/LXrLM/Qw6/KZYdiEiC1jTf9M
         foJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZtD15Oj40WlZ4qJXP90qQeVnazpIR7sKFVGQYiT8cSo=;
        b=H6VKDwabbZ/1jetjbCGmTxyF3kmD0D6eYi9xuS7ikBiRloNAUjccyfBVhBEKnRTPz3
         P657VgT4wOlhIKGPxq4gDiXnna/W7giQBdnAWF6vSLdels2S8cO0pBUS/GjE4ArwONGY
         qzcXq02aolKBUjvGnlf/4GknR5oIIG9HND6JjzX6msHfbOeqQGBv+GyC5MG2/6I9v0lL
         2mLbNs38r9m1DR+1XkLIhmXpAmU2MwQ7TxPG83+f+jGYqdmEDtN+hNaX0d0zzftriYqt
         DVTrAu6Ny2roPt7mfevmVbj7nBwvgSuLib8W3ekQpff7tuG8br1ROJm4sHnMUOLZDeKh
         QlZQ==
X-Gm-Message-State: AOAM5333TFMmpKkZZD+OB6hYWgUqGgEYOPoUvlfYhjALUWkg1TK2g5Ov
	S6LCmHY/I2TYN+ccK/CrHlI4mJSKdQjZ2IEbfiA=
X-Google-Smtp-Source: ABdhPJwRpCPUMc7nnPJIjANNBSckD4KWKEnp90aQf7CmFDPU1qPVc+bqCEttay/S0R+olIOFEfEyO1Nv0Z6c526eRus=
X-Received: by 2002:a05:6512:3203:: with SMTP id d3mr4540060lfe.659.1629249233680;
 Tue, 17 Aug 2021 18:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210812005700.3159-1-jandryuk@gmail.com> <24859.43747.87671.739214@mariner.uk.xensource.com>
In-Reply-To: <24859.43747.87671.739214@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Aug 2021 21:13:41 -0400
Message-ID: <CAKf6xptzFviWdyCC001HTVo2pXfNXXkwWOqGwy+5zbu5T85Qog@mail.gmail.com>
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <pdurrant@amazon.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 8:26 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Jason Andryuk writes ("[PATCH v2] libxl: Fix stubdom PCI passthrough"):
> > commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> > reflected in the config" broken stubdom PCI passthrough when it moved
> > libxl__create_pci_backend later in the function.  xl pci-attach for a
> > running PV domain may also have been broken, but that was not verified.
> >
> > The stubdomain is running (!starting) and PV, so it calls
> > libxl__wait_for_backend.  With the new placement of
> > libxl__create_pci_backend, the path does not exist and the call
> > immediately fails.
> ...
> > The wait is only relevant when the backend is already present.  num_devs
> > is already used to determine if the backend needs to be created.  Re-use
> > num_devs to determine if the backend wait is necessary.  The wait is
> > necessary to avoid racing with another PCI attachment reconfiguring the
> > front/back. If we are creating the backend, then we don't have to worry
> > about a racing reconfigure.
>
> Thanks for working on this.  Sorry it's taken a while for me to look
> at this properly.  It seems very complicated.  I confess I am
> confused.  I wonder if I actually understand properly how the code in
> tree is supposed to work.  So if I seem not to be making sense, please
> explain :-).
>
>
> AFAICT what you are saying is that:
>
>   In 0fdb48ffe7a1, pci-attach was moved later in the setup, until a time
>   after the stubdomain is running.  So that code now always runs with
>   !starting, when previously it would run with !!starting.

No, it's not a starting vs. starting issue.  More that the
0fdb48ffe7a1 change didn't consider the !starting case.

We have 3 cases:
PV domain - use xen-pcifront/back
HVM - use QEMU QMP (Modern QEMU - I'm not sure about qemu-traditional)
HVM with Stubdom - xen-pcifront/back to stubdom + QEMU (QMP or
xenstore (traditional)).

Stubdomain is always !starting (running) when the guest is starting.
I think this is so that QEMU is running and can handle QMP commands.

>   libxl__wait_for_backend fails if the backend path does not exist;
>   previously, when the domain is being created, the wait would be
>   skipped.  Now because !starting, the wait is done, and fails because
>   the backend path is missing.

Previously, the backend was created before the wait was called.  The
diff for 0fdb48ffe7a1 shows the movement of the call to
libxl__create_pci_backend().  It's not shown in the diff, but
libxl__wait_for_backend() does not move which leads to the wait for a
non-existent node.

>   The purpose of the wait is to make sure the frontend is ready to
>   accept the instructions, mostly to prevent multiple pci attach
>   happening simultaneously.
>
> You are using num_devs to see whether the backend exists already, so
> as to skip the failing check.  I don't think that is right.  But I'm
> not sure the old code is right either.

num_devs is used pre and post-0fdb48ffe7a1 to control behaviour.  My
change just adds another case.

commit 70628d024da4 "libxl: Multi-device passthrough coldplug: do not
wait for unstarted guest" which you reference below explains the
num_devs use.

> If you are right about the reason for the wait, it does not seem
> correctly placed.  There is surely a TOCTOU race: first, we do the
> wait, and then we write, non-transactionally, to xenstore.  If two of
> these processes run at once, they could both decide not to wait,
> then both try to create the backend and trample on each other.

Yes, two simultaneous "1st" adds would want to create the backend and clash.

> This kind of thing is usually supposed to be dealt with by a
> combination of the userdata lock (for the config) and xenstore
> transaction but the code here doesn't seem to do that correctly.
>
> Shouldn't all of this looking at xenstore occur within the transaction
> loop ?  What this code seems to do is read some things
> nontransactionally, then enter a transaction, and then make some
> writes based on a combination of the pre-transaction and
> within-transaction data.  In particular `num_devs` is read
> nontransactionally and then written within the transaction, without, I
> think being checked for subsequent modification.
>
> Also, I think the purpose of `starting` is to avoid waiting for the
> backend to be stable before the frontend is actaully unpaused, in
> which case presumably the backend would never be Connected and we
> would deadlock (and eventually time out).  In general when we are
> hot-adding we must wait for the frontend and backend to be stable
> before saying we're done, whereas with cold-adding we set up the
> information and simply hope (expect) it all to sort itself out while
> the domain boots.  So, I would be expecting to see the wait to happen
> *after* the add.
>
> There is also the wrinkle that the non-pci code is differently
> structured, because it must not use libxl__wait_for_backend at all.
> libxl__wait_for_backend is synchronous and blocking the whole libxl
> process for an extended time is not allowed.  But AIUI we have made an
> exception for pci because the pci backend is always in dom0 and
> trusted.

I think the wrinkle is that the single PCI backend hosts multiple devices.

> I looked through the git history.
>
> Very relevant seems
>    70628d024da42eea
>    libxl: Multi-device passthrough coldplug: do not wait for unstarted guest
> which has some explanation from me in the commit message.  I'm not
> sure why I didn't spot the anomalous transaction use problem.
>
>
> Also I found
>    1a734d51902dff44
>    libxl: fix cold plugged PCI device with stubdomain
> and, would you believe it
>    18f93842ac3c2ca4
>    libxl: fix cold plugged PCI devices with stubdomains
> which seems at least tangentially relevant, showing that this seems
> persistently to break :-(.  This suggests quite strongly that we
> should add some tests for pci passthrough including at least one for
> stubdom coldplug.
>
> Also:
>    b6c23c86fe5a1a02
>    libxl: add all pci devices to xenstore at once (during VM create)
> which seems OK.
>
> There has been a lot of refactoring, but much of it hasn't really
> changed the structure of this function.
>
> The issue I identify above, with the inconsistent use of transactions,
> seems to have existed since the very beginning.  In
>    b0a1af61678b5e4c
>    libxenlight: implement pci passthrough
> the `retry_transaction:` label seems to me to be in the wrong place.
>
>
> I have CC'd Paul and Oleksandr (committer/reviewer of 0fdb48ffe7a1),
> Marek (seems to have touched a lot of the stubdom code here) and
> Stefano (original author of the pci passthrough code here)
> in case they would like to comment...

Regards,
Jason

